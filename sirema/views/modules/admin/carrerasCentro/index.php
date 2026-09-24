<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('CACEIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Carreras por Centro</h3>
        <h6 class="op-7 mb-2">Administracion de Carreras por Centro</h6>
    </div>
</div>
<div class="row">
    <div class="col-6"></div>
    <div class="col-6 z-2">
        <label for="buscar_centro">Buscar Centro</label>
        <input class="form-control mt-1" id="buscar_centro" data-bind="" autocomplete="off" placeholder="Escribe el nombre de centro">
        <ul class="list-group position-absolute" data-bind="foreach: ListaDeCentrosABuscar">
            <li class="list-group-item bg bg-gray1">
                <div style="font-size: medium"><span data-bind="text: Descripcion"></span> <a href="#" data-bind="click: remover"><i class="fas fa-plus-square fa-1x"></i></a></div>
            </li>
        </ul>
    </div>
</div>


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">

            </div>

            <div class="card-body">
                <div class="row">
                    <!--Centros Seleccionados-->
                    <div class="col-2 border border-2">
                        <div class="text-start" style="font-size: large; font-weight: bold;">Centros Seleccionados</div>
                            <hr>
                        <div>
                            <ul data-bind="foreach: ListaDeCentrosAgregados" class="list-group">
                                <li class="list-group-item" data-bind="click: filtrarCarreras">
                                    <div style="font-size: medium"><span data-bind="text: Descripcion"></span> <a href="#" data-bind="click: remover" class="text-danger"><i class="fas fa-times fa-1x"></i></a></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                  <div class="col-10">
                      <div class="row">
                          <div class="text-end">
                              <a class="btn btn-primary" href="#" data-bind="click: guardar"><i class="fas fa-arrow-alt-circle-down fa-1x"></i> Guardar Cambios</a>
                          </div>
                          <!--Carreras Disponibles-->
                          <div class="col-6" >
                              <div style="font-size: large; font-weight: bold;">Carreras Disponibles</div>
                              <button type="button" class="btn btn-outline-primary btn-sm mb-2" data-bind="click: agregarSeleccionadas, enable: seleccionDisponibles().length > 0">Agregar seleccionadas →</button>
                              <div class="border border-2 overflow-scroll h-25">
                                  <ul class="list-group border border-1" data-bind="foreach: CarrerasNoPertenecientes" style="font-size: medium; font-weight: normal;">
                                      <li class="list-group-item">
                                          <label class="d-flex align-items-center gap-2 mb-0">
                                              <input type="checkbox" data-bind="checked: $parent.seleccionDisponibles, checkedValue: Id()" aria-label="Seleccionar carrera disponible">
                                              <span data-bind="text: Descripcion"></span>
                                          </label>
                                      </li>
                                  </ul>
                              </div>
                          </div>

                          <!--Carreras Asignadas al centro-->
                          <div class="col-6">
                              <div style="font-size: large; font-weight: bold;">Carreras En el Centro</div>
                              <button type="button" class="btn btn-outline-secondary btn-sm mb-2" data-bind="click: quitarSeleccionadas, enable: seleccionAsignadas().length > 0">← Quitar seleccionadas</button>
                              <div class="border border-2 overflow-scroll h-25">
                                  <ul class="list-group border border-1" data-bind="foreach: CarrerasPertenecientesAlCentro" style="font-size: medium; font-weight: normal;">
                                      <li class="list-group-item">
                                          <label class="d-flex align-items-center gap-2 mb-0">
                                              <input type="checkbox" data-bind="checked: $parent.seleccionAsignadas, checkedValue: Id()" aria-label="Seleccionar carrera asignada">
                                              <span data-bind="text: Descripcion"></span>
                                          </label>
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
</div>
