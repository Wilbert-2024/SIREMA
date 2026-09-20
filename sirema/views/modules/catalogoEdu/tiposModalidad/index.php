<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('TMCNUIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>

<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Tipos Modalidad CNU</h3>
        <h6 class="op-7 mb-2">Administracion de Modalidades CNU</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalModalidadCNU">
            Agregar Modalidad CNU
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Modalidades CNU</h4>
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
                            <th>Descripcion</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>N°</th>
                            <th>Descripcion</th>
                            <th>Accion</th>
                        </tr>
                        </tfoot>
                        <tbody data-bind="html: table_modalidadesCNU">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar un grupo-->
<div class="modal fade" id="modalModalidadCNU" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalModalidadCNULabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalModalidadCNULabel">Modalidad Nuevo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="modalidadCNU">Nombre</label>
                <input class="form-control" id="modalidadCNU" data-bind="value: modalidadCNU" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Para actualiar un grupo-->
<div class="modal fade" id="modalModalidadCNUctualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalModalidadCNUctualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalModalidadCNUctualizarLabel">Actualizar Modalidad</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="modalidadCNU_nuevo">Nuevo Nombre</label>
                <input class="form-control" id="modalidadCNU_nuevo" data-bind="value: modalidadCNU_nuevo" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: actualizar">Actualizar</button>
            </div>
        </div>
    </div>
</div>
