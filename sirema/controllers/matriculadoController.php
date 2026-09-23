<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/matriculadoModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/anioLectivoModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/tipoIngresoModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/anioCarreraModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/semestreModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/modalidadModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/grupoModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class matriculadoController
{

    protected $model;
    protected $modelAnioLectivo;
    protected $modelTipoIngreso;
    protected $modelAnioCarrera;
    protected $modelSemestre;
    protected $modelModalidad;
    protected $modelFuncionUsuario;
    protected  $modelGrupo;
    function __construct()
    {
        $this->model = new matriculadoModel();
        $this->modelAnioLectivo = new anioLectivoModel();
        $this->modelTipoIngreso = new tipoIngresoModel();
        $this->modelAnioCarrera = new anioCarreraModel();
        $this->modelSemestre = new semestreModel();
        $this->modelModalidad = new modalidadModel();
        $this->modelGrupo = new grupoModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
    }

    public function index($data)
    {
        $result = $this->model->index($data);

        return $result;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los centros padres
    * */
    public function getCentros($tipo)
    {
        $centros = $this->model->getCentros($tipo);
        $options = "<option value='0'>Seleccione Centro</option>";

        foreach ($centros as $centro)
        {
            $options .= "<option value='".$centro["Id"]."'>".$centro["Centro"]."</option>";
        }

        return $options;
    }


    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los carreras
    * */
    public function getCarreras($centroId)
    {
        $carreras = $this->model->getCarreras($centroId);
        $options = "<option value='0'>Seleccione Carrera</option>";

        foreach ($carreras as $car)
        {
            $options .= "<option value='".$car["Id"]."'>".$car["DescripcionCarrera"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los turnos
    * */
    public function getTurnos($modalidad)
    {
        $turnos = $this->model->getTurnos($modalidad);
        if(count($turnos) > 1)
            $options = "<option value='0'>Seleccione Turno</option>";
        else
            $options = '';

        foreach ($turnos as $tur)
        {
            $options .= "<option value='".$tur["Id"]."'>".$tur["DescripcionTurno"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los Años Lectivos
    * */
    public function getAniosLectivos()
    {
        $aniosLectivos = $this->modelAnioLectivo->index();
        if($aniosLectivos[0]["Estado"] > 1)
            $options = "<option value='0'>Seleccione Año Lectivo</option>";
        else
            $options = '';

        foreach ($aniosLectivos as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["AnioLectivo"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los grupos
    * */
    public function getGrupos()
    {
        $grupos = $this->modelGrupo->index();
        $options = "<option value='0'>Seleccione Grupo</option>";

        foreach ($grupos as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["DescripcionGrupo"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los Tipos de Ingreso
    * */
    public function getTiposIngreso()
    {
        $aniosLectivos = $this->modelTipoIngreso->index();
        $options = "<option value='0'>Seleccione Tipo Ingreso</option>";

        foreach ($aniosLectivos as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["DescripcionTipoIngreso"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los Años Carrera
    * */
    public function getAniosCarrera()
    {
        $niosCarrera = $this->modelAnioCarrera->index();
        $options = "<option value='0'>Seleccione Año Carrera</option>";

        foreach ($niosCarrera as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["DescripcionAnioCarrera"]."</option>";
        }

        return $options;
    }

    /*
    * Devuelve un formato de cuerpo de select HTML
    * <option></option> con los Semestre
    * */
    public function getSemestre()
    {
        $semestres = $this->modelSemestre->index();
        $options = "<option value='0'>Seleccione Semestre</option>";

        foreach ($semestres as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["DescripcionSemestre"]."</option>";
        }

        return $options;
    }

    /*
   * Devuelve un formato de cuerpo de select HTML
   * <option></option> con los Modalidad
   * */
    public function getModalidad()
    {
        $modalidades = $this->modelModalidad->index();
        $options = "<option value='0'>Seleccione Modalidad</option>";

        foreach ($modalidades as $x)
        {
            if($x['Estado'])
                $options .= "<option value='".$x["Id"]."'>".$x["DescripcionModalidad"]."</option>";
        }

        return $options;
    }

    /*
     * Insertar un nuevo registro de matricula
     * */
    public function insert($data)
    {
        // El acceso a la vista no autoriza por sí solo la solicitud AJAX.
        if (!isset($_SESSION['usuario'])) {
            return 'denegado';
        }
        $permiso = $this->modelFuncionUsuario->validarPermiso('MATRCR');
        if (!$permiso || empty($permiso['Estado'])) {
            return 'denegado';
        }

        if (!is_array($data) || !isset($data['DetalleRegistro']) ||
            !is_array($data['DetalleRegistro']) || count($data['DetalleRegistro']) === 0) {
            return 'datosInvalidos';
        }

        // Catálogos actuales: 1° Ingreso = 1; año de carrera I = 1.
        // La regla se comprueba en todos los detalles, también para solicitudes AJAX directas.
        if (!isset($data['TipoIngresoId']) ||
            filter_var($data['TipoIngresoId'], FILTER_VALIDATE_INT) === false) {
            return 'datosInvalidos';
        }
        $primerIngreso = (int) $data['TipoIngresoId'] === 1;
        foreach ($data['DetalleRegistro'] as $detalle) {
            if (!is_array($detalle) || !isset($detalle['AnioCarreraId']) ||
                filter_var($detalle['AnioCarreraId'], FILTER_VALIDATE_INT) === false ||
                (int) $detalle['AnioCarreraId'] < 1) {
                return 'datosInvalidos';
            }
            if ($primerIngreso && (int) $detalle['AnioCarreraId'] !== 1) {
                return 'reglaAcademica';
            }
        }

        $total = 0;
        foreach ($data['DetalleRegistro'] as $detalle) {
            if (!is_array($detalle)) {
                return 'datosInvalidos';
            }
            foreach (['Femeninos', 'Masculinos'] as $campo) {
                if (!isset($detalle[$campo]) ||
                    !(is_int($detalle[$campo]) || is_string($detalle[$campo])) ||
                    !preg_match('/^(0|[1-9][0-9]*)$/D', (string) $detalle[$campo]) ||
                    strlen((string) $detalle[$campo]) > 10 ||
                    (float) $detalle[$campo] > 2147483647) {
                    return 'datosInvalidos';
                }
                $total += (int) $detalle[$campo];
            }
        }
        if ($total < 1 || $total > 2147483647 || !isset($data['Total']) ||
            !(is_int($data['Total']) || is_string($data['Total'])) ||
            !preg_match('/^(0|[1-9][0-9]*)$/D', (string) $data['Total']) ||
            strlen((string) $data['Total']) > 10 ||
            $total !== (int) $data['Total']) {
            return 'datosInvalidos';
        }

        $result = $this->model->insert($data);

        return $result;
    }

    /*
     * Anular un registro de matricula
     * */
    public function anular($id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('MATRCHS');
        if(!$estado['Estado'])
            return 'denegado';
        $result = $this->model->anularRegistro($id);
        return $result;
    }
    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->model = null;
        $this->modelAnioLectivo = null;
        $this->modelTipoIngreso = null;
        $this->modelAnioCarrera = null;
        $this->modelSemestre = null;
        $this->modelModalidad = null;
    }
}
