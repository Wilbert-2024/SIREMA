<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/areaConocimientoModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class areaConocimientoController
{
    protected $model;
    protected $modelFuncionUsuario;

    function __construct()
    {
        $this->model = new areaConocimientoModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    /*
    * Envia nuevo registro de area de conocimiento para ser almacenado
    * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('ARCCR');
        if(!$estado['Estado'])
            return 'denegado';
        $area = $this->model->insert($data);

        return $area;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de Areas del conocimiento
     * */
    public function index()
    {
        $areas = $this->model->index();
        $tbody="";
        $count=1;



        foreach ($areas as $area)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$area['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$area["DescripcionAreaConocimiento"]."</td>";
            $tbody .= "<td>".$area["Acronimo"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$area["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$area["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= "</tr>";
            $count++;
        }

        return $tbody;
    }

    /*
     * Envia el id del registro
     * que se estado sera actualizado
     * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('ARCCHS');
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
        $estado = $this->modelFuncionUsuario->validarPermiso('ARCUP');
        if(!$estado['Estado'])
            return 'denegado';
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