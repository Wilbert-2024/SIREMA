<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/etniaController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$etnia = new etniaController();

switch ($data["type"])
{
    case "insert":
        $result = $etnia->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $etnia->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $etnia->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $etnia->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $etnia->update($data["data"]);
        echo json_encode($result);
        break;
}
