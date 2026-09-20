<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('TURIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Turnos</h3>
        <h6 class="op-7 mb-2">Administracion de Turnos</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalTurno">
            Agregar Turno
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Turnos</h4>
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
                            <th>Turno</th>
                            <th>Modalidad</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>N°</th>
                            <th>Turno</th>
                            <th>Modalidad</th>
                            <th>Accion</th>
                        </tr>
                        </tfoot>
                        <tbody data-bind="html: table_turnos">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar una Turno-->
<div class="modal fade" id="modalTurno" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalTurnoLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTurnoLabel">Turno Nuevo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row">

                    <div class="col-6">

                        <label for="turno">Nombre de Turno</label>
                        <input class="form-control" id="turno" data-bind="value: turno" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="modalidad_id">Seleccione Modalidad</label>
                        <select class="form-select" id="modalidad_id" data-bind="html: select_modalidad, event:{ change: obtenerModalidad}">

                        </select>
                    </div>

                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Para actualiar una turno-->
<div class="modal fade" id="modalTurnoActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalTurnoActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTurnoActualizarLabel">Actualizar Turno</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">

                        <label for="turno_nuevo">Nombre de Turno</label>
                        <input class="form-control" id="turno_nuevo" data-bind="value: turno_nuevo" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="modalidad_id_nuevo">Seleccione Modalidad</label>
                        <select class="form-select" id="modalidad_id_nuevo" data-bind="html: select_modalidad, event:{change:obtenerModalidadNuevo}">

                        </select>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: actualizar">Actualizar</button>
            </div>
        </div>
    </div>
</div>
