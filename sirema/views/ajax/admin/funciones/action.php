<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/funcionController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$funcionController = new funcionController();


if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'insert':
            $insert = $funcionController->insert($data['data']);

            echo json_encode($insert);
            break;

        case 'getTable':
            $table = $funcionController->index();

            echo json_encode($table);
            break;

        case 'update':
            $update = $funcionController->update($data['data']);

            echo json_encode($update);
            break;

        case "find":
            $result = $funcionController->find($data["id"]);
            echo json_encode($result);
            break;

        case "changeState":
            $result = $funcionController->change_state($data["Id"]);

            echo json_encode($result);
            break;
    }
}