<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/funcionUsuarioController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$funcionUsuarioController = new funcionUsuarioController();


if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'getUsuarios':
            $usuarios = $funcionUsuarioController->getUsuariosActivos();

            echo json_encode($usuarios);
            break;
        case 'noPertenecientes':
            $registrosNoPer = $funcionUsuarioController->getRegistrosNoPertenecientes($data['data']);

            echo json_encode($registrosNoPer);
            break;

        case 'pertenecientes':
            $registrosPer = $funcionUsuarioController->getRegistrosPertenecientes($data['data']);

            echo json_encode($registrosPer);
            break;
        case 'actualizarRegistros':
            $carrerasH = $funcionUsuarioController->actualizarRegistrosUsuario($data['reg'], $data['fun']);

            echo json_encode($carrerasH);
            break;


    }
}
