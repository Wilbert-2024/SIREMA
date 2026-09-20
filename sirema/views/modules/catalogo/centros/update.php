<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('CENUP');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Centros</h3>
        <h6 class="op-7 mb-2">Actualizar Centro</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="catalogo_centros_index" class="btn btn-primary btn-round">Regresar</a>
    </div>

</div>

<div class="row">
    <div class="col-md-12">
        <div class="card">

            <div class="card-header">
                <div class="card-title">Actualizar</div>
            </div>

            <div class="card-body">
                <input type="hidden" value="<?php echo $_GET["id"];?>" id="id" data-bind="value: id">
                <div class="row mb-2">
                    <div class="col-6">
                        <label for="descripcion_centro">Centro</label>
                        <input type="text" class="form-control" id="descripcion_centro" data-bind="value: descripcion_centro" placeholder="Nombre del Centro" autocomplete="off">
                    </div>

                    <div class="col-6">
                        <label for="tipo_centro_id">Seleccione el Tipo de Centro</label>
                        <select class="form-select" id="tipo_centro_id" data-bind="value:tipo_centro_id ,html: selectTipoCentros, event:{change: getTipoCentro}">

                        </select>
                    </div>
                </div>

                <div class="row">

                    <div class="col-6">
                        <label for="comunidad_id">Seleccione la Comunidad</label>
                        <select class="form-select" id="comunidad_id" data-bind="value:comunidad_id ,html: selectComunidades, event:{change: getComunidad}">

                        </select>
                    </div>

                    <div class="col-6" data-bind="visible: esHijo">
                        <label for="padre_id">Seleccione la Centro Padre</label>
                        <select class="form-select" id="padre_id" data-bind="value:padre_id, html: selectCentrosPadres, event:{change: getCentroPadre}">

                        </select>
                    </div>
                </div>

                <!--Buttons-->
                <div class="card-action">
                    <button class="btn btn-success" id="submit" data-bind="click:actualizar">Actualizar</button>
                    <a class="btn btn-secondary" href="catalogo_centros_index">Regresar</a>
                </div>

            </div>

        </div>
    </div>
</div>