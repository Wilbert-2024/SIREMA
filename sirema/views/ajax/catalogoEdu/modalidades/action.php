<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/modalidadController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$modalidad = new modalidadController();

switch ($data["type"])
{
    case "insert":
        $result = $modalidad->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $modalidad->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $modalidad->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $modalidad->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $modalidad->update($data["data"]);
        echo json_encode($result);
        break;
}
