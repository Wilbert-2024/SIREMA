<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('CENIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Centros</h3>
        <h6 class="op-7 mb-2">Administracion de Centros</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a  class="btn btn-primary" href="catalogo_centros_create">
            Agregar Centro
        </a>
    </div>
</div>

<!--Inicio de Tabla--->
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Centros</h4>
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
                            <th>Nombre Centro</th>
                            <th>Tipo Centro</th>
                            <th>Comunidad</th>
                            <th>Centro Padre</th>
                            <th>Accion</th>
                        </tr>
                        </thead>
                        
                        <tbody data-bind="html: table_centros">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Fin de Tabla--->