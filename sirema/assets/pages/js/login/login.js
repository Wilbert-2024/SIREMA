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
                    console.log(res)
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
                        Swal.fire(
                            'Bienvenido!',
                            'Usuario verificao. Redireccionando.....',
                            'success'
                        );

                        setTimeout(function()
                        {
                            window.location.reload();
                        },2000)
                    }

                })
                .catch(function(error) {
                    console.log(error)
                })
    }
}

let bind = new loginVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
});