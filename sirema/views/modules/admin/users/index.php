<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('USIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Usuarios</h3>
        <h6 class="op-7 mb-2">Administracion de Usuarios</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="admin_users_create" class="btn btn-primary btn-round">Agregar Usuario</a>
    </div>

</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Usuarios</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table
                            id="basic-datatables"
                            class="display table table-striped table-hover"
                    >
                        <thead>
                        <tr>
                            <th>N°</th>
                            <th>Nombre Usuario</th>
                            <th>Centro Perteneciente</th>
                            <th>FechaDeCreacion</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                   
                        <tbody data-bind="html: table_usuarios">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->


<!-- Modal Para actualiar la contrasenia del usuario-->
<div class="modal fade" id="modalClaveActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalClaveActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalClaveActualizarLabel">Actualizar Etnia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="etnia_nuevo">La Nueva Clave del Usuario sera: </label>
                <label class="form-label" data-bind="text: clave_nueva" style="font-weight: bold"></label>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: actualizar">Actualizar</button>
            </div>
        </div>
    </div>
</div>