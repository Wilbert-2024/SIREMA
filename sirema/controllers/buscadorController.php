<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/buscadorModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class buscadorController
{

    protected $model;
    function __construct()
    {
        $this->model = new buscadorModel();

    }
    /*
     * Envia los registros de centros
     * que coinciden con la busqueda
     * */
    public function filtroCentro($descricion)
    {
        $result = $this->model->filtroCentro($descricion);

        return $result;
    }

    /*
   * Destrulle la instancia del controlador
   * */
    function __destruct()
    {
        $this->model = null;
    }
}