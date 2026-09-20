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

let funcionVm = function ()
{
    self =this;
    self.controlador = ko.observable().extend({ required: { params: true, message: "Seleccione el Padre"} });
    self.accion = ko.observable().extend({ required: { params: true, message: "Escribe el Texti del Vinculo" } });
    self.acronimo = ko.observable().extend({ required: { params: true, message: "Escribe el Texti del Vinculo" } });

    self.create = function(){
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else{
            let  form={
                controlador: self.controlador(),
                accion: self.accion(),
                acronimo: self.acronimo()
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
                    axios.post("views/ajax/admin/funciones/action.php", { type: "insert", data: form })
                        .then(function(response) {
                            Swal.fire(
                                'Guardado!',
                                'La Función ha sido creado exitosamente.',
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

let bind = new funcionVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
});