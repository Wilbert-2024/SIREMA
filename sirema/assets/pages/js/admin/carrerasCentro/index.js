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
* Window events
* */

/*
* Funcion para agregar un centro a la lista de busqueda
* */
function addCentroAListaBuscar(_id, _descripcion) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_descripcion),
        remover: function () {
            self.ListaDeCentrosABuscar.remove(this);
            self.ListaDeCentrosAgregados.push(new addCentroAListaDeAgregados(_id, _descripcion));
        }
    }
}

/*
* Funcion para agregar una carrera no perteneciente al centro a su lista
* */
function addCarreraNoPerteneciente(_id, _descripcion,_centroId) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_descripcion),
        Centro: ko.observable(_centroId),
        remover: function () {
            self.CarrerasNoPertenecientes.remove(this);
            self.CarrerasPertenecientesAlCentro.push(new addCarreraPertenecienteCarrera(_id, _descripcion,_centroId));
        }
    }
}

/*
* Funcion para agregar una carrera perteneciente a la lista no perteneciente
* */
function addCarreraPertenecienteCarrera(_id, _descripcion, _centroId) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_descripcion),
        Centro: ko.observable(_centroId),
        remover: function () {
            self.CarrerasNoPertenecientes.push(new addCarreraNoPerteneciente(_id, _descripcion,_centroId));
            self.CarrerasPertenecientesAlCentro.remove(this);
        }
    }
}
/*
* Funcion para agregar un centro a la lista de agregados
* */
function addCentroAListaDeAgregados(_id, _descripcion) {
    return {
        Id: ko.observable(_id),
        Descripcion: ko.observable(_descripcion),
        remover: function () {
            self.ListaDeCentrosAgregados.remove(this);
            self.ListaDeCentrosABuscar.push(new addCentroAListaBuscar(_id, _descripcion));
            if(_id == self.centro_id_actual())
            {
                self.CarrerasNoPertenecientes.removeAll();
                self.CarrerasPertenecientesAlCentro.removeAll();
            }
        },
        filtrarCarreras: function()
        {
            getCarreras(_id);
            self.centro_id_actual(_id);
        }
    }
}


/*
* Conseguir todos los centros de la base de datos
* */
function getCentros(param)
{
    axios.post('views/ajax/filter/action.php', { type: "getCentros", param: param})
        .then(function(response) {
            let centros = response.data;

            centros.forEach((centro) => {
               bind.ListaDeCentrosABuscar.push(new addCentroAListaBuscar(centro.Id, centro.DescripcionCentro));
            })
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Conseguir las carreras no pertenecientes y pertenecientes al centro selecionado
* */

function getCarreras(centroId)
{
    if(centroId != bind.centro_id_actual())
    {
        bind.CarrerasNoPertenecientes.removeAll();
        bind.CarrerasPertenecientesAlCentro.removeAll();
        /*No Pertenecientes al centro*/
        axios.post("views/ajax/admin/carrerasCentro/action.php", { type: "noPertenecientes", Id: centroId})
            .then(function(response) {
                let carreras = response.data;

                carreras.forEach((carrera) => {
                    bind.CarrerasNoPertenecientes.push(new addCarreraNoPerteneciente(carrera.Id, carrera.carrera, centroId));
                })
            })
            .catch(function(error) {
                console.log(error)
            })

        /*Pertenecientes al centro*/
       axios.post("views/ajax/admin/carrerasCentro/action.php", { type: "pertenecientes", Id: centroId})
          .then(function(response) {
                let carreras = response.data;

              carreras.forEach((carrera) => {
                    bind.CarrerasPertenecientesAlCentro.push(new addCarreraPertenecienteCarrera(carrera.Id, carrera.carrera,centroId));
                })
           }).
           catch(function(error) {
                console.log(error)
           })
    }
}
let carrerasCentroVm = function () {
    self = this;
   self.buscar_centro = ko.observable();
   self.centro_id_actual = ko.observable(0);
    ///Arrays
    self.ListaDeCentrosABuscar = ko.observableArray();
    self.ListaDeCentrosAgregados = ko.observableArray();

    self.CarrerasNoPertenecientes = ko.observableArray();
    self.CarrerasPertenecientesAlCentro = ko.observableArray();

    ///True - False
    self.showCentroList = ko.observable(false);

    ///Events
   self.toggleCentroSearch = function ()
    {
        if(self.showCentroList() == false)
            self.showCentroList(true);

        else if(self.showCentroList() == true)
            self.showCentroList(false);
    }

    self.filtroCentro = function()
    {
        let time = 200;

        setTimeout(function (){
                if($('#buscar_centro').val() == '')
                {
                    self.ListaDeCentrosABuscar.removeAll();
                    return
                }
                self.ListaDeCentrosABuscar.removeAll();
                getCentros($('#buscar_centro').val());
            }
            , time)

    }
    ///Butones
    self.guardar = function()
    {
        if(self.centro_id_actual() == 0)
            return;

        let registros = [];
        let x = 0;
        self.CarrerasPertenecientesAlCentro().forEach(function(index){
            registros[x] = {
                carreraId : index.Id(),
                centroId: index.Centro()
            }
            x++;
        });

        if(registros.length === 0)
        {
            registros[0] = {
                carreraId:0,
                centroId: self.centro_id_actual()
            }
        }

        /*Pertenecientes al centro*/
      axios.post("views/ajax/admin/carrerasCentro/action.php", { type: "actualizarCarreras", cc: registros})
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

                Swal.fire(
                    'Actualizado!',
                    'Las Carreras por el Centro han sido actualizados.',
                    'success'
                )
            }).
        catch(function(error) {
            console.log(error)
        })
    }
}

let bind = new carrerasCentroVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    $('#buscar_centro').keyup(function()
    {
        let time = 200;

        setTimeout(function (){
                if($('#buscar_centro').val() == '')
                {
                    bind.ListaDeCentrosABuscar.removeAll();
                    return
                }
                bind.ListaDeCentrosABuscar.removeAll();
                getCentros($('#buscar_centro').val());
            }
            , time)
    });

    $(document).click(function() {
        $('#buscar_centro').val('')
        bind.ListaDeCentrosABuscar.removeAll();
    });
});