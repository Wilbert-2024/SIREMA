<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('CARIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Carreras</h3>
        <h6 class="op-7 mb-2">Administracion de Carreras</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCarrera">
            Agregar Carrera
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Carreras</h4>
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
                            <th>Carrea</th>
                            <th>Area Conocimiento</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                       
                        <tbody data-bind="html: table_carreras">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar una Carrera-->
<div class="modal fade" id="modalCarrera" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalCarreraLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalCarreraLabel">Carrera Nueva</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row">

                    <div class="col-6">

                        <label for="carrera">Nombre de Carrera</label>
                        <input class="form-control" id="carrera" data-bind="value: carrera" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="area_conocimiento_id">Seleccione AreaConocimiento</label>
                        <select class="form-select" id="area_conocimiento_id" data-bind="html: select_areasConocimiento, event:{ change: obtenerAreaConocimiento}">

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


<!-- Modal Para actualiar una carrera-->
<div class="modal fade" id="modalCarreraActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalCarreraActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalCarreraActualizarLabel">Actualizar Carrera</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">

                        <label for="carrera_nuevo">Nombre de Carrera</label>
                        <input class="form-control" id="carrera_nuevo" data-bind="value: carrera_nuevo" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="area_conocimiento_id_nuevo">Seleccione Area Conocimiento</label>
                        <select class="form-select" id="area_conocimiento_id_nuevo" data-bind="html: select_areasConocimiento, event:{change:obtenerAreaConocimientoNuevo}">

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
