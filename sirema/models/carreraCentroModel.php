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
        //Conseguir lista de carreras por el centro
        $stmt = $this->db->conectar()->prepare("call filtro_getCarreraCentroPorCentro(?)");
        $stmt->bindParam(1, $carrerasCentro[0]['centroId'], PDO::PARAM_INT);
        $stmt->execute();

        $carrrerasPorCentroDB = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt->closeCursor();

        $registrosCarreraCentroEliminados = [];
        $index = 0;
        $noDentro = false;
        /*
         * Filtrar la lista de carreras centro de la base de datos
         * contra la lista de carreras centro enviada por el usuario.
         * Los que no se encuetran en la lista del usuario se ingresaran dentro del
         * arreglo de $registrosCarreraCentroEliminados
         * */
        foreach ($carrrerasPorCentroDB as $cc)
        {
            if($carrerasCentro[0]['carreraId'] != 0) {
                foreach ($carrerasCentro as $ucc) {
                    if (intval($ucc['centroId']) == intval($cc['Centro_Id']) && intval($ucc['carreraId']) == intval($cc['Carrera_Id'])) {
                        $noDentro = false;
                        break;
                    } else {
                        $noDentro = true;
                    }

                }
            }
            else
                $noDentro = true;

            if($noDentro)
            {
                $re['Id'] =$cc['Id'];
                $registrosCarreraCentroEliminados[$index] = $re;
                $index++;
            }
        }

        /*
         * Proceso para deshabilitar carreras por centro
         * */
        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call filtro_deshabilitarCarreraCentro(:Id)");
        foreach ($registrosCarreraCentroEliminados as $cce)
        {
            $stmt->execute($cce);
            $stmt->closeCursor();
         }

       $stmt = null;
        //Insertar nuevo registros o actualizar registro con Estado = 1
       $stmt = $this->db->conectar()->prepare("call filtro_habilitar_carrera_centro(:carreraId,:centroId)");
        /*
         * Actualizar los registros existentes o inserta los nuevos
         * */
       foreach ($carrerasCentro as $cc)
        {
            $stmt->execute($cc);
            $stmt->closeCursor();
        }

        return 'ok';
    }
    /*
  * Destrulle la instancia del Modelo
  * */
    function __destruct()
    {
        $this->db = null;
    }
}