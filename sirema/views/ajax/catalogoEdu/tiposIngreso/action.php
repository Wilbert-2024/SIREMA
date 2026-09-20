<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/tipoIngresoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$tipo = new tipoIngresoController();

switch ($data["type"])
{
    case "insert":
        $result = $tipo->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $tipo->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $tipo->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $tipo->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $tipo->update($data["data"]);
        echo json_encode($result);
        break;
}
