<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/grupoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$grupo = new grupoController();

switch ($data["type"])
{
    case "insert":
        $result = $grupo->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $grupo->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $grupo->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $grupo->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $grupo->update($data["data"]);
        echo json_encode($result);
        break;
}
