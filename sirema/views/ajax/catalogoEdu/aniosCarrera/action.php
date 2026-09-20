<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/anioCarreraController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$anioCarrera = new anioCarreraController();

switch ($data["type"])
{
    case "insert":
        $result = $anioCarrera->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $anioCarrera->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $anioCarrera->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $anioCarrera->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $anioCarrera->update($data["data"]);
        echo json_encode($result);
        break;
}

