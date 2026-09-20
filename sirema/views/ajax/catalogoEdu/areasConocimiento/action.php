<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/areaConocimientoController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$areaCon = new areaConocimientoController();

switch ($data["type"])
{
    case "insert":
        $result = $areaCon->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $areaCon->index();

        echo json_encode($result);
        break;

    case "changeState":
       $result = $areaCon->change_state($data["Id"]);

       echo json_encode($result);
        break;
    case "find":
       $result = $areaCon->find($data["Id"]);
       echo json_encode($result);
        break;
    case "update":
        $result = $areaCon->update($data["data"]);
        echo json_encode($result);
        break;
}