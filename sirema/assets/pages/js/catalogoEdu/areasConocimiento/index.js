//Anclaje a modal para crear un nuevo municipio
var modalAreaConocimiento = new bootstrap.Modal(document.getElementById('modalAreaConocimiento'), {
    keyboard: false
})

///Anclaje a modal para actualizar un municipio
var modalAreaConocimientoActualizar = new bootstrap.Modal(document.getElementById('modalAreaConocimientoActualizar'), {
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
    axios.post("views/ajax/catalogoEdu/areasConocimiento/action.php", { type: "getTable"})
        .then(function(response) {
          bind.table_areas_conocimiento(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para desabilitar un registro de area de conocimiento
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
            axios.post("views/ajax/catalogoEdu/areasConocimiento/action.php", { type: "changeState", Id: id })
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
* Funcion para actualizar un registro de Area del Conocimiento
* */
function updateRegistry(id)
{
    axios.post("views/ajax/catalogoEdu/areasConocimiento/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.area_conocimiento_nuevo(response.data.DescripcionAreaConocimiento)
            bind.acronimo_area_conocimiento_nuevo(response.data.Acronimo)
            modalAreaConocimientoActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let areaConocimientoVm = function () {
    self = this;
    self.id = ko.observable(0);
    self.area_conocimiento = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.acronimo_area_conocimiento = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_areas_conocimiento = ko.observable();

    self.area_conocimiento_nuevo = ko.observable();
    self.acronimo_area_conocimiento_nuevo = ko.observable();

    self.guardar = function()
    {
        if (bind.errors().length != 0) {
            // swal("Atención!", "Porfavor rellene todos los campos antes de crear un comprobante", "warning");
            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                area_conocimiento: self.area_conocimiento(),
                acronimo_area_conocimiento: self.acronimo_area_conocimiento()
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
                    axios.post("views/ajax/catalogoEdu/areasConocimiento/action.php", { type: "insert", data: form })
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
                                    'Nombre o Acronimo ya existe.',
                                    'warning'
                                );
                            }
                            if(response.data == "ok")
                            {
                                Swal.fire(
                                    'Guardado!',
                                    'El Area de conocimiento ha sido creado exitosamente.',
                                    'success'
                                );

                                modalAreaConocimiento.hide();
                                self.area_conocimiento("");
                                self.acronimo_area_conocimiento("");
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
        if (bind.area_conocimiento_nuevo() == "") {
            alert("Escriba el nombre del nuevo centro");
            return;
        }

        if (bind.acronimo_area_conocimiento_nuevo() == "") {
            alert("Escriba el nombre del nuevo centro");
            return;
        }

        let  form={
            area_conocimiento_nuevo: self.area_conocimiento_nuevo(),
            acronimo_area_conocimiento_nuevo: self.acronimo_area_conocimiento_nuevo(),
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
                axios.post("views/ajax/catalogoEdu/areasConocimiento/action.php", { type: "update", data: form })
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
                                'El Area de Conocimiento ha sido actualizado exitosamente.',
                                'success'
                            );

                            modalAreaConocimientoActualizar.hide();
                            self.area_conocimiento_nuevo("");
                            self.acronimo_area_conocimiento_nuevo("");
                            self.id(0);
                            renderTable();
                        }
                        if(response.data == "duplicado")
                        {
                            Swal.fire(
                                'Error!',
                                'Nombre o Acronimo ya existe.',
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

let bind = new areaConocimientoVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();
});