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
* Mostrar los datos de la funcion a actualizar
* */
function getFuncion()
{
    axios.post("views/ajax/admin/funciones/action.php", { type: "find", id: $('#id').val() })
        .then(function(response) {
            let fun = response.data;
            bind.controlador(fun.Controller);
            bind.accion(fun.Accion);
            bind.acronimo(fun.Acronimo);
            bind.Id($('#id').val());

        })
        .catch(function(error) {
            console.log(error)
        })

}



let funcionVm = function ()
{
    self =this;
    self.Id = ko.observable();
    self.controlador = ko.observable().extend({ required: { params: true, message: "Seleccione el Padre"} });
    self.accion = ko.observable().extend({ required: { params: true, message: "Escribe el Texti del Vinculo" } });
    self.acronimo = ko.observable().extend({ required: { params: true, message: "Escribe el Texti del Vinculo" } });

    self.actualizar = function(){
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else{
            let  form={
                controlador: self.controlador(),
                accion: self.accion(),
                acronimo: self.acronimo(),
                id: self.Id()
            }

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
                    axios.post("views/ajax/admin/funciones/action.php", { type: "update", data: form })
                        .then(function(response) {
                            Swal.fire(
                                'Guardado!',
                                'La Función ha sido actualizada exitosamente.',
                                'success'
                            )
                            setTimeout(function (){
                                location.href = 'admin_funciones_index';
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

let bind = new funcionVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    setTimeout(function(){
        getFuncion();
    },200)
});