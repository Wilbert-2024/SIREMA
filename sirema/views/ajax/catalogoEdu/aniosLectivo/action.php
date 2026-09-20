<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/anioLectivoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$anioLectivo = new anioLectivoController();

switch ($data["type"])
{
    case "insert":
        $result = $anioLectivo->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $anioLectivo->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $anioLectivo->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $anioLectivo->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $anioLectivo->update($data["data"]);
        echo json_encode($result);
        break;
}

