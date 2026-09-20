<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/carreraModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/areaConocimientoModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class carreraController
{

    protected $model;
    protected $areaConocimiento;

    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new carreraModel();
        $this->areaConocimiento = new areaConocimientoModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    /*
     * Envia nuevo registro de carrera para ser almacenado
     * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('CARCR');
        if(!$estado['Estado'])
            return 'denegado';

        $centro = $this->model->insert($data);

        return $centro;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de Carreras
     * */
    public function index()
    {
        $carreras = $this->model->index();
        $tbody="";
        $count=1;

        foreach ($carreras as $carrera)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$carrera['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$carrera["DescripcionCarrera"]."</td>";
            $tbody .= "<td>".$carrera["Area"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$carrera["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$carrera["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= "</tr>";
            $count++;
        }

        return $tbody;
    }

    /*
     * Devuelve un formato de cuerpo de select HTML
     * <option></option> con los areasDeConocimiento
     * */
    public function renderSelecAreasDeConocimiento()
    {
        $areas = $this->areaConocimiento->index();
        $options = "<option value='0'>Seleccion Area Conocimiento</option>";

        foreach ($areas as $area)
        {
            $options .= "<option value='".$area["Id"]."'>".$area["DescripcionAreaConocimiento"]."</option>";
        }

        return $options;
    }
    /*
     * Envia el id del registro
     * que se estado sera actualizado
     * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('CARCHS');
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

    /*
     * Actualiza un registro
     * */
    public function update($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('CARUP');
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