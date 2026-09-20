//Anclaje a modal para crear un nuevo municipio
var modalMunicipio = new bootstrap.Modal(document.getElementById('modalMunicipio'), {
    keyboard: false
})

///Anclaje a modal para actualizar un municipio
var modalMunicipioActualizar = new bootstrap.Modal(document.getElementById('modalMunicipioActualizar'), {
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
    axios.post("views/ajax/catalogo/municipios/action.php", { type: "getTable"})
        .then(function(response) {
            if(response.data == 'denegado')
                location.href = 'error_403';
            else
                bind.table_municipios(response.data);

        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para eliminar un registro de Municipio
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
            axios.post("views/ajax/catalogo/municipios/action.php", { type: "changeState", Id: id })
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
                        'El Municipio ha actualizado correctamente.',
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
* Funcion para actualizar un registro de Municipio
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogo/municipios/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.municipio_nuevo(response.data.DescripcionMunicipio)
            modalMunicipioActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let municipioVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.municipio = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_municipios = ko.observable();
    self.municipio_nuevo = ko.observable("");

    self.guardar = function()
    {
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                municipio: self.municipio()
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
                    axios.post("views/ajax/catalogo/municipios/action.php", { type: "insert", data: form })
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

                                modalMunicipio.hide();
                                self.municipio("");
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
        if (bind.municipio_nuevo() == "") {
            alert("Escriba el nombre del nuevo centro");
        }

        else
        {
            let  form={
                municipio_nuevo: self.municipio_nuevo(),
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
                    axios.post("views/ajax/catalogo/municipios/action.php", { type: "update", data: form })
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
                                    'El Municipio ha sido actualizado exitosamente.',
                                    'success'
                                );

                                modalMunicipioActualizar.hide();
                                self.municipio_nuevo("");
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

let bind = new municipioVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();

    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});