<?php
require_once("config.php");
class carreraCentroModel
{

    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
    * Retorna las carreras no pertenecientes a un centro
    * */
    public function carrerasNoPertenecientesAUnCentro($centroId)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getCarrerasNoPertenecientesAlCentro(?)");
        $stmt->bindParam(1, $centroId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
   * Retorna las carreras npertenecientes a un centro
   * */
    public function carrerasPertenecientesAUnCentro($centroId)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getCarrerasPertenecienteAlCentro(?)");
        $stmt->bindParam(1, $centroId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
   * Envia los registros actualizados
     * de las carreras pertenecientes al centro para ser actualizados o insertados.
     *
     * Despues, verifica que registros quito el usuario
     * y los deshabilita
   * */
    public function habilitarCarreraCentro($carrerasCentro)
    {
        $conexion = $this->db->conectar();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        try {
            $conexion->beginTransaction();
            $stmt = $conexion->prepare('call filtro_getCarreraCentroPorCentro(?)');
            $stmt->execute([$carrerasCentro[0]['centroId']]);
            $actuales = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            // El valor 0 significa dejar el centro sin carreras; no es una carrera.
            $seleccionadas = [];
            foreach ($carrerasCentro as $carrera) {
                if ($carrera['carreraId'] > 0) {
                    $seleccionadas[(int) $carrera['carreraId']] = $carrera;
                }
            }

            $deshabilitar = $conexion->prepare('call filtro_deshabilitarCarreraCentro(:Id)');
            foreach ($actuales as $actual) {
                if (!isset($seleccionadas[(int) $actual['Carrera_Id']])) {
                    $deshabilitar->execute(['Id' => $actual['Id']]);
                    $deshabilitar->closeCursor();
                }
            }

            $habilitar = $conexion->prepare('call filtro_habilitar_carrera_centro(:carreraId,:centroId)');
            foreach ($seleccionadas as $carrera) {
                $habilitar->execute($carrera);
                $habilitar->closeCursor();
            }
            $conexion->commit();
            return 'ok';
        } catch (Throwable $error) {
            if ($conexion->inTransaction()) $conexion->rollBack();
            error_log('Error al asignar carreras al centro: ' . $error->getMessage());
            return 'errorGuardar';
        }
    }
    /*
  * Destrulle la instancia del Modelo
  * */
    function __destruct()
    {
        $this->db = null;
    }
}