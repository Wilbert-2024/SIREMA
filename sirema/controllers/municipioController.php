<?php

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/municipioModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class municipioController
{
    protected $model;
    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new municipioModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();

    }
    /*
     * Envia nuevo registro de municipio para ser almacenado
     * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('MUNCR');
        if(!$estado['Estado'])
            return 'denegado';

        $municipio = $this->model->insert($data);

        return $municipio;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de Municipios
     * */
    public function index()
    {

        $municipios = $this->model->index();
        $tbody="";
        $count=1;

        foreach ($municipios as $mun)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$mun['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$mun["DescripcionMunicipio"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$mun["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$mun["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
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
        $estado = $this->modelFuncionUsuario->validarPermiso('MUNCHS');
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
        $estado = $this->modelFuncionUsuario->validarPermiso('MUNUP');
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