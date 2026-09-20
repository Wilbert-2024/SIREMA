<?php

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/buscadorController.php";
/*
$js_result = file_get_contents("php://input");

$array = explode('&',$js_result);

$data = [
    'type' => '',
    'param' => '',
    'centroId' => 0
];
foreach ($array as $ar)
{
    $array2 = explode('=', $ar);

    if($array2[0] == 'type')
        $data['type'] = $array2[1];

    if($array2[0] == 'param')
        $data['param'] = $array2[1];
}


if(!isset($data['param']))
    $data['param'] = '';*/
$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);
if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'getCentros':
            $buscadorController = new buscadorController();
            $centros = $buscadorController->filtroCentro($data['param']);

            echo json_encode($centros);
            break;

    }
}



