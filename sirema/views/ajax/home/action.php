<?php

require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/comunidadController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);
if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'lat_lon':
            $com = new comunidadController();
            $centros = $com->getComunidadesLatLon();

            echo json_encode($centros);
            break;

    }
}


