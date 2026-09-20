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
* Funcion registros a tabla
* */
function addRegistroTabla(_orden, _id, _centro, _carrera, _tipoIngreso, _semestre, _fecha, _total) {
    return {
        Orden: ko.observable(_orden),
        Id: ko.observable(_id),
        Centro: ko.observable(_centro),
        Carrera: ko.observable(_carrera),
        TipoIngreso: ko.observable(_tipoIngreso),
        Semestre: ko.observable(_semestre),
        Fecha: ko.observable(_fecha),
        Total: ko.observable(_total),
        anular: function () {
            Swal.fire({
                title: 'Estas seguro?',
                text: "El registro sera anulado y quitado de la vista!!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, Anular!'
            }).then((result) => {
                if (result.isConfirmed) {
                   axios.post("views/ajax/registro/matriculados/action.php", { type: "anular", id: _id })
                        .then(function(response) {
                            if(response.data == 'denegado')
                            {
                                Swal.fire(
                                    'CODIGO: 403!',
                                    'ACCESO DENEGADO. NO TIENES PERMISO PARA REALIZAR ESTA OPERACION. CONSULTE AL ADMINISTRADOR.',
                                    'warning'
                                );
                                return;
                            }
                            if(response.data =='ok')
                            {
                                Swal.fire(
                                    'Anulado!',
                                    'Registro Anulado Correctamente.',
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
function renderSelectCarreras()
{
    axios.post("views/ajax/registro/matriculados/action.php", { type: "getCarreras", centroId: 0})
        .then(function(response) {
            bind.select_carreras(response.data);
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
let indexMatriculadoVm = function () {
    self = this;

    /*Observables para Selects*/
    self.select_centros = ko.observable();
    self.select_anios_lectivos = ko.observable();
    self.select_carreras = ko.observable();
    self.select_tipos_ingresos = ko.observable();
    self.select_anio_carrera = ko.observable();
    self.select_semestre = ko.observable();
    self.select_modalidad = ko.observable();

    //Arreglos
    self.registrosTabla = ko.observableArray();
    //Butones
    self.buscar =  function ()
    {
        self.registrosTabla.removeAll();
        let form = {
            anioLectivoId: (($('#anio_lectivo_id').val() >0) ? $('#anio_lectivo_id').val():0),
            centroId: (($('#centro_id').val() >0) ? $('#centro_id').val():0),
            carreraId: (($('#carrera_id').val() >0) ? $('#carrera_id').val():0),
            tipoIngresoId: (($('#tipo_ingreso_id').val() >0) ? $('#tipo_ingreso_id').val():0)
        }

        axios.post("views/ajax/registro/matriculados/action.php", { type: "index", data: form})
            .then(function(response) {
                let data = response.data;
                let index = 1;
                if(data.length > 0)
                {
                   data.forEach((reg) => {
                       self.registrosTabla.push(new addRegistroTabla(index, reg.Id, reg.Centro,reg.Carrera, reg.TipoIngreso,reg.Semestre, reg.Fecha, reg.Total));
                       index++;
                   })
                }
            })
            .catch(function(error) {
                console.log(error)
            })
    }
}


let bind = new indexMatriculadoVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
    renderSelectCentros();
    renderSelectCarreras();
    renderSelectAniosLectivos();
    renderSelectTipoIngresos();

});