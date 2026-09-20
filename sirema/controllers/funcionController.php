<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class funcionController
{
    protected $model;
    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new funcionModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    /*
     * Envia registro de funcion para
     * que sea almacenado
     * */
    public function insert($data)
    {
        return $this->model->Insert($data);

    }


    /*
     * Devuelve formato de cuerpo de tabla HMTL
     * con los registros de funciones.
     * */
    public function index()
    {
        $funciones = $this->model->Index();
        $tbody = "";


        foreach($funciones as $fun)
        {

            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$fun['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $estado = "InActivo";
            if($fun['Estado'] == 1)
            {
                $estado = "Activo";
            }
            $tbody .= '<tr>';
            $tbody .= '<td>'.$fun['Controller'].'</td>';
            $tbody .= '<td>'.$fun['Accion'].'</td>';
            $tbody .= '<td>'.$fun['Acronimo'].'</td>';
            $tbody .= '<td>'.$estado.'</td>';
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$fun["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' href='admin_funciones_update?id=".$fun['Id']."'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= '</tr>';
        }

        return $tbody;
    }
    /*
   * Envia el id del registro
   * que se estado sera actualizado
   * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('FUNCHS');
        if(!$estado['Estado'])
            return 'denegado';
        $result = $this->model->change_state($Id);

        return $result;
    }

    /*
     * Devuelve un registro espefico al
     * usuario
     * */
    public function find($id)
    {
        $result = $this->model->find($id);

        return $result;
    }

    public function update($data)
    {
        $result = $this->model->update($data);

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