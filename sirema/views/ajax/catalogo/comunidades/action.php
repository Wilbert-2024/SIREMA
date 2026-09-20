<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/comunidadController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$comunidad = new comunidadController();

switch ($data["type"])
{
    case "insert":
        $result = $comunidad->insert($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
        $result = $comunidad->index();

        echo json_encode($result);
        break;

    case "getMunicipios":
        $result = $comunidad->renderSelectMunicipios();

        echo json_encode($result);
        break;

    case "changeState":
        $result = $comunidad->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
        $result = $comunidad->find($data["Id"]);
        echo json_encode($result);
        break;
    case "update":
        $result = $comunidad->update($data["data"]);
        echo json_encode($result);
        break;
}
