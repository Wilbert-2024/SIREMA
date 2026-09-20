<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/semestreController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$semestre = new semestreController();

switch ($data["type"])
{
    case "insert":
        $result = $semestre->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $semestre->index();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $semestre->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $semestre->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $semestre->update($data["data"]);
        echo json_encode($result);
        break;
}
