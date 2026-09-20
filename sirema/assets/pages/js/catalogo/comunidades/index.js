//Anclaje a modal para crear un nuevo comunidad
var modalComunidad = new bootstrap.Modal(document.getElementById('modalComunidad'), {
    keyboard: false
})

///Anclaje a modal para actualizar una comunidad
var modalComunidadActualizar = new bootstrap.Modal(document.getElementById('modalComunidadActualizar'), {
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
    axios.post("views/ajax/catalogo/comunidades/action.php", { type: "getTable"})
        .then(function(response) {

            bind.table_comunidades(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de municipios en Select
* */
function renderSelectMunicipios()
{
    axios.post("views/ajax/catalogo/comunidades/action.php", { type: "getMunicipios"})
        .then(function(response) {
            bind.select_municipios(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}
/*
* Funcion para eliminar un registro de Comunidad
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
            axios.post("views/ajax/catalogo/comunidades/action.php", { type: "changeState", Id: id })
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
* Funcion para actualizar un registro de Comunidad
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogo/comunidades/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.comunidad_nuevo(response.data.DescripcionComunidad)
            $("#municipio_id_nuevo").val(response.data.Municipio_Id)
            bind.municipio_id_nuevo(response.data.Municipio_Id);
            modalComunidadActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let comunidadVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.comunidad = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.municipio_id = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_comunidades = ko.observable();
    self.select_municipios = ko.observable();

    self.obtenerMunicipio = function()
    {
        self.municipio_id($("#municipio_id").val())
    }

    self.obtenerMunicipioNuevo = function()
    {
        self.municipio_id_nuevo($("#municipio_id_nuevo").val())
    }

    self.comunidad_nuevo = ko.observable("");
    self.municipio_id_nuevo = ko.observable(0);

    self.guardar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                comunidad: self.comunidad(),
                municipio_id : self.municipio_id()
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
                    axios.post("views/ajax/catalogo/comunidades/action.php", { type: "insert", data: form })
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
                                    'La Comunidad ha sido creado exitosamente.',
                                    'success'
                                );

                                modalComunidad.hide();
                                self.comunidad("");
                                self.municipio_id(0);
                                $("#municipio_id").val(0)
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
        if (bind.comunidad_nuevo() == "") {
            alert("Escriba el nombre del nuevo centro");
           return;
        }

        if(bind.municipio_id_nuevo() == 0)
        {
            alert("Seleccione un Municipio");
            return;
        }


            let  form={
                comunidad_nuevo: self.comunidad_nuevo(),
                municipio_id_nuevo: self.municipio_id_nuevo(),
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
                    axios.post("views/ajax/catalogo/comunidades/action.php", { type: "update", data: form })
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
                                    'La Comunidad ha sido actualizado exitosamente.',
                                    'success'
                                );

                                modalComunidadActualizar.hide();
                                self.comunidad_nuevo("");
                                self.municipio_id_nuevo(0);
                                $("#municipio_id_nuevo").val(0)
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

    };


}

let bind = new comunidadVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();
    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
    renderSelectMunicipios();
});