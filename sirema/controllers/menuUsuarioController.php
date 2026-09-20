<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/menuUsuarioModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class menuUsuarioController
{

    protected $model;

    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new menuUsuarioModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    /*
    * Envia nuevo registro de anio carrera para ser almacenado
    * */
    public function getMenu($UsuarioId)
    {
       $menu = [];
       $index = 0;

       $padres = $this->model->menusPadres($UsuarioId);
       foreach ($padres as $p)
       {
           $menu[$index]['padre'] = $p;
           $hijos = $this->model->menusHijos($UsuarioId, $p['Id']);
           $menu[$index]['hijos'] = $hijos;
           $index++;
       }

       return $menu;
    }

    public function eliminarAgregarMenusParaUsuario($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('MEUSCR');
        if(!$estado['Estado'])
            return 'denegado';

        $result = $this->model->eliminarAgregarMenusParaUsuario($data);

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