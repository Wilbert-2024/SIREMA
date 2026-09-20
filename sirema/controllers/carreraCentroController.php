<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/centroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/carreraCentroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class carreraCentroController
{
    protected $model;
    protected $modelCentro;

    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new carreraCentroModel();
        $this->modelCentro = new centroModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
        //session_start();
    }

    /*
     * Mostrar los centros activos de BICU
     * */
    public function getCentros()
    {
        return $this->modelCentro->index();
    }

    /*
     * Conseguir las carreras no pertenecientes al centro seleccionado
     * */
    public function getCarrerasNoPertenecientes($centroId)
    {
        return $this->model->carrerasNoPertenecientesAUnCentro($centroId);
    }

    /*
     * Conseguir las carreras pertenecientes al centro seleccionado
     * */
    public function getCarrerasPertenecientes($centroId)
    {
        return $this->model->carrerasPertenecientesAUnCentro($centroId);
    }

    /*
     * Envia nueva lista de carreras por el centro a ser actualizados o insertados
     * */
    public function habilitarCarreraCentro($datos)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('CACECR');
        if(!$estado['Estado'])
            return 'denegado';
        return $this->model->habilitarCarreraCentro($datos);
    }
    /*
    * Destrulle la instancia del controlador
    * */
    function __destruct()
    {
        $this->model = null;
    }
}