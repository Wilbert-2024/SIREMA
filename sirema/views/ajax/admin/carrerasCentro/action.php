<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/carreraCentroController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$carreraCentroController = new carreraCentroController();


if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'getCentros':
            $insert = $carreraCentroController->getCentros();

            echo json_encode($insert);
            break;
        case 'noPertenecientes':
            $carrerasNoPer = $carreraCentroController->getCarrerasNoPertenecientes($data['Id']);

            echo json_encode($carrerasNoPer);
            break;

        case 'pertenecientes':
            $carrerasPer = $carreraCentroController->getCarrerasPertenecientes($data['Id']);

            echo json_encode($carrerasPer);
            break;
        case 'actualizarCarreras':
            $carrerasH = $carreraCentroController->habilitarCarreraCentro($data['cc']);

            echo json_encode($carrerasH);
            break;
    }
}