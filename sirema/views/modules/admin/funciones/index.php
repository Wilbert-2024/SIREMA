<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('FUNIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Funciones</h3>
        <h6 class="op-7 mb-2">Administracion de Funciones</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="admin_funciones_create" class="btn btn-primary btn-round">Crear Funcion</a>
    </div>

</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Funciones</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table
                        id="basic-datatables"
                        class="display table table-striped table-hover"
                    >
                        <thead>
                        <tr>
                            <th>Controller</th>
                            <th>Accion</th>
                            <th>Acronimo</th>
                            <th>Estado</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Controller</th>
                            <th>Accion</th>
                            <th>Acronimo</th>
                            <th>Estado</th>
                            <th>Accion</th>
                        </tr>
                        </tfoot>
                        <tbody data-bind="html: table_funciones">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
