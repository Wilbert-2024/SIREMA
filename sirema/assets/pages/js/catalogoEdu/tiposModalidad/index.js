//Anclaje a modal para crear un nuevo grupo
var modalModalidadCNU = new bootstrap.Modal(document.getElementById('modalModalidadCNU'), {
    keyboard: false
})

///Anclaje a modal para actualizar un municipio
var modalModalidadCNUctualizar = new bootstrap.Modal(document.getElementById('modalModalidadCNUctualizar'), {
    keyboard: false
})
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
* Function para Mostrar la tabla en vista
* */
function renderTable()
{
    axios.post("views/ajax/catalogoEdu/tiposModalidad/action.php", { type: "getTable"})
        .then(function(response) {
            bind.table_modalidadesCNU(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para eliminar un registro de Grupo
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
            axios.post("views/ajax/catalogoEdu/tiposModalidad/action.php", { type: "changeState", Id: id })
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
                        'La Modalidad ha actualizado correctamente.',
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
* Funcion para actualizar un registro de Semestre
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogoEdu/tiposModalidad/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.modalidadCNU_nuevo(response.data.DescripcionDeTipo)
            modalModalidadCNUctualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let modalidadCNUVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.modalidadCNU = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_modalidadesCNU = ko.observable();
    self.modalidadCNU_nuevo = ko.observable("");

    self.guardar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                modalidadCNU: self.modalidadCNU()
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
                    axios.post("views/ajax/catalogoEdu/tiposModalidad/action.php", { type: "insert", data: form })
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
                                    'La Modalidad ha sido creado exitosamente.',
                                    'success'
                                );

                                modalModalidadCNU.hide();
                                self.modalidadCNU("");
                                renderTable();
                            }


                        })
                        .catch(function(error) {
                            console.log(error)
                        })
                }
            });
        }
    };

    self.actualizar = function()
    {
        if (bind.modalidadCNU_nuevo() == "") {
            alert("Escriba el nombre de la nueva modalidad");
        }

        else
        {
            let  form={
                modalidadCNU_nuevo: self.modalidadCNU_nuevo(),
                id : self.id()
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
                    axios.post("views/ajax/catalogoEdu/tiposModalidad/action.php", { type: "update", data: form })
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

                            if(response.data == "ok")
                            {
                                Swal.fire(
                                    'Actualizado!',
                                    'La Modalidad ha sido actualizado exitosamente.',
                                    'success'
                                );

                                modalModalidadCNUctualizar.hide();
                                self.modalidadCNU_nuevo("");
                                self.id(0);
                                renderTable();
                            }
                            if(response.data == "duplicado")
                            {
                                Swal.fire(
                                    'Error!',
                                    'Registro ya existe.',
                                    'warning'
                                );
                            }

                        })
                        .catch(function(error) {
                            console.log(error)
                        })
                }
            });
        }
    };


}

let bind = new modalidadCNUVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();

    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});