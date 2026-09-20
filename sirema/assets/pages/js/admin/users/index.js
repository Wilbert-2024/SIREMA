//Anclaje a modal para crear un nuevo etnia
var modalClaveActualizar = new bootstrap.Modal(document.getElementById('modalClaveActualizar'), {
    keyboard: false
})

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
* Conseguir Contraseña generada
* */
function getGeneratedPass()
{
    axios.post("views/ajax/admin/users/action.php", { type: "getPassword" })
        .then(function(response) {

            bind.clave_nueva(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}



/*
* Funcion para des-habilitar un registro de usuario
* */
function deleteRegistry(id)
{
    Swal.fire({
        title: 'Estas seguro?',
        text: "El estado del registro se actualizado",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si, actualizar!'
    }).then((result) => {
        if (result.isConfirmed) {
            axios.post("views/ajax/admin/users/action.php", { type: "changeState", Id: id })
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
                        'El usuario ha actualizado correctamente.',
                        'success'
                    );

                    renderTable();

                })
                .catch(function(error) {
                    console.log(error)
                })
        }
    });
}


/*
* Function para Mostrar la tabla en vista
* */
function renderTable()
{
    axios.post("views/ajax/admin/users/action.php", { type: "getTable"})
        .then(function(response) {

            bind.table_usuarios(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Update user password
* */
function changePassWord(id)
{
    bind.id(id);
    getGeneratedPass();
    modalClaveActualizar.show()
}
let usuarioVm = function () {
    self = this;
    self.table_usuarios = ko.observable();
    self.id = ko.observable();
    self.clave_nueva = ko.observable();

    self.actualizar = function ()
    {
        if (bind.clave_nueva() == "") {
        alert('La contraseña no ha sido generada, consulte al administrador');

        }

        else
        {
            let  form={
                id: self.id(),
                clave_nueva : self.clave_nueva()
            }

            Swal.fire({
                title: 'Estas seguro?',
                text: "La contraseña del usuario sera actualizada",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, actualizar!'
            }).then((result) => {
                if (result.isConfirmed) {
                    axios.post("views/ajax/admin/users/action.php", { type: "claveUpdate", data: form })
                        .then(function(response) {
                            if(response.data == "ok")
                            {
                                Swal.fire(
                                    'Guardado!',
                                    'La Contraseña del Usuario ha sido creado exitosamente.',
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
    renderTable();

    setTimeout(
        function ()
        {
            $("#basic-datatables").DataTable({});
        }
        ,100)

});
