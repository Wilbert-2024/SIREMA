//Anclaje a modal para crear un nuevo comunidad
var modalCarrera = new bootstrap.Modal(document.getElementById('modalCarrera'), {
    keyboard: false
})

///Anclaje a modal para actualizar una comunidad
var modalCarreraActualizar = new bootstrap.Modal(document.getElementById('modalCarreraActualizar'), {
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
    axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "getTable"})
        .then(function(response) {

            bind.table_carreras(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de municipios en Select
* */
function renderSelectAreasConocimiento()
{
    axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "getAreasCon"})
        .then(function(response) {
            bind.select_areasConocimiento(response.data);
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
            axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "changeState", Id: id })
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
                        'El Carrera ha actualizado correctamente.',
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
    axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.carrera_nuevo(response.data.DescripcionCarrera)
            $("#area_conocimiento_id_nuevo").val(response.data.AreasDelConocimiento_Id)
            bind.area_conocimiento_id_nuevo(response.data.AreasDelConocimiento_Id);
            modalCarreraActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let carreraVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.carrera = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.area_conocimiento_id = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_carreras = ko.observable();
    self.select_areasConocimiento = ko.observable();

    self.obtenerAreaConocimiento = function()
    {
        self.area_conocimiento_id($("#area_conocimiento_id").val())
    }

    self.obtenerAreaConocimientoNuevo = function()
    {
        self.area_conocimiento_id_nuevo($("#area_conocimiento_id_nuevo").val())
    }

    self.carrera_nuevo = ko.observable("");
    self.area_conocimiento_id_nuevo = ko.observable(0);

    self.guardar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                carrera: self.carrera(),
                area_conocimiento_id : self.area_conocimiento_id()
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
                    axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "insert", data: form })
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
                                    'La Carrera ha sido creado exitosamente.',
                                    'success'
                                );

                                modalCarrera.hide();
                                self.carrera("");
                                self.area_conocimiento_id(0);
                                $("#area_conocimiento_id").val(0)
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
        if (bind.carrera_nuevo() == "") {
            alert("Escriba el nombre de la carrera");
            return;
        }

        if(bind.area_conocimiento_id_nuevo() == 0)
        {
            alert("Seleccione un Area de Conocimiento");
            return;
        }


        let  form={
            carrera_nuevo: self.carrera_nuevo(),
            area_conocimiento_id_nuevo: self.area_conocimiento_id_nuevo(),
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
                axios.post("views/ajax/catalogoEdu/carreras/action.php", { type: "update", data: form })
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
                                'La Carrera ha sido actualizado exitosamente.',
                                'success'
                            );

                            modalCarreraActualizar.hide();
                            self.carrera_nuevo("");
                            self.area_conocimiento_id_nuevo(0);
                            $("#area_conocimiento_id_nuevo").val(0)
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

let bind = new carreraVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){
    ko.applyBindings(bind);

    renderTable();

    renderSelectAreasConocimiento();
    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});