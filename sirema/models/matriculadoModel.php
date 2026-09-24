<?php
require_once("config.php");
class matriculadoModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    public function index($data)
    {
        $stmt = $this->db->conectar()->prepare("call registro_matricula_index(?,?,?,?,?)");
        $stmt->bindParam(1,  $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->bindParam(2,  $data['centroId'], PDO::PARAM_INT);
        $stmt->bindParam(3,  $data['carreraId'], PDO::PARAM_INT);
        $stmt->bindParam(4,  $data['anioLectivoId'], PDO::PARAM_INT);
        $stmt->bindParam(5,  $data['tipoIngresoId'], PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    /*
     * Retorna la lista de centros permitidos al usuario actual
     * */
    public function getCentros($tipo)
    {
        $stmt = $this->db->conectar()->prepare("call permiso_centros_usuario(?,?)");
        $stmt->bindParam(1,  $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->bindParam(2,  $tipo, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Retorna la lista de carreras permitidos el centro y el usuario actual
     * */
    public function getCarreras($centroId)
    {
        $stmt = $this->db->conectar()->prepare("call permiso_carreras_centro_usuario(?,?)");
        $stmt->bindParam(1,  $centroId, PDO::PARAM_INT);
        $stmt->bindParam(2,  $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Retorna la lista de turnos por una modalidad
     * */
    public function getTurnos($modalidadId)
    {
        $stmt = $this->db->conectar()->prepare("call turnos_de_modalidad(?)");
        $stmt->bindParam(1,  $modalidadId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getEtnias()
    {
        $stmt = $this->db->conectar()->query("SELECT Id, DescripcionEtnia FROM etnia WHERE Estado = 1 ORDER BY Id");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getMatriculaParaEtnia($id, $usuario, $conexion = null, $bloquear = false)
    {
        if ($conexion === null) $conexion = $this->db->conectar();
        $sql = "SELECT r.Id, r.Total, r.Estado, c.DescripcionCentro AS Centro,
                       ca.DescripcionCarrera AS Carrera
                FROM registro_matricula r
                JOIN carrera_centro cc ON cc.Id = r.CarreraCentro_Id
                JOIN centro c ON c.Id = cc.Centro_Id
                JOIN carrera ca ON ca.Id = cc.Carrera_Id
                JOIN usuario_centros uc ON uc.Centro_Id = cc.Centro_Id
                JOIN usuarios u ON u.Id = uc.Usuarios_Id
                WHERE r.Id = ? AND u.NombreUsuario = ? AND r.Estado = 1
                LIMIT 1";
        if ($bloquear) $sql .= " FOR UPDATE";
        $stmt = $conexion->prepare($sql);
        $stmt->execute([$id, $usuario]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getDistribucionEtnica($id)
    {
        $matricula = $this->getMatriculaParaEtnia($id, $_SESSION['usuario']);
        if (!$matricula) return null;
        $stmt = $this->db->conectar()->prepare(
            "SELECT e.Id AS EtniaId, e.DescripcionEtnia, COALESCE(d.Cantidad, 0) AS Cantidad
             FROM etnia e LEFT JOIN resgistro_matricula_etnia d
             ON d.Etnia_Id = e.Id AND d.RegistroMatricula_Id = ?
             WHERE e.Estado = 1 ORDER BY e.Id"
        );
        $stmt->execute([$id]);
        $matricula['Etnias'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $matricula;
    }

    public function listarReporteEtnico($usuario)
    {
        $sql = "SELECT r.Id, r.Total, c.DescripcionCentro AS Centro,
                       ca.DescripcionCarrera AS Carrera,
                       COALESCE(d.TotalEtnias, 0) AS TotalEtnias,
                       COALESCE(d.NumEtnias, 0) AS NumEtnias
                FROM registro_matricula r
                JOIN carrera_centro cc ON cc.Id = r.CarreraCentro_Id
                JOIN centro c ON c.Id = cc.Centro_Id
                JOIN carrera ca ON ca.Id = cc.Carrera_Id
                LEFT JOIN (
                    SELECT RegistroMatricula_Id, SUM(Cantidad) AS TotalEtnias,
                           COUNT(*) AS NumEtnias
                    FROM resgistro_matricula_etnia GROUP BY RegistroMatricula_Id
                ) d ON d.RegistroMatricula_Id = r.Id
                WHERE r.Estado = 1 AND EXISTS (
                    SELECT 1 FROM usuario_centros uc
                    JOIN usuarios u ON u.Id = uc.Usuarios_Id
                    WHERE uc.Centro_Id = cc.Centro_Id AND u.NombreUsuario = ?
                ) ORDER BY r.Id DESC";
        $stmt = $this->db->conectar()->prepare($sql);
        $stmt->execute([$usuario]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function guardarDistribucionEtnica($id, $etnias)
    {
        $conexion = $this->db->conectar();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        try {
            $conexion->beginTransaction();
            $matricula = $this->getMatriculaParaEtnia($id, $_SESSION['usuario'], $conexion, true);
            if (!$matricula) {
                $conexion->rollBack();
                return 'noEncontrada';
            }
            $activos = [];
            $stmt = $conexion->query("SELECT Id FROM etnia WHERE Estado = 1");
            foreach ($stmt->fetchAll(PDO::FETCH_COLUMN) as $etniaId) $activos[(int) $etniaId] = true;
            if (!$activos || count($etnias) !== count($activos)) {
                $conexion->rollBack();
                return 'etniasInvalidas';
            }
            $vistos = [];
            $suma = 0;
            foreach ($etnias as $etnia) {
                if (!is_array($etnia) || !isset($etnia['EtniaId'], $etnia['Cantidad']) ||
                    !is_scalar($etnia['EtniaId']) || !is_scalar($etnia['Cantidad']) ||
                    !preg_match('/^[1-9][0-9]*$/D', (string) $etnia['EtniaId']) ||
                    !preg_match('/^(0|[1-9][0-9]*)$/D', (string) $etnia['Cantidad']) ||
                    strlen((string) $etnia['Cantidad']) > 10 ||
                    (float) $etnia['Cantidad'] > 2147483647) {
                    $conexion->rollBack();
                    return 'etniasInvalidas';
                }
                $etniaId = (int) $etnia['EtniaId'];
                if (!isset($activos[$etniaId]) || isset($vistos[$etniaId])) {
                    $conexion->rollBack();
                    return 'etniasInvalidas';
                }
                $vistos[$etniaId] = true;
                $suma += (int) $etnia['Cantidad'];
            }
            if ($suma !== (int) $matricula['Total']) {
                $conexion->rollBack();
                return 'etniasInvalidas';
            }
            $stmt = $conexion->prepare("DELETE FROM resgistro_matricula_etnia WHERE RegistroMatricula_Id = ?");
            $stmt->execute([$id]);
            $stmt = $conexion->prepare("INSERT INTO resgistro_matricula_etnia (RegistroMatricula_Id, Etnia_Id, Cantidad) VALUES (?, ?, ?)");
            foreach ($etnias as $etnia) {
                $stmt->execute([$id, (int) $etnia['EtniaId'], (int) $etnia['Cantidad']]);
            }
            $conexion->commit();
            return 'ok';
        } catch (Throwable $error) {
            if ($conexion->inTransaction()) $conexion->rollBack();
            error_log('Error al guardar distribucion etnica: ' . $error->getMessage());
            return 'errorGuardar';
        }
    }

    /*
     * Insertar registro_matricula con su detalle
     * */
    public function insert($data)
    {
        $conexion = $this->db->conectar();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conexion->beginTransaction();
        try {
            $stmt = $conexion->prepare("call registro_matricula_crear(?,?,?,?,?,?,?)");
            $stmt->bindParam(1,  $data['CentroId'], PDO::PARAM_INT);
            $stmt->bindParam(2,  $data['CarreraId'], PDO::PARAM_INT);
            $stmt->bindParam(3,  $data['TipoIngresoId'], PDO::PARAM_INT);
            $stmt->bindParam(4,  $data['SemestreId'], PDO::PARAM_INT);
            $stmt->bindParam(5,  $data['AnioLectivoId'], PDO::PARAM_INT);
            $stmt->bindParam(6,  $_SESSION['usuario'], PDO::PARAM_STR);
            $stmt->bindParam(7,  $data['Total'], PDO::PARAM_INT);

            $stmt->execute();

            $id = $stmt->fetch(PDO::FETCH_ASSOC);

            $stmt->closeCursor();
            if($id == null) {
                $conexion->rollBack();
                return 'noInsert';
            }
            /*
             *Guardar detalles de registro de matriculados
             * */
            $detalle = [];
            $index = 0;
            foreach ($data['DetalleRegistro'] as $reg) {
                $detalle[$index] =
                    [
                        'matriculaId' => $id['lastId'],
                        'anioCarreraId' => $reg['AnioCarreraId'],
                        'modalidadId' => $reg['ModalidadId'],
                        'grupoId' => $reg['GrupoId'],
                        'turnoId' => $reg['TurnoId'],
                        'femenino' => $reg['Femeninos'],
                        'masculino' => $reg['Masculinos'],
                    ];
                $index++;
            }

            //Insertar nuevo registros
            $stmt = $conexion->prepare("call registro_detalle_matriculados_crear(:matriculaId,:anioCarreraId,:modalidadId,:grupoId, :turnoId,:femenino,:masculino)");
            /*
             * Insertar un nuevo registro
             * */
            foreach ($detalle as $det) {
                $stmt->execute($det);
                $stmt->closeCursor();
            }
            $conexion->commit();
            return 'ok';
        } catch (Throwable $error) {
            if ($conexion->inTransaction()) {
                $conexion->rollBack();
            }
            error_log('Error al guardar matricula: ' . $error->getMessage());
            return 'errorGuardar';
        }
    }


    /*
    * Retorna la lista de centros permitidos al usuario actual
    * */
    public function anularRegistro($id)
    {
        $stmt = $this->db->conectar()->prepare("call registro_matricula_anular(?)");
        $stmt->bindParam(1,  $id, PDO::PARAM_STR);

        if($stmt->execute())
            return 'ok';

        return 'error';

    }
    /*
   * Destrulle la instancia del Modelo
   * */
    function __destruct()
    {
        $this->db = null;
    }

}
