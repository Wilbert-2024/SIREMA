<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/tipoDeCentroController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$tipo_centro = new tipoDeCentroController();

switch ($data["type"])
{
    case "insert":
        $result = $tipo_centro->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $tipo_centro->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $tipo_centro->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $tipo_centro->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $tipo_centro->update($data["data"]);
        echo json_encode($result);
        break;
}