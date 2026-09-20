<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/turnoModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/modalidadModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class turnoController
{
    protected $model;

    protected $modalidad;

    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new turnoModel();
        $this->modalidad = new modalidadModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    /*
     * Envia nuevo registro de turno para ser almacenado
     * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('TURCR');
        if(!$estado['Estado'])
            return 'denegado';

        $turno = $this->model->insert($data);

        return $turno;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de turnos
     * */
    public function index()
    {
        $turnos = $this->model->index();
        $tbody="";
        $count=1;

        foreach ($turnos as $turno)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$turno['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$turno["DescripcionTurno"]."</td>";
            $tbody .= "<td>".$turno["Modalidad"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$turno["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$turno["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= "</tr>";
            $count++;
        }

        return $tbody;
    }

    /*
     * Devuelve un formato de cuerpo de select HTML
     * <option></option> con los modalidades
     * */
    public function renderSelecModalidades()
    {
        $modalidades = $this->modalidad->index();
        $options = "<option value='0'>Seleccion Modalidad</option>";

        foreach ($modalidades as $modalidad)
        {
            $options .= "<option value='".$modalidad["Id"]."'>".$modalidad["DescripcionModalidad"]."</option>";
        }

        return $options;
    }
    /*
     * Envia el id del registro
     * que se estado sera actualizado
     * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('TURCHS');
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
        $estado = $this->modelFuncionUsuario->validarPermiso('TURUP');
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