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
* Mostrar los Centros en la etiqueta
* select de Centros
* */
function getSelectCentros()
{
    axios.post("views/ajax/admin/users/action.php", { type: "getCentros" })
        .then(function(response) {
            bind.selectCentros(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Conseguir Contraseña generada
* */
function getGeneratedPass()
{
    axios.post("views/ajax/admin/users/action.php", { type: "getPassword" })
        .then(function(response) {

            bind.clave(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}



let usuarioVm = function () {
    self = this;
    self.usuario = ko.observable().extend({required:{params:true, message:"Campo Requerido"}});
    self.centro_id = ko.observable().extend({required:{params:true, message:"Campo Requerido"}});
    self.clave = ko.observable();

    self.selectCentros = ko.observable();

    self.getCentro = function ()
    {
        self.centro_id($('#centro_id').val());
    }


    self.guardar = function ()
    {

        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                usuario: self.usuario(),
                centro_id : self.centro_id(),
                clave : self.clave()
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
                    axios.post("views/ajax/admin/users/action.php", { type: "insert", data: form })
                        .then(function(response) {
                            if(response.data == "duplicado")
                            {
                                Swal.fire(
                                    'Error!',
                                    'Registro ya existe.',
                                    'warning'
                                );
                            }
                            if(response.data == "ok")
                            {
                                Swal.fire(
                                    'Guardado!',
                                    'El Usuario ha sido creado exitosamente.',
                                    'success'
                                );
                                setTimeout(function(){
                                    location.reload();
                                },1000)


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

let bind = new usuarioVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);
    getSelectCentros();
    getGeneratedPass();
});