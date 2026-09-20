<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/comunidadModel.php";

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/municipioModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class comunidadController
{
    protected $model;
    protected $modelMunicipio;
    protected $modelFuncionUsuario;
    function __construct()
    {
      $this->model = new comunidadModel();
      $this->modelMunicipio = new municipioModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }
    /*
     * Envia nuevo registro de comunidad para ser almacenado
     * */
    public function insert($data)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('COMCR');
        if(!$estado['Estado'])
            return 'denegado';

        $comunidad = $this->model->insert($data);

        return $comunidad;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de Comunidades
     * */
    public function index()
    {
        $comunidades = $this->model->index();
        $tbody="";
        $count=1;



        foreach ($comunidades as $com)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$com['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$com["DescripcionComunidad"]."</td>";
            $tbody .= "<td>".$com["Municipio"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$com["Id"].")'><i class='".$icon."' title='".$title."'></i></button>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' onclick='updateRegistry(".$com["Id"].")'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= "</tr>";
            $count++;
        }

        return $tbody;
    }

    /*
     * Devuelve un formato de cuerpo de select HTML
     * <option></option> con los municipios
     * */
    public function renderSelectMunicipios()
    {
        $municipios = $this->modelMunicipio->index();
        $options = "<option value='0'>Seleccion Municipio</option>";

        foreach ($municipios as $municipio)
        {
            $options .= "<option value='".$municipio["Id"]."'>".$municipio["DescripcionMunicipio"]."</option>";
        }

        return $options;
    }
    /*
     * Envia el id del registro
     * que se estado sera actualizado
     * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('COMCHS');
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
        $estado = $this->modelFuncionUsuario->validarPermiso('COMUP');
        if(!$estado['Estado'])
            return 'denegado';
        $result = $this->model->update($data);

        return $result;
    }

    public function getComunidadesLatLon()
    {
        $comunidad = $this->model->getComunidadesConLatLon();
        $result = [];
        $index = 0;
        $inComunidad = [];
        foreach ($comunidad as $com)
        {
            if(!in_array($com['comId'],$inComunidad))
            {
                $inComunidad[$index] = $com["comId"];
                $totalDb = $this->model->getTotalRegistradosPorComunidad($com["comId"]);
                if($totalDb['total'] < 1)
                    $total = 0;
                else
                    $total = $totalDb['total'];
                $tipoCentro = '';
                if($com['tipo'] == "UNI")
                    $tipoCentro = 'UNICAM';
                elseif ($com['tipo'] == 'EXT')
                    $tipoCentro = "EXTENSION";
                else
                    $tipoCentro = $com['tipo'];
                $card = "<div class='card'>";
                $card .="<div class='card-body'><h6 class='card-subtitle text text-center text-warning'><b>".$tipoCentro."</b></h6><hr>";
                $card .= "<p class='card-text' style='font-size: 12px;'><span class='text-primary'><b>LUGAR: </b></span><span class='text-uppercase'>".$com["Centro"]."</span><br>";
                $card .= "<span class='text-primary'><b>MATRICULADOS: </b></span><span>".$total."</span></p>";
                $card .="</div></div>";
                $result[$index] = [
                    "card" =>$card,
                    "lat" =>$com["lat"],
                    "lon" => $com["lon"]
                ];
                $index++;
            }

        }

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