<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/carreraController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$carrera = new carreraController();

switch ($data["type"])
{
    case "insert":
        $result = $carrera->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $carrera->index();

        echo json_encode($result);
        break;

    case "getAreasCon":
        $result = $carrera->renderSelecAreasDeConocimiento();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $carrera->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $carrera->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $carrera->update($data["data"]);
        echo json_encode($result);
        break;
}