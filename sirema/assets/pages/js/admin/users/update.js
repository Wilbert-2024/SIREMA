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
* Conseguir los datos del usuario a ser actualizado
* */
function getUser()
{
    axios.post("views/ajax/admin/users/action.php", { type: "find", Id: bind.id() })
        .then(function(response) {
           bind.usuario(response.data.NombreUsuario);
           $('#centro_id').val(response.data.Centro_Id);
           bind.centro_id(response.data.Centro_Id);
        })
        .catch(function(error) {
            console.log(error)
        })
}


let usuarioVm = function () {
    self = this;
    self.id = ko.observable($('#id').val());
    self.usuario = ko.observable().extend({required:{params:true, message:"Campo Requerido"}});
    self.centro_id = ko.observable().extend({required:{params:true, message:"Campo Requerido"}});

    self.selectCentros = ko.observable();

    self.getCentro = function ()
    {
        self.centro_id($('#centro_id').val());
    }


    self.update = function ()
    {

        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                id : self.id(),
                usuario: self.usuario(),
                centro_id : self.centro_id()
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
                    axios.post("views/ajax/admin/users/action.php", { type: "update", data: form })
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
                                    'El Usuario ha sido actualizado exitosamente.',
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
    setTimeout(function ()
    {getUser();

    },100)

});