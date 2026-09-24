<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MATRIN');
if (!$estado || empty($estado['Estado'])) {
    http_response_code(403);
    echo '<p>Acceso denegado.</p>';
    return;
}
?>
<div id="reporte-etnico" class="pt-2 pb-4">
    <h3>Reporte de distribución étnica</h3>
    <p>Seleccione una matrícula para generar su reporte en PDF.</p>
    <p data-bind="text: estado"></p>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Matrícula</th><th>Centro</th><th>Carrera</th>
                    <th>Total</th><th>Clasificados</th><th>Estado</th><th>Reporte</th>
                </tr>
            </thead>
            <tbody data-bind="foreach: matriculas">
                <tr>
                    <td data-bind="text: Id"></td>
                    <td data-bind="text: Centro"></td>
                    <td data-bind="text: Carrera"></td>
                    <td data-bind="text: Total"></td>
                    <td data-bind="text: TotalEtnias"></td>
                    <td data-bind="text: completo ? 'Completo' : 'Pendiente'"></td>
                    <td>
                        <form method="post" action="reporte_informes_reporteDistribucionEtnica" target="_blank">
                            <input type="hidden" name="Id" data-bind="value: Id">
                            <button type="submit" class="btn btn-primary btn-sm" data-bind="enable: completo">Generar PDF</button>
                        </form>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
