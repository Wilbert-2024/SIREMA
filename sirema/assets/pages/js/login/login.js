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

let loginVm = function () {
    self = this;
    self.email = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.clave = ko.observable().extend({required:{params:true, message:"Campo requerido"}});

    self.iniciar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
            return;
        }

            let  form={
                email: self.email(),
                clave: self.clave()
            }

            axios.post("views/ajax/login/action.php", { type: "login", data: form })
                .then(function(response) {
                    let res = response.data;
                    if(res == 'noExiste' || res == 'error')
                    {
                        Swal.fire(
                            'Error!',
                            'Usuario incorrecto o contraseña.',
                            'warning'
                        );

                        return;
                    }

                    if(res == 'ok')
                    {
                        window.location.replace('/sirema/index.php');
                        return;
                    }

                })
                .catch(function(error) {
                    console.error(error);
                    Swal.fire('Error', 'No se pudo iniciar sesión. Inténtalo de nuevo.', 'error');
                })
    }
}

let bind = new loginVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
});
