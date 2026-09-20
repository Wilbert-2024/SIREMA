<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/userController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$user = new userController();

switch ($data["type"])
{
    case "login":
        $result = $user->userLogin($data["data"]);
        echo json_encode($result);
        break;

    case "cerrar":
        session_destroy();
        echo json_encode('ok');
        break;

}

