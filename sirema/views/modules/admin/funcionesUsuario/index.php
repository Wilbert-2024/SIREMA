<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('FUUSIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Funciones de Usuarios</h3>
        <h6 class="op-7 mb-2">Administración de funciones de usuarios</h6>
    </div>
</div>


    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-3">
                        <label for="tipo_funcion">Seleccionar Tipo de Funcion</label>
                        <select class="form-select" id="tipo_funcion" data-bind="value: tipo_funcion, event:{change: change_tipo_function}">
                            <option value="null">Seleccione</option>
                            <option value="cen">Centros</option>
                            <option value="fun">Funciones</option>
                        </select>
                    </div>
                    <div class="col-3" data-bind="visible:showFechas">
                        <label>Inicio de Permiso</label>
                        <input type="text" data-bind="value: fecha_inicio" class="form-control" id="datetimepicker1">
                    </div>

                    <div class="col-3" data-bind="visible:showFechas">
                        <label>Termina de Permiso</label>
                        <input type="text" data-bind="value: fecha_final" class="form-control" id="datetimepicker2">
                    </div>
                    <div class="col-3">
                        <label for="buscar_usuario">Buscar Usuario</label>
                        <button class="btn btn-secondary form-control" data-bs-toggle="modal" data-bs-target="#buscarUsuarioModal">Buscar</button>
                    </div>
                </div>
            </div>

            <div class="card-body" >
                <div class="row" >
                    <!--Centros Seleccionados-->
                    <div class="col-3 border border-2">
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

                    <div class="col-9">
                        <div class="row">
                            <div class="text-end">
                                <a class="btn btn-primary" href="#" data-bind="click: guardar"><i class="fas fa-arrow-alt-circle-down fa-1x"></i> Guardar Cambios</a>
                            </div>
                            <!--Carreras Disponibles-->
                            <div class="col-6" >
                                <div style="font-size: large; font-weight: bold;">Registros Disponibles</div>
                                <button type="button" class="btn btn-outline-primary btn-sm mb-2" data-bind="click: agregarSeleccionados, enable: seleccionDisponibles().length > 0, visible: tipo_funcion() === 'fun'">Agregar seleccionadas →</button>
                                <div class="border border-2 overflow-scroll h-25 registros">
                                    <ul class="list-group border border-1" data-bind="foreach: registrosNoPertenecientesAUsuario" style="font-size: medium; font-weight: normal;">
                                        <li class="list-group-item">
                                            <label class="d-flex align-items-center gap-2 mb-0" data-bind="visible: $parent.tipo_funcion() === 'fun'">
                                                <input type="checkbox" data-bind="checked: $parent.seleccionDisponibles, checkedValue: RegistroId()" aria-label="Seleccionar función disponible">
                                                <span data-bind="text: Descripcion"></span>
                                            </label>
                                            <a href="#" data-bind="visible: $parent.tipo_funcion() !== 'fun', click: remover"><span data-bind="text: Descripcion"></span> →</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!--Carreras Asignadas al centro-->
                            <div class="col-6">
                                <div style="font-size: large; font-weight: bold;">Registros Del Usuario</div>
                                <button type="button" class="btn btn-outline-secondary btn-sm mb-2" data-bind="click: quitarSeleccionados, enable: seleccionAsignadas().length > 0, visible: tipo_funcion() === 'fun'">← Quitar seleccionadas</button>
                                <div class="border border-2 overflow-scroll h-25">
                                    <ul class="list-group border border-1" data-bind="foreach: registrosPertenecientesAUsuario" style="font-size: medium; font-weight: normal;">
                                        <li class="list-group-item">
                                            <label class="d-flex align-items-center gap-2 mb-0" data-bind="visible: $parent.tipo_funcion() === 'fun'">
                                                <input type="checkbox" data-bind="checked: $parent.seleccionAsignadas, checkedValue: RegistroId()" aria-label="Seleccionar función asignada">
                                                <span data-bind="text: Descripcion"></span>
                                            </label>
                                            <a href="#" data-bind="visible: $parent.tipo_funcion() !== 'fun', click: remover">← <span data-bind="text: Descripcion"></span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


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
