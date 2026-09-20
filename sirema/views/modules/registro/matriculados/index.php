<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MATRIN');
if(!$estado['Estado'])
    echo '<script>location.href = "error_403";</script>';
?>
<div
    class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
>
    <div>
        <h3 class="fw-bold mb-3">Registro Matriculados</h3>
        <h6 class="op-7 mb-2">Administración de Registro de Matriculados</h6>
    </div>

    <div class="ms-md-auto py-2 py-md-0">
        <a href="registro_matriculados_create" class="btn btn-primary btn-round">Agregar Registro</a>
    </div>
</div>

<div class="row mt-3">
    <div class="col-12">
        <div class="card">
            <div class="card-body bg-gray1">
                <div class="card-title">FILTROS PARA BUSCAR REGISTROS</div>
                <hr>
                <div class="row">
                    <div class="col-3">
                        <label for="anio_lectivo_id">Anio Lectivo</label>
                        <select class="form-select" id="anio_lectivo_id" data-bind="html:select_anios_lectivos"></select>
                    </div>

                    <div class="col-3">
                        <label for="centro_id">Centro</label>
                        <select class="form-select" id="centro_id" data-bind="html:select_centros"></select>
                    </div>

                    <div class="col-3">
                        <label for="carrera_id">Carrera</label>
                        <select class="form-select" id="carrera_id" data-bind="html:select_carreras"></select>
                    </div>

                    <div class="col-3">
                        <label for="tipo_ingreso_id">Tipo Ingreso</label>
                        <select class="form-select" id="tipo_ingreso_id" data-bind="html:select_tipos_ingresos"></select>
                    </div>
                </div>

                <hr>
                <div class="text-end">
                    <a class="btn btn-info" data-bind="click: buscar"><i class="fas fa-crosshairs"></i> Buscar</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row mt-3">
    <div class="card">
        <div class="card-body">
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Centro</th>
                        <th>Carrera</th>
                        <th>Tipo Ingreso</th>
                        <th>Semestre</th>
                        <th>Fecha Creacion</th>
                        <th>Total</th>
                        <th>Acciones</th>
                    </tr>
                </thead>

                <tbody data-bind="foreach: registrosTabla">
                    <tr>
                        <td data-bind="text: Orden"></td>
                        <td data-bind="text: Centro"></td>
                        <td data-bind="text: Carrera"></td>
                        <td data-bind="text: TipoIngreso"></td>
                        <td data-bind="text: Semestre"></td>
                        <td data-bind="text: Fecha"></td>
                        <td data-bind="text: Total"></td>
                        <td>
                            <a class="text text-danger" data-bind="click: anular" style="cursor: pointer;"><i class="fas fa-eye-slash fa-2x"></i></a>
                            <div>
                                <form method="post" action="reporte_informes_reporteRegistroMatriculado" target="_blank">
                                    <input type="hidden" data-bind="value: Id" name="Id">
                                    <input type="submit" class="btn btn-primary mb-2" id="generar" value="Generar" name="generar">
                                </form>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
