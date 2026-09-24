<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class funcionUsuarioController
{

    protected $model;
    function __construct()
    {
        $this->model = new funcionUsuarioModel();
    }

    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->model = null;
    }

    /*
    * Envia nuevo registro de anio carrera para ser almacenado
    * */
    public function getUsuariosActivos()
    {
        $anio = $this->model->getUsuariosActivos();

        return $anio;
    }

    /*
    * Envia la lista de registros NO pertenecientes al usuario
    * */
    public function getRegistrosNoPertenecientes($data)
    {
        if($data['fun'] == 'cen')
        {
            $registro = $this->model->centrosNoPertenecientesAlUsuario($data);
        }

        if($data['fun'] == 'fun')
        {
            $registro = $this->model->funcionesNoPertenecientesAlUsuario($data);
        }

        return $registro;
    }

    /*
     * Envia la lista de registros pertenecientes al usuario
     * */
    public function getRegistrosPertenecientes($data)
    {
        if($data['fun'] == 'cen')
        {
            $registro = $this->model->centrosPertenecientesAlUsuario($data);
        }

        if($data['fun'] == 'fun')
        {
            $registro = $this->model->funcionesPertenecientesAlUsuario($data);
        }

        return $registro;
    }
    /*
     *
     * */
    public function actualizarRegistrosUsuario($data, $fun)
    {
        $estado = $this->model->validarPermiso('FUUSCR');
        if(!$estado || empty($estado['Estado']))
            return 'denegado';

        if (!in_array($fun, ['cen', 'fun'], true) || !is_array($data) || !$data) {
            return 'datosInvalidos';
        }
        $usuarioId = null;
        $unicos = [];
        foreach ($data as $registro) {
            if (!is_array($registro) || !isset($registro['UsuarioId'], $registro['RegistroId']) ||
                !filter_var($registro['UsuarioId'], FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]) ||
                filter_var($registro['RegistroId'], FILTER_VALIDATE_INT, ['options' => ['min_range' => 0]]) === false) {
                return 'datosInvalidos';
            }
            if ($usuarioId !== null && $usuarioId !== (int) $registro['UsuarioId']) return 'datosInvalidos';
            $usuarioId = (int) $registro['UsuarioId'];
            $id = (int) $registro['RegistroId'];
            if ($id === 0 && count($data) !== 1) return 'datosInvalidos';
            if ($fun === 'fun' && $id !== 0) {
                if (!isset($registro['Fecha1'], $registro['Fecha2']) ||
                    !is_string($registro['Fecha1']) || !is_string($registro['Fecha2'])) return 'datosInvalidos';
                $inicio = DateTimeImmutable::createFromFormat('!Y-m-d H:i', $registro['Fecha1']);
                $fin = DateTimeImmutable::createFromFormat('!Y-m-d H:i', $registro['Fecha2']);
                if (!$inicio || !$fin || $inicio->format('Y-m-d H:i') !== $registro['Fecha1'] ||
                    $fin->format('Y-m-d H:i') !== $registro['Fecha2'] || $inicio >= $fin) return 'datosInvalidos';
            }
            $unicos[$id] = $registro;
        }
        $data = array_values($unicos);

        if($fun == 'cen')
        {
            $registro = $this->model->eliminarAgregarCentrosParaUsuario($data);
        }

        if($fun == 'fun')
        {
            $registro = $this->model->eliminarAgregarFuncionesUsuario($data);
        }

        return $registro;
    }

}
