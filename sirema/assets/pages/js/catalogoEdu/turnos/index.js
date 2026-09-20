//Anclaje a modal para crear un nuevo comunidad
var modalTurno = new bootstrap.Modal(document.getElementById('modalTurno'), {
    keyboard: false
})

///Anclaje a modal para actualizar una comunidad
var modalTurnoActualizar = new bootstrap.Modal(document.getElementById('modalTurnoActualizar'), {
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
    axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "getTable"})
        .then(function(response) {

            bind.table_turnos(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}

/*
* Funcion para mostrar registros
* de municipios en Select
* */
function renderSelectModalidades()
{
    axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "getModalidades"})
        .then(function(response) {
            bind.select_modalidad(response.data);
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
            axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "changeState", Id: id })
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
                        'El Turno ha sido actualizado correctamente.',
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
    axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "find", Id: id })
        .then(function(response) {
            bind.id(response.data.Id)
            bind.turno_nuevo(response.data.DescripcionTurno)
            $("#modalidad_id_nuevo").val(response.data.Modalidad_Id)
            bind.modalidad_id_nuevo(response.data.Modalidad_Id);
            modalTurnoActualizar.show();
        })
        .catch(function(error) {
            console.log(error)
        })

}

let turnoVm = function ()
{
    self =this;
    self.id = ko.observable(0);
    self.turno = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.modalidad_id = ko.observable().extend({required:{params:true, message:"Campo requerido"}});
    self.table_turnos = ko.observable();
    self.select_modalidad = ko.observable();

    self.obtenerModalidad = function()
    {
        self.modalidad_id($("#modalidad_id").val())
    }

    self.obtenerModalidadNuevo = function()
    {
        self.modalidad_id_nuevo($("#modalidad_id_nuevo").val())
    }

    self.turno_nuevo = ko.observable("");
    self.modalidad_id_nuevo = ko.observable(0);

    self.guardar = function()
    {
        if (bind.errors().length != 0) {

            bind.errors.showAllMessages();
        }

        else
        {
            let  form={
                turno: self.turno(),
                modalidad_id : self.modalidad_id()
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
                    axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "insert", data: form })
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
                                    'El Turno ha sido creado exitosamente.',
                                    'success'
                                );

                                modalTurno.hide();
                                self.turno("");
                                self.modalidad_id(0);
                                $("#modalidad_id").val(0)
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
        if (bind.turno_nuevo() == "") {
            alert("Escriba el nombre de turno");
            return;
        }

        if(bind.modalidad_id_nuevo() == 0)
        {
            alert("Seleccione una Modalidad");
            return;
        }


        let  form={
            turno_nuevo: self.turno_nuevo(),
            modalidad_id_nuevo: self.modalidad_id_nuevo(),
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
                axios.post("views/ajax/catalogoEdu/turnos/action.php", { type: "update", data: form })
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
                                'el turno ha sido actualizado exitosamente.',
                                'success'
                            );

                            modalTurnoActualizar.hide();
                            self.turno_nuevo("");
                            self.modalidad_id_nuevo(0);
                            $("#modalidad_id_nuevo").val(0)
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

let bind = new turnoVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){
    ko.applyBindings(bind);

    renderTable();

    renderSelectModalidades();
    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});