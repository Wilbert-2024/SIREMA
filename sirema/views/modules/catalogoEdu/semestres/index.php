<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('SEMIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Semestres</h3>
        <h6 class="op-7 mb-2">Administracion de Semestre</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSemestre">
            Agregar Semestre
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Semestres</h4>
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
                        <tbody data-bind="html: table_semestres">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar un semestre-->
<div class="modal fade" id="modalSemestre" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalSemestreLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSemestreLabel">Semestre Nuevo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="semestre">Nombre del Semestre</label>
                <input class="form-control" id="semestre" data-bind="value: semestre" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Para actualiar un semestre-->
<div class="modal fade" id="modalSemestreActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalSemestreActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalSemestreActualizarLabel">Actualizar Semestre</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="semestre_nuevo">Nuevo Nombre del Semestre</label>
                <input class="form-control" id="semestre_nuevo" data-bind="value: semestre_nuevo" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: actualizar">Actualizar</button>
            </div>
        </div>
    </div>
</div>