/*
* Funcion para des-habilitar un registro de menu
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
            axios.post("views/ajax/admin/funciones/action.php", { type: "changeState", Id: id })
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
                        'El Menu ha actualizado correctamente.',
                        'success'
                    );

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
    axios.post("views/ajax/admin/funciones/action.php", { type: "getTable"})
        .then(function(response) {
            bind.table_funciones(response.data);
        })
        .catch(function(error) {
            console.log(error)
        })
}


let funcionVm = function () {
    self = this;
    self.table_funciones = ko.observable();
}

let bind = new funcionVm();
bind.errors = ko.validation.group(bind);

$(document).ready(function(){

    ko.applyBindings(bind);

    renderTable();

    setTimeout(function (){
        $("#basic-datatables").DataTable({});
    },100)
});