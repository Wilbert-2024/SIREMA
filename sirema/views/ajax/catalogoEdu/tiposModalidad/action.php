<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/tiposModalidadController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$tiposCNU = new tiposModalidadController();

switch ($data["type"])
{
    case "insert":
        $result = $tiposCNU->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $tiposCNU->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $tiposCNU->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $tiposCNU->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $tiposCNU->update($data["data"]);
        echo json_encode($result);
        break;
}

