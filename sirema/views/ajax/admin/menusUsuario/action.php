<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/controllers/menuUsuarioController.php";

$js_result = file_get_contents("php://input");
$data = json_decode($js_result, true);


$menu = new menuUsuarioController();


if(isset($data['type']))
{
    switch ($data['type'])
    {
        case 'getMenu':
            $menus = $menu->getMenu($data['UsuarioId']);

            echo json_encode($menus);
            break;

        case 'actualizarRegistros':
            $menus = $menu->eliminarAgregarMenusParaUsuario($data['menus']);

            echo json_encode($menus);
            break;

    }
}
