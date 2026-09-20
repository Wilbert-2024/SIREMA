<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/urlController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$urlController = new urlController();


if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'insert':
           $insert = $urlController->insert($data['data']);

            echo json_encode($insert);
            break;

        case 'update':
            $update = $urlController->update($data['data']);

            echo json_encode($update);
            break;

        case "find":
            $result = $urlController->find($data["id"]);
            echo json_encode($result);
            break;

        case "changeState":
            $result = $urlController->change_state($data["Id"]);

            echo json_encode($result);
            break;
    }
}