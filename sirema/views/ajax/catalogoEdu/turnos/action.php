<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/turnoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$turno = new turnoController();

switch ($data["type"])
{
    case "insert":
        $result = $turno->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $turno->index();

        echo json_encode($result);
        break;

    case "getModalidades":
        $result = $turno->renderSelecModalidades();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $turno->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $turno->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $turno->update($data["data"]);
        echo json_encode($result);
        break;
}
