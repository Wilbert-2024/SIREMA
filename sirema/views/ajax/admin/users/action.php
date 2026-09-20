<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/userController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$usuario = new userController();

switch ($data["type"])
{
    case "insert":
        $result = $usuario->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $usuario->index();

        echo json_encode($result);
        break;

    case "getCentros":
        $result = $usuario->renderSelectCentros();

        echo json_encode($result);
        break;

    case "getPassword":
        $result = $usuario->generateStrongPassword(8,false);

        echo json_encode($result);
        break;

    case "changeState":
        $result = $usuario->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $usuario->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $usuario->update($data["data"]);
        echo json_encode($result);
        break;
    case "claveUpdate":
        $result = $usuario->updatePassWord($data["data"]);
        echo json_encode($result);
        break;
}
