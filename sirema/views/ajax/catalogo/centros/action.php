<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/centroController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);

$centro = new centroController();

switch ($data["type"])
{
    case "insert":
        $result = $centro->insert($data["data"]);
        echo json_encode($result);
        break;

    case "update":
        $result = $centro->update($data["data"]);
        echo json_encode($result);
        break;

    case "getTable":
       $result = $centro->index();

       echo json_encode($result);
        break;

    case "getComunidades":
        $result = $centro->renderSelectComunidades();

        echo json_encode($result);
        break;

    case "getTipoCentros":
        $result = $centro->renderSelectTipoCentros();

        echo json_encode($result);
        break;

    case "getCentrosPadre":
        $result = $centro->renderSelectCentrosPadres();

        echo json_encode($result);
        break;

    case "getCentro":
        $result = $centro->get_centro($data["id"]);

        echo json_encode($result);
        break;
    case "changeState":
       $result = $centro->change_state($data["Id"]);

        echo json_encode($result);
        break;
    case "find":
       // $result = $centro->find($data["Id"]);
      //  echo json_encode($result);
        break;
}

