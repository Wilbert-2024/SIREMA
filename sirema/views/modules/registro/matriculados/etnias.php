<?php
$permiso = new funcionUsuarioModel();
$estado = $permiso->validarPermiso('MATRCR');
$matriculaId = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
if (!$estado || empty($estado['Estado']) || !$matriculaId) {
    http_response_code(403);
    echo '<p>Acceso denegado o matrícula inválida.</p>';
    return;
}
?>
<div class="pt-2 pb-4">
    <h3>Distribución étnica de matrícula</h3>
    <a href="registro_matriculados_index">Volver al listado de matrículas</a>
</div>
<div class="card" id="formulario-etnias" data-matricula-id="<?php echo (int) $matriculaId; ?>">
    <div class="card-body">
        <p data-bind="text: estado"></p>
        <div data-bind="visible: cargado">
            <p><strong>Centro:</strong> <span data-bind="text: centro"></span></p>
            <p><strong>Carrera:</strong> <span data-bind="text: carrera"></span></p>
            <p><strong>Total de matrícula:</strong> <span data-bind="text: total"></span></p>
            <p>Registra la cantidad de estudiantes por etnia. La suma debe coincidir con el total de matrícula.</p>
            <form data-bind="submit: guardar">
                <div class="row" data-bind="foreach: etnias">
                    <div class="col-md-4 mb-3">
                        <label class="form-label" data-bind="text: nombre, attr: {for: 'etnia-' + id}"></label>
                        <input class="form-control" type="number" min="0" step="1"
                               data-bind="value: cantidad, attr: {id: 'etnia-' + id}">
                    </div>
                </div>
                <p><strong>Suma por etnia:</strong> <span data-bind="text: suma"></span></p>
                <button class="btn btn-primary" type="submit">Guardar distribución</button>
            </form>
        </div>
    </div>
</div>
