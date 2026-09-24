<?php
// Las respuestas AJAX deben ser JSON; los detalles técnicos se registran en el servidor.
ini_set('display_errors', '0');
ini_set('log_errors', '1');
error_reporting(E_ALL);
header('Content-Type: application/json; charset=utf-8');

$js_result = file_get_contents('php://input');
$data = json_decode($js_result, true);
if (!is_array($data) || !isset($data['type']) || !is_string($data['type'])) {
    http_response_code(400);
    echo json_encode('solicitudInvalida');
    exit;
}

$camposRequeridos = [
    'getCentros' => 'filtro', 'getCarreras' => 'centroId',
    'getTurnos' => 'modalidadId', 'insert' => 'registro',
    'index' => 'data', 'anular' => 'id',
];
if (isset($camposRequeridos[$data['type']]) &&
    !isset($data[$camposRequeridos[$data['type']]])) {
    http_response_code(400);
    echo json_encode('solicitudInvalida');
    exit;
}

try {
require_once $_SERVER['DOCUMENT_ROOT'] . '/sirema/controllers/matriculadoController.php';
$matriculado = new matriculadoController();

switch ($data['type'])
{
    case "getCentros":
        $result = $matriculado->getCentros($data["filtro"]);
        echo json_encode($result);
        break;

    case "getCarreras":
        $result = $matriculado->getCarreras($data["centroId"]);
        echo json_encode($result);
        break;

    case "getTurnos":
        $result = $matriculado->getTurnos($data["modalidadId"]);
        echo json_encode($result);
        break;

    case "getAniosLectivos":
        $result = $matriculado->getAniosLectivos();
        echo json_encode($result);
        break;

    case "getGrupos":
        $result = $matriculado->getGrupos();
        echo json_encode($result);
        break;

    case "getTipoIngresos":
        $result = $matriculado->getTiposIngreso();
        echo json_encode($result);
        break;

    case "getAniosCarrera":
        $result = $matriculado->getAniosCarrera();
        echo json_encode($result);
        break;

    case "getSemestres":
        $result = $matriculado->getSemestre();
        echo json_encode($result);
        break;

    case "getModalidades":
        $result = $matriculado->getModalidad();
        echo json_encode($result);
        break;

    case "getEtnias":
        echo json_encode($matriculado->getEtnias());
        break;

    case "getDistribucionEtnica":
        echo json_encode($matriculado->getDistribucionEtnica($data['id'] ?? null));
        break;

    case "listarReporteEtnico":
        echo json_encode($matriculado->listarReporteEtnico());
        break;

    case "guardarDistribucionEtnica":
        echo json_encode($matriculado->guardarDistribucionEtnica($data['registro'] ?? null));
        break;

    case "insert":
        $result = $matriculado->insert($data['registro']);
        echo json_encode($result);
        break;

    case "index":
        $result = $matriculado->index($data['data']);
        echo json_encode($result);
        break;

    case "anular":
        $result = $matriculado->anular($data['id']);
        echo json_encode($result);
        break;

    default:
        http_response_code(400);
        echo json_encode('solicitudInvalida');
        break;
}
} catch (Throwable $error) {
    error_log('Error en matrícula (' . $data['type'] . '): ' . $error);
    http_response_code(500);
    echo json_encode('errorServidor');
}
