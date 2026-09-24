<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/centroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/carreraCentroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class carreraCentroController
{
    protected $model;
    protected $modelCentro;

    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new carreraCentroModel();
        $this->modelCentro = new centroModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
        //session_start();
    }

    /*
     * Mostrar los centros activos de BICU
     * */
    public function getCentros()
    {
        return $this->modelCentro->index();
    }

    /*
     * Conseguir las carreras no pertenecientes al centro seleccionado
     * */
    public function getCarrerasNoPertenecientes($centroId)
    {
        return $this->model->carrerasNoPertenecientesAUnCentro($centroId);
    }

    /*
     * Conseguir las carreras pertenecientes al centro seleccionado
     * */
    public function getCarrerasPertenecientes($centroId)
    {
        return $this->model->carrerasPertenecientesAUnCentro($centroId);
    }

    /*
     * Envia nueva lista de carreras por el centro a ser actualizados o insertados
     * */
    public function habilitarCarreraCentro($datos)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('CACECR');
        if(!$estado || empty($estado['Estado']))
            return 'denegado';
        if (!is_array($datos) || !$datos) return 'datosInvalidos';
        $centroId = null;
        $carreras = [];
        foreach ($datos as $dato) {
            if (!is_array($dato) || !isset($dato['centroId'], $dato['carreraId']) ||
                !filter_var($dato['centroId'], FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]) ||
                filter_var($dato['carreraId'], FILTER_VALIDATE_INT, ['options' => ['min_range' => 0]]) === false) {
                return 'datosInvalidos';
            }
            if ($centroId !== null && $centroId !== (int) $dato['centroId']) return 'datosInvalidos';
            $centroId = (int) $dato['centroId'];
            $carreraId = (int) $dato['carreraId'];
            if ($carreraId === 0 && count($datos) !== 1) return 'datosInvalidos';
            $carreras[$carreraId] = ['centroId' => $centroId, 'carreraId' => $carreraId];
        }
        return $this->model->habilitarCarreraCentro(array_values($carreras));
    }
    /*
    * Destrulle la instancia del controlador
    * */
    function __destruct()
    {
        $this->model = null;
    }
}
