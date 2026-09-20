<?php

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




    