<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/matriculadoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$matriculado = new matriculadoController();

switch ($data["type"])
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


}
