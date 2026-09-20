//Anclaje a modal para crear un nuevo tipo de centro
var modalTipoCentro = new bootstrap.Modal(document.getElementById('modalTipoCentro'), {
    keyboard: false
})

///Anclaje a modal para actualizar un tipo de contro
var modalTipoCentroActualizar = new bootstrap.Modal(document.getElementById('modalTipoCentroActualizar'), {
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
    axios.post("views/ajax/catalogo/tipocentros/action.php", { type: "getTable"})
        .then(function(response) {
            bind.table_tipo_centros(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para eliminar un registro de tipo de Centro
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
            axios.post("views/ajax/catalogo/tipocentros/action.php", { type: "changeState", Id: id })
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
                        'El Tipo Centro ha actualizado correctamente.',
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
* Funcion para actualizar un registro de Tipo de centro
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogo/tipocentros/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.tipo_centro_nuevo(response.data.DescripcionTipoCentro)
            modalTipoCentroActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let tipoCentroVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.tipo_centro = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_tipo_centros = ko.observable();
    self.tipo_centro_nuevo = ko.observable("");

    self.guardar = function()
    {
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                tipo_centro: self.tipo_centro()
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
                    axios.post("views/ajax/catalogo/tipocentros/action.php", { type: "insert", data: form })
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
                                    'El Tipo Centro ha sido creado exitosamente.',
                                    'success'
                                );

                                modalTipoCentro.hide();
                                self.tipo_centro("");
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
        if (bind.tipo_centro_nuevo() == "") {
           alert("Escriba el nombre del nuevo centro");
        }

        else
        {
            let  form={
                tipo_centro_nuevo: self.tipo_centro_nuevo(),
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
                    axios.post("views/ajax/catalogo/tipocentros/action.php", { type: "update", data: form })
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
                                    'El Tipo Centro ha sido actualizado exitosamente.',
                                    'success'
                                );

                                modalTipoCentroActualizar.hide();
                                self.tipo_centro_nuevo("");
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

let bind = new tipoCentroVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();
});