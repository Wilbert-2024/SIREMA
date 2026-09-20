//Anclaje a modal para crear un nuevo municipio
var modalAnioCarrera = new bootstrap.Modal(document.getElementById('modalAnioCarrera'), {
    keyboard: false
})

///Anclaje a modal para actualizar un municipio
var modalAnioCarreraActualizar = new bootstrap.Modal(document.getElementById('modalAnioCarreraActualizar'), {
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
    axios.post("views/ajax/catalogoEdu/aniosCarrera/action.php", { type: "getTable"})
        .then(function(response) {
            bind.table_anios_carrera(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para eliminar un registro de Año de Carrera
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
            axios.post("views/ajax/catalogoEdu/aniosCarrera/action.php", { type: "changeState", Id: id })
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
                        'El Año de Carrera ha actualizado correctamente.',
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
* Funcion para actualizar un registro de Año de Carrera
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogoEdu/aniosCarrera/action.php", { type: "find", Id: id })
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

            bind.id(response.data.Id)
            bind.anio_carrera_nuevo(response.data.DescripcionAnioCarrera)
            modalAnioCarreraActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let anioCarreraVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.anio_carrera = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_anios_carrera = ko.observable();
    self.anio_carrera_nuevo = ko.observable("");

    self.guardar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                anio_carrera: self.anio_carrera()
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
                    axios.post("views/ajax/catalogoEdu/aniosCarrera/action.php", { type: "insert", data: form })
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
                                    'El Año de Carrera ha sido creado exitosamente.',
                                    'success'
                                );

                                modalAnioCarrera.hide();
                                self.anio_carrera("");
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
        if (bind.anio_carrera_nuevo() == "") {
            alert("Escriba el nombre del nuevo año de carrera");
        }

        else
        {
            let  form={
                anio_carrera_nuevo: self.anio_carrera_nuevo(),
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
                    axios.post("views/ajax/catalogoEdu/aniosCarrera/action.php", { type: "update", data: form })
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
                                    'El Año de Carrera ha sido actualizado exitosamente.',
                                    'success'
                                );

                                modalAnioCarreraActualizar.hide();
                                self.anio_carrera_nuevo("");
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

let bind = new anioCarreraVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();

    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});