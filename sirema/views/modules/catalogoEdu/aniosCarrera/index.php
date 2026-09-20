<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('ANCIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Años de Carrera</h3>
        <h6 class="op-7 mb-2">Administracion de Años de Carrera</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalAnioCarrera">
            Agregar Año Carrera
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Años de Carrea</h4>
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
                        <tbody data-bind="html: table_anios_carrera">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar un año de carrera-->
<div class="modal fade" id="modalAnioCarrera" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAnioCarreraLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalAnioCarreraLabel">Año de Carrera Nuevo</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="anio_carrera">Nombre del Año Carrera</label>
                <input class="form-control" id="anio_carrera" data-bind="value: anio_carrera" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Para actualiar un Año de Carrera-->
<div class="modal fade" id="modalAnioCarreraActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalAnioCarreraActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalAnioCarreraActualizarLabel">Actualizar Año de Carrera</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <label for="anio_carrera_nuevo">Nuevo Nombre de Año de Carrera</label>
                <input class="form-control" id="anio_carrera_nuevo" data-bind="value: anio_carrera_nuevo" autocomplete="off">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" data-bind="click: actualizar">Actualizar</button>
            </div>
        </div>
    </div>
</div>