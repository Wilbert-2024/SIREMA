<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('FUNUP');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Funcion</h3>
        <h6 class="op-7 mb-2">Crear Actualizar Funcion</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="admin_funciones_index" class="btn btn-primary btn-round">Regresar</a>
    </div>

</div>

<div class="row">
    <div class="col-md-12">
        <div class="card">

            <div class="card-header">
                <div class="card-title">Actualizar</div>
            </div>

            <div class="card-body">
                <div class="row">
                    <input type="hidden" value="<?php  echo $_GET['id'];?>" id="id">
                    <!--Controlador-->
                    <div class="col-4">
                        <label for="controlador">Controlador</label>
                        <input class="form-control" id="controlador" placeholder="controlador" autocomplete="off" data-bind="value:controlador">
                    </div>

                    <!--Accion-->
                    <div class="col-4">
                        <label for="accion">Accion</label>
                        <input class="form-control" id="accion" placeholder="accion" autocomplete="off" data-bind="value:accion">
                    </div>

                    <!--Acronimo-->
                    <div class="col-4">
                        <label for="acronimo">Acronimo</label>
                        <input class="form-control" id="acronimo" placeholder="acronimo" autocomplete="off" data-bind="value:acronimo">
                    </div>
                </div>

                <!--Buttons-->
                <div class="card-action">
                    <button class="btn btn-success" id="submit" data-bind="click:actualizar">Actualizar</button>
                    <a class="btn btn-secondary" href="admin_funciones_index">Regresar</a>
                </div>
            </div>
        </div>
    </div>
</div>
