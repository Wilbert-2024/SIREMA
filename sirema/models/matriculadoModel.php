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

    /*
     * Insertar registro_matricula con su detalle
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call registro_matricula_crear(?,?,?,?,?,?,?)");
        $stmt->bindParam(1,  $data['CentroId'], PDO::PARAM_INT);
        $stmt->bindParam(2,  $data['CarreraId'], PDO::PARAM_INT);
        $stmt->bindParam(3,  $data['TipoIngresoId'], PDO::PARAM_INT);
        $stmt->bindParam(4,  $data['SemestreId'], PDO::PARAM_INT);
        $stmt->bindParam(5,  $data['AnioLectivoId'], PDO::PARAM_INT);
        $stmt->bindParam(6,  $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->bindParam(7,  $data['Total'], PDO::PARAM_INT);

        $stmt->execute();

        $id = $stmt->fetch(PDO::FETCH_ASSOC);

        if($id == null)
            return 'noInsert';
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
        $stmt = $this->db->conectar()->prepare("call registro_detalle_matriculados_crear(:matriculaId,:anioCarreraId,:modalidadId,:grupoId, :turnoId,:femenino,:masculino)");
        /*
         * Insertar un nuevo registro
         * */
        foreach ($detalle as $det) {
            $stmt->execute($det);
            $stmt->closeCursor();
        }
        return 'ok';

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