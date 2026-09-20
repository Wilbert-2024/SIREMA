<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class funcionUsuarioController
{

    protected $model;
    function __construct()
    {
        $this->model = new funcionUsuarioModel();
    }

    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->model = null;
    }

    /*
    * Envia nuevo registro de anio carrera para ser almacenado
    * */
    public function getUsuariosActivos()
    {
        $anio = $this->model->getUsuariosActivos();

        return $anio;
    }

    /*
    * Envia la lista de registros NO pertenecientes al usuario
    * */
    public function getRegistrosNoPertenecientes($data)
    {
        if($data['fun'] == 'cen')
        {
            $registro = $this->model->centrosNoPertenecientesAlUsuario($data);
        }

        if($data['fun'] == 'fun')
        {
            $registro = $this->model->funcionesNoPertenecientesAlUsuario($data);
        }

        return $registro;
    }

    /*
     * Envia la lista de registros pertenecientes al usuario
     * */
    public function getRegistrosPertenecientes($data)
    {
        if($data['fun'] == 'cen')
        {
            $registro = $this->model->centrosPertenecientesAlUsuario($data);
        }

        if($data['fun'] == 'fun')
        {
            $registro = $this->model->funcionesPertenecientesAlUsuario($data);
        }

        return $registro;
    }
    /*
     *
     * */
    public function actualizarRegistrosUsuario($data, $fun)
    {
        $estado = $this->model->validarPermiso('FUUSCR');
        if(!$estado['Estado'])
            return 'denegado';

        if($fun == 'cen')
        {
            $registro = $this->model->eliminarAgregarCentrosParaUsuario($data);
        }

        if($fun == 'fun')
        {
            $registro = $this->model->eliminarAgregarFuncionesUsuario($data);
        }

        return $registro;
    }

}