<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/municipioController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$municipio = new municipioController();

switch ($data["type"])
{
    case "insert":
        $result = $municipio->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $municipio->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $municipio->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $municipio->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $municipio->update($data["data"]);
        echo json_encode($result);
        break;
}