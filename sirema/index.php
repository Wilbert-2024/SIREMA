<?php

// El PDF debe enviarse antes de que la plantilla escriba cualquier HTML.
if (isset($_GET['action']) && $_GET['action'] === 'reporte_informes_reporteDistribucionEtnica') {
    require __DIR__ . '/views/modules/reporte/informes/reporteDistribucionEtnica.php';
    exit;
}

//require_once "models/loginModel.php";
$isNotReport = true;
if(isset($_GET['action']))
{
    $rep = explode('_', $_GET['action']);
    if($rep[0] == 'reporte')
        $isNotReport = false;
}


    require_once "controllers/urlController.php";
    require_once "models/funcionUsuarioModel.php";
//require_once "controllers/loginController.php";
    require_once "controllers/templateController.php";


    $template = new TemplateController();
    $template -> templateBackend();




    
