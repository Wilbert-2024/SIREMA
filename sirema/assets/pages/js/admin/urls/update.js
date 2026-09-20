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
* Mostrar los datos del enlace a actualizar
* */
function getEnlace()
{
    axios.post("views/ajax/admin/urls/action.php", { type: "find", id: $('#id').val() })
        .then(function(response) {
            let enlace = response.data;
           bind.padre_id(enlace.PadreId);
           bind.texto_mostrar(enlace.TextoMostrar);
           bind.modulo(enlace.Modulo);
           bind.icono_modulo(enlace.IconoModulo);
           bind.accion(enlace.Accion);
           bind.icono_accion(enlace.IconoAcccion);

        })
        .catch(function(error) {
            console.log(error)
        })

}


let createUrlsVm = function ()
{
    self =this;
    self.id = ko.observable($('#id').val());
    self.padre_id = ko.observable().extend({ required: { params: true, message: "Seleccione el Padre"} });
    self.texto_mostrar = ko.observable().extend({ required: { params: true, message: "Escribe el Texti del Vinculo" } });
    self.modulo = ko.observable();
    self.icono_modulo = ko.observable();
    self.accion = ko.observable();
    self.icono_accion = ko.observable();
    self.estado = ko.observable();

    self.update = function(){
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else{
            let  form={
                id: self.id(),
                texto_mostrar: self.texto_mostrar(),
                padre: self.padre_id(),
                modulo: self.modulo(),
                icono_modulo: self.icono_modulo(),
                accion: self.accion(),
                icono_accion: self.icono_accion()
            }

            Swal.fire({
                title: 'Estas seguro?',
                text: "Los datos seran actualizados",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, actualizar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.post("views/ajax/admin/urls/action.php", { type: "update", data: form })
                        .then(function(response) {
                            Swal.fire(
                                'Guardado!',
                                'El Menu ha sido actualizado exitosamente.',
                                'success'
                            )
                            setTimeout(function (){
                              location.reload();
                            },1000)
                        })
                        .catch(function(error) {
                            console.log(error)
                        })
                }
            });
        }
    };

}

let bind = new createUrlsVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    getEnlace();

});