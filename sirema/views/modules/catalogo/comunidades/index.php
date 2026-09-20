<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MUNIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Comunidades</h3>
        <h6 class="op-7 mb-2">Administracion de Comunidades</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalComunidad">
            Agregar Comunidad
        </button>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Comunidades</h4>
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
                            <th>Comunidad</th>
                            <th>Municipio</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                      
                        <tbody data-bind="html: table_comunidades">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->




<!-- Modal Para Agregar una Comunidad-->
<div class="modal fade" id="modalComunidad" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalComunidadLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalComunidadLabel">Comunidad Nueva</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                <div class="row">

                    <div class="col-6">

                        <label for="comunidad">Nombre del Comunidad</label>
                        <input class="form-control" id="comunidad" data-bind="value: comunidad" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="municipio_id">Seleccione Municipio</label>
                        <select class="form-select" id="municipio_id" data-bind="html: select_municipios, event:{ change: obtenerMunicipio}">

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


<!-- Modal Para actualiar una comunidad-->
<div class="modal fade" id="modalComunidadActualizar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="modalComunidadActualizarLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalComunidadActualizarLabel">Actualizar Comunidad</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">

                        <label for="comunidad_nuevo">Nombre del Comunidad</label>
                        <input class="form-control" id="comunidad_nuevo" data-bind="value: comunidad_nuevo" autocomplete="off">

                    </div>
                    <div class="col-6">

                        <label for="municipio_id_nuevo">Seleccione Municipio</label>
                        <select class="form-select" id="municipio_id_nuevo" data-bind="html: select_municipios, event:{change:obtenerMunicipioNuevo}">

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