<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('USUP');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Usuario</h3>
        <h6 class="op-7 mb-2">Crear Nuevo Usuario</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="admin_users_index" class="btn btn-primary btn-round">Regresar</a>
    </div>

</div>

<div class="row">
    <div class="col-md-12">
        <div class="card">

            <div class="card-header">
                <div class="card-title">Nuevo</div>
            </div>

            <div class="card-body">
                <div class="row mb-2">
                    <input type="hidden" value="<?php echo $_GET['id'];?>" id="id" data-bind="value: id">
                    <div class="col-6">
                        <label for="usuario">Nombre Usuario</label>
                        <input type="text" class="form-control" id="usuario" data-bind="value: usuario" placeholder="Nombre del Usuario" autocomplete="off">
                    </div>

                    <div class="col-6">
                        <label for="centro_id">Seleccione el Centro</label>
                        <select class="form-select" id="centro_id" data-bind="value:centro_id ,html: selectCentros, event:{change: getCentro}">

                        </select>
                    </div>
                </div>

                <!--Buttons-->
                <div class="card-action">
                    <button class="btn btn-success" id="submit" data-bind="click:update">Actualizar</button>
                    <a class="btn btn-secondary" href="admin_users_index">Regresar</a>
                </div>

            </div>

        </div>
    </div>
</div>
