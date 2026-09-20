<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/semestreModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class semestreController
{
    protected $model;
    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new semestreModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }
    /*
     * Envia nuevo registro de semestre para ser almacenado
     * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('SEMCR');
        if(!$estado['Estado'])
            return 'denegado';
        $semestre = $this->model->insert($data);


        return $semestre;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de semestres
     * */
    public function index()
    {
        $semestres = $this->model->index();
        $tbody="";
        $count=1;

        foreach ($semestres as $semestre)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$semestre['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$semestre["DescripcionSemestre"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$semestre["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$semestre["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
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
        $estado = $this->modelFuncionUsuario->validarPermiso('SEMCHS');
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
        $estado = $this->modelFuncionUsuario->validarPermiso('SEMUP');
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