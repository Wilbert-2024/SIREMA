<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MEUSIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<style>

</style>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Menus</h3>
        <h6 class="op-7 mb-2">Administración de Menus Usuario</h6>
    </div>
</div>

<div class="row mb-3">
    <div class="col-6 text-start">
        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#buscarUsuarioModal">Buscar usuario</button>
    </div>
    <div class="col-6 text-end">

        <a href="#" class="btn btn-primary" data-bind="click: guardar">Guardar Cambios <i class="fas fa-arrow-alt-circle-down"></i></a>
    </div>
</div>

<div class="row">
    <div class="col-3">
        <div class="bg bg-gray1 overflow-auto" style="height: 25rem;">
            <div class="text-start" style="font-size: large; font-weight: bold;">Usuarios Seleccionados</div>
            <hr>
            <div>
                <ul data-bind="foreach: ListaDeUsuariosAgregados" class="list-group">
                    <li class="list-group-item" data-bind="click: filtrarRegistros">
                        <div style="font-size: medium"><span data-bind="text: Descripcion"></span> <a href="#" data-bind="click: remover" class="text-danger"><i class="fas fa-times fa-1x"></i></a></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-9">
        <div class="bg bg-gray1 overflow-auto">
            <div class="text-start" style="font-size: large; font-weight: bold;">Menu Usuarios</div>
            <hr>
            <div class="border border-2 overflow-scroll h-25 registros">
                <ul class="list-group border border-1" data-bind="foreach: MenuUsuario" style="font-size: medium; font-weight: normal;">
                    <li class="list-group-item">
                        <div class="mb-0 mt-0">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-bind="checked: Estado">
                            <label class="form-check-label" for="" data-bind="text: Descripcion">
                            </label>
                        </div>
                        <!--Menus Hijos-->
                        <ul class="list-group border border-1" data-bind="foreach: Hijos" style="font-size: medium; font-weight: normal;">
                            <li class="list-group-item">
                                <div class="mb-0 mt-0">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" data-bind="checked: Estado">
                                    <label class="form-check-label" for="" data-bind="text: Descripcion">
                                    </label>
                                </div>

                            </li>
                        </ul>
                        <!--Termina Menus Hijos-->

                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<!-- Modal para buscar Usuario -->
<div class="modal fade" id="buscarUsuarioModal" tabindex="-1" aria-labelledby="buscarUsuarioModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="buscarUsuarioModalLabel">Buscar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input class="form-control mt-1" id="buscar_centro" data-bind="value: buscar_usuario,click: toggleUsuarioSearch" autocomplete="off" placeholder="Escribe el nombre de usuario">
                <div style="width: 100%; height: 50%">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Usuario</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody data-bind="visible: showUsuarioList, foreach: ListaDeUsuariosABuscar">
                        <tr>
                            <td data-bind="text: Descripcion"></td>
                            <td>
                                <a href="#" data-bind="click: remover"><i class="fas fa-plus-square fa-1x"></i></a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
