ko.validation.registerExtenders();
ko.validation.init(
    {
        registerExtenders: true,
        errorsAsTitle: false,
        decorateInputElement: true,
        errorElementClass: "is-invalid",
        errorMessageClass: "invalid-feedback",
    },
    true
);

/*
* Funcion para agregar un detalle de matriculado
* */
function addDetalleMatriculado(_idAnioCarreraId, _anioCarreraDescripcion,_modalidadId, _modalidadDescripcion, _grupoId, _grupoDescripcion, _turnoId, _turnoDescripcion) {
    return {
        Carrera: ko.observable($('#carrera_id option:selected').text()),
        AnioCarreraId: ko.observable(_idAnioCarreraId),
        AnioCarreraDescripcion: ko.observable(_anioCarreraDescripcion),
        ModalidadId: ko.observable(_modalidadId),
        ModalidadDescripcion: ko.observable(_modalidadDescripcion),
        Femeninos: ko.observable(0),
        Masculinos: ko.observable(0),
        GrupoId : ko.observable(_grupoId),
        GrupoDescripcion: ko.observable(_grupoDescripcion),
        TurnoId: ko.observable(_turnoId),
        TurnoDescripcion: ko.observable(_turnoDescripcion +'( '+_modalidadDescripcion+' )'),
        remover: function () {
            self.DetalleMatriculados.remove(this);
        }
    }
}
/*
* Funcion para mostrar registros
* de centros en Select
* */
function renderSelectCentros()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getCentros", filtro:0})
        .then(function(response) {
            bind.select_centros(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de carreras en Select
* */
function renderSelectCarreras(centroId)
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getCarreras", centroId: centroId})
        .then(function(response) {
            bind.select_carreras(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de turnos en Select
* */
function renderSelectTurnos(modalidadId)
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getTurnos", modalidadId: modalidadId})
        .then(function(response) {
            bind.select_turno(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de Anios Lectivos en Select
* */
function renderSelectAniosLectivos()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getAniosLectivos"})
        .then(function(response) {
            bind.select_anios_lectivos(response.data);

            setTimeout(function()
            {
                bind.anio_lectivo_id($('#anio_lectivo_id').val());
            },200)
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de Anios Carrera en Select
* */
function renderSelectAniosCarrera()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getAniosCarrera"})
        .then(function(response) {
            bind.select_anio_carrera(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}
/*
* Funcion para mostrar registros
* de Tipos de Ingreso en Select
* */
function renderSelectTipoIngresos()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getTipoIngresos"})
        .then(function(response) {
            bind.select_tipos_ingresos(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de Semestres
* */
function renderSelectSemestres()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getSemestres"})
        .then(function(response) {
            bind.select_semestre(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de Grupos
* */
function renderSelectGrupos()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getGrupos"})
        .then(function(response) {
            bind.select_grupo(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de Semestres
* */
function renderSelectModalidades()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getModalidades"})
        .then(function(response) {
            bind.select_modalidad(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}
let createMatriculadoVm = function () {
    self = this;
    //Observales
    self.centro_id = ko.observable().extend({required:{params:true, message:"Selecione Centro"}});
    self.carrera_id = ko.observable().extend({required:{params:true, message:"Selecione Carrera"}});
    self.anio_lectivo_id = ko.observable().extend({required:{params:true, message:"Selecione Anio Lectivo"}});
    self.tipo_ingreso_id = ko.observable().extend({required:{params:true, message:"Selecione Tipo de Ingreso"}});
    self.semestre_id = ko.observable().extend({required:{params:true, message:"Selecione Semestre"}});
    //Events
    //Evento de cambio de centro
    self.select_centro_change =  function()
    {
        if($('#centro_id').val() > 0)
        {
            self.centro_id($('#centro_id').val());
            self.DetalleMatriculados.removeAll();
            renderSelectCarreras($('#centro_id').val());
        }
        else{
            self.DetalleMatriculados.removeAll();
            self.centro_id('');
            self.carrera_id('');
            self.select_carreras('');
        }
    }

    ///Evento de cambio de carrera
    self.select_carrera_change = function()
    {
        if($('#carrera_id').val() > 0)
        {
            self.DetalleMatriculados.removeAll();
            self.carrera_id($('#carrera_id').val());
        }
        else{
            self.DetalleMatriculados.removeAll();
            self.carrera_id('');
        }
    }

    ///Evento de cambio de carrera
    self.select_modalidad_change = function()
    {
        if($('#modalidad_id').val() > 0)
        {
            renderSelectTurnos($('#modalidad_id').val());
        }
        else{
            self.select_turno('');
        }
    }
    ///Evento de cambio de anio lectivo
    self.select_anio_lectivo_change = function()
    {
        if($('#anio_lectivo_id').val() > 0)
        {
            self.anio_lectivo_id($('#anio_lectivo_id').val());
        }
        else{
            self.anio_lectivo_id('');
        }
    }

    ///Evento de cambio de tipo de ingreso
    self.select_tipo_ingreso_change = function()
    {
        if($('#tipo_ingreso_id').val() > 0)
        {
            self.tipo_ingreso_id($('#tipo_ingreso_id').val());
        }
        else{
            self.tipo_ingreso_id('');
        }
    }


    ///Evento de cambio de semestre
    self.select_semestre_change = function()
    {
        if($('#semestre_id').val() > 0)
        {
            self.semestre_id($('#semestre_id').val());
        }
        else{
            self.semestre_id('');
        }
    }

    /*Observables para Selects*/
    self.select_centros = ko.observable();
    self.select_anios_lectivos = ko.observable();
    self.select_carreras = ko.observable();
    self.select_tipos_ingresos = ko.observable();
    self.select_anio_carrera = ko.observable();
    self.select_semestre = ko.observable();
    self.select_modalidad = ko.observable();
    self.select_grupo = ko.observable();
    self.select_turno = ko.observable();

    /*Arreglos*/
    self.DetalleMatriculados = ko.observableArray();

    ///Buttones
    self.agregarDetalle = function ()
    {
        let dentro = false;

        if(self.carrera_id() == null || self.carrera_id() == '')
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar una Carrera.',
                'error'
            )
            return;
        }

        if($('#anio_carrera_id').val() <= 0)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Anio de Carrera.',
                'error'
            )
            return;
        }

        if($('#modalidad_id').val() <= 0)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar una Modalidad.',
                'error'
            )
            return;
        }

        if($('#grupo_id').val() <= 0)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Grupo.',
                'error'
            )
            return;
        }

        if($('#turno_id').val() <= 0)
        {
            Swal.fire(
                'Atención!',
                'Debe seleccionar un Turno.',
                'error'
            )
            return;
        }

        bind.DetalleMatriculados().forEach((det)=>{
            if(det.AnioCarreraId() == $('#anio_carrera_id').val() && det.ModalidadId() == $('#modalidad_id').val()
            && det.GrupoId() == $('#grupo_id').val() && det.TurnoId() == $('#turno_id').val())
            {
                dentro = true;
            }
        })
        if(dentro)
        {
            Swal.fire(
                'Atención!',
                'Año Carrea, Grupo, Modalidad y Turno Ya Existe.',
                'error'
            )
            return;
        }
        bind.DetalleMatriculados.push(new addDetalleMatriculado($('#anio_carrera_id').val(), $('#anio_carrera_id option:selected').text(), $('#modalidad_id').val(), $('#modalidad_id option:selected').text(),$('#grupo_id').val(),$('#grupo_id option:selected').text(), $('#turno_id').val(), $('#turno_id option:selected').text()));
    }

    /*
    * Guadar regitros
    * */
    self.guardar = function()
    {
        let totalNoVacio = 0;
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
            return;
        }
        /*Validar que la suma
        * de los totales
        * no equivale.
        * */
        bind.DetalleMatriculados().forEach((det)=>{
            totalNoVacio = parseInt(totalNoVacio) + (parseInt(det.Femeninos()) + parseInt(det.Masculinos()));
        })

        if(totalNoVacio == 0)
        {
            Swal.fire(
                'Atención!',
                'Total de Matriculados es cero.',
                'error')
            return;
        }
        let detalleRegistro = [];
        let index = 0;
        bind.DetalleMatriculados().forEach((det)=>{
            detalleRegistro[index] =
            {
                AnioCarreraId: det.AnioCarreraId(),
                ModalidadId: det.ModalidadId(),
                GrupoId: det.GrupoId(),
                TurnoId: det.TurnoId(),
                Femeninos: det.Femeninos(),
                Masculinos: det.Masculinos()
            }
            index++;
        })
        let registro =
            {
                CentroId: bind.centro_id(),
                CarreraId: bind.carrera_id(),
                TipoIngresoId: bind.tipo_ingreso_id(),
                SemestreId: bind.semestre_id(),
                AnioLectivoId: bind.anio_lectivo_id(),
                Total: totalNoVacio,
                DetalleRegistro: detalleRegistro
            };


        Swal.fire({
            title: 'Estas seguro?',
            text: "Los datos seran guardados",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si, guardar!'
        }).then((result) => {
            if (result.isConfirmed) {
                axios.post("views/ajax/registro/matriculados/action.php", { type: "insert", registro: registro })
                    .then(function(response) {
                       if(response.data =='ok')
                       {
                           Swal.fire(
                               'Registrado!',
                               'Registro Guardado Correctamente.',
                               'success')

                           setTimeout(function(){
                               location.reload()
                           }, 1300)
                       }
                    })
                    .catch(function(error) {
                        console.log(error)
                    })
            }
        });

    }
}

let bind = new createMatriculadoVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
    renderSelectCentros();
    renderSelectAniosLectivos();
    renderSelectTipoIngresos();
    renderSelectAniosCarrera();
    renderSelectSemestres();
    renderSelectModalidades();
    renderSelectGrupos();


});