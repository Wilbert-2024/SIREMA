<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('ENLUP');
if (!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';


$enlace = new urlController();
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Enlaces</h3>
        <h6 class="op-7 mb-2">Actualizar Enlaces</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="admin_urls_index" class="btn btn-primary btn-round">Regresar</a>
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
                    <!--Texto Modulo-->
                    <div class="col-6">
                        <label for="texto_mostrar">Texto Modulo Mostrar</label>
                        <input class="form-control" id="texto_mostrar" placeholder="Texto Modulo de mostrar" autocomplete="off" data-bind="value:texto_mostrar">
                    </div>

                    <!--Modulo Padre-->
                    <div class="col-6">
                        <label for="padre_id">Modulo Padre</label>
                        <select class="form-select" id="padre_id" data-bind="value:padre_id">
                            <?php
                            $enlace->getEnlacesPadres();
                            ?>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" value="<?php  echo $_GET['id'];?>" id="id">
                    <!--Modulo-->
                    <div class="col-6">
                        <label for="modulo">Modulo</label>
                        <input class="form-control" id="modulo" placeholder="Modulo Principal" autocomplete="off" data-bind="value:modulo">
                    </div>

                    <!--Icono de Modulo-->
                    <div class="col-6">
                        <label for="icono_modulo">Icono de Modulo</label>
                        <input class="form-control" id="icono_modulo" placeholder="Icono de Modulo Principal" autocomplete="off" data-bind="value:icono_modulo">
                    </div>
                </div>
                <div class="row mt-2">
                    <!--Accion-->
                    <div class="col-4">
                        <label for="accion">Accion</label>
                        <input class="form-control" id="accion" placeholder="Accion" autocomplete="off" data-bind="value:accion">
                    </div>

                    <!--Icono Accion-->
                    <div class="col-4">
                        <label for="icono_accion">Icono Accion</label>
                        <input class="form-control" id="icono_accion" placeholder="Icono Accion" autocomplete="off" data-bind="value:icono_accion">
                    </div>
                </div>

                <!--Buttons-->
                <div class="card-action">
                        <button class="btn btn-success" id="submit" data-bind="click:update">Actualizar</button>
                    <a class="btn btn-secondary" href="admin_urls_index">Regresar</a>
                </div>
            </div>
        </div>
    </div>
</div>