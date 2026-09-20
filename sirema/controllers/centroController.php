<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/comunidadModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/centroModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/tipoDeCentroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class centroController
{

    protected $model;
    protected $modelComunidad;
    protected $modelFuncionUsuario;
    protected  $modelTipoCentro;
    function __construct()
    {
        $this->model = new centroModel();
        $this->modelComunidad = new comunidadModel();
        $this->modelTipoCentro = new tipoDeCentroModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    /*
     * Envia nuevo registro de centro para ser almacenado
     * */
    public function insert($data)
    {
        $centro = $this->model->insert($data);

        return $centro;
    }

    /*
    * Envia registro de centro para ser actualizado
    * */
    public function update($data)
    {
        $centro = $this->model->update($data);

        return $centro;
    }

    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de Centros
     * */
    public function index()
    {
        $centros = $this->model->index();
        $tbody="";
        $count=1;



        foreach ($centros as $centro)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$centro['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$centro["DescripcionCentro"]."</td>";
            $tbody .= "<td>".$centro["DescripcionTipoCentro"]."</td>";
            $tbody .= "<td>".$centro["DescripcionComunidad"]."</td>";
            $tbody .= "<td>".$centro["Padre"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$centro["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' href='catalogo_centros_update?id=".$centro['Id']."'><i class='fas fa-redo fa-1x'></i></button>";
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
        $estado = $this->modelFuncionUsuario->validarPermiso('CENCHS');
        if(!$estado['Estado'])
            return 'denegado';
        $result = $this->model->change_state($Id);

        return $result;
    }

    /*
     * Envia el id del registro
     * y retorna el registro al usuario
     * */
    public function get_centro($Id)
    {
        $result = $this->model->get_centro($Id);

        return $result;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los comunidad
    * */
    public function renderSelectComunidades()
    {
        $comunidades = $this->modelComunidad->index();
        $options = "<option value='0'>Seleccione Comunidad</option>";

        foreach ($comunidades as $comunidad)
        {
            $options .= "<option value='".$comunidad["Id"]."'>".$comunidad["DescripcionComunidad"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los Tipos de Centros
    * */
    public function renderSelectTipoCentros()
    {
        $tipos = $this->modelTipoCentro->index();
        $options = "<option value='0'>Seleccione Tipo Centro</option>";

        foreach ($tipos as $tipo)
        {
            $options .= "<option value='".$tipo["Id"]."'>".$tipo["DescripcionTipoCentro"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los centros padres
    * */
    public function renderSelectCentrosPadres()
    {
        $centros = $this->model->getCentrosPadres();
        $options = "<option value='0'>Seleccione Centro Padre</option>";

        foreach ($centros as $centro)
        {
            $options .= "<option value='".$centro["Id"]."'>".$centro["Padre"]."</option>";
        }

        return $options;
    }

    /*
    * Destrulle la instancia del controlador
    * */
    function __destruct()
    {
        $this->model = null;
    }
}