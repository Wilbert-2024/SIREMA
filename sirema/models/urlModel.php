<?php
require_once("config.php");
class urlModel
{
    protected $db;
    function __construct()
    {
        $this->db = new DB();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    /*
     * Crea un nuevo menu.
     * Recive como parametro los datos necesarios
     * para crear un nuevo menu
     * */
    public function Insert($data)
    {

        $stmt = $this->db->conectar()->prepare("call menu_crear(?,?,?,?,?,?,?)");
        $stmt->bindParam(1, $data['texto_mostrar'], PDO::PARAM_STR);
        $stmt->bindParam(2, $data['modulo'], PDO::PARAM_STR);
        $stmt->bindParam(3, $data['icono_modulo'], PDO::PARAM_STR);
        $stmt->bindParam(4, $data['accion'], PDO::PARAM_STR);
        $stmt->bindParam(5, $data['icono_accion'], PDO::PARAM_STR);
        $stmt->bindParam(6, $data['estado'], PDO::PARAM_BOOL);
        $stmt->bindParam(7, $data['padre'], PDO::PARAM_INT);
        if($stmt->execute())
        {
            return "ok";
        }
        return "error";
    }

    /*
     * actualizar un  menu.
     * Recive como parametro los datos necesarios
     * para actualizar un  menu
     * */
    public function update($data)
    {

        $stmt = $this->db->conectar()->prepare("call menu_actualizar(?,?,?,?,?,?,?)");
        $stmt->bindParam(1, $data['id'], PDO::PARAM_INT);
        $stmt->bindParam(2, $data['texto_mostrar'], PDO::PARAM_STR);
        $stmt->bindParam(3, $data['modulo'], PDO::PARAM_STR);
        $stmt->bindParam(4, $data['icono_modulo'], PDO::PARAM_STR);
        $stmt->bindParam(5, $data['accion'], PDO::PARAM_STR);
        $stmt->bindParam(6, $data['icono_accion'], PDO::PARAM_STR);
        $stmt->bindParam(7, $data['padre'], PDO::PARAM_INT);
        if($stmt->execute())
        {
            return "ok";
        }
        return "error";
    }
    /*
     * Conseguir todos los enlaces de la base de datos
     * */
    public function Index()
    {
        $stmt = $this->db->conectar()->prepare("call menu_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
     * Funcion para cambiar el estado de un registro
     * de menu
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call menu_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $menu =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($menu["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call menu_cambiar_estado(?,?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->bindParam(2, $new_state,PDO::PARAM_BOOL);

        if($stmt->execute())
        {
            return "ok";
        }
        return "error";
    }

    /*
    * Busca un registro por Id
    * y lo retorna
    * */
    public function find($id)
    {
        $stmt = $this->db->conectar()->prepare("call menu_encontrar(?)");
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
    /*
     * Conseguir todos los enlaces Hijos.
     * Retorna los enlaces que solo son hijos
     * */
    public function getEnlacesHijos()
    {
        $stmt = $this->db->conectar()->prepare("call menu_mostrar_hijos_por_usuario(?)");
        $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->execute();;

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
    * Conseguir todos los enlaces Padres.
    * Retorna los enlaces que solo son padres
    * */
    public function getEnlacesPadres()
    {
        $stmt = $this->db->conectar()->prepare("call menu_mostrar_padres_po_usuario(?)");
        $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->execute();;

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    /*
     * Funcion para validar la existencia de una pagina por medio
     * de la url del usuario.
     * Devuelve el archivo para renderisarlo en pantalla.
     * */
    public function returnValidPage($enlaces){
        $pagina = explode("_", $enlaces);
        $url = 'views/modules';
        $file = $_SERVER['DOCUMENT_ROOT'].'/sirema/';
        foreach ($pagina as $u)
        {
            if(isset($u) && $u != '')
            {
                $url .='/'.$u;
            }
        }
        $file = $file.$url.'.php';
        if(file_exists($file))
        {
            return $url.'.php';
        }
        else{
             die("NO EXISTE LA VISTA: " . $file);
        }
    }

    /*
     *Valida si el archivo Js Existe para ser renderizado
     * */
    public function returnValidJSFile($enlace)
    {
        $pagina = explode("_", $enlace);
        $url = 'assets/pages/js';
       $file = $_SERVER['DOCUMENT_ROOT'].'/sirema/';
        foreach ($pagina as $u)
        {
            if(isset($u) && $u != '')
            {
                $url .='/'.$u;
            }
        }
        $file = $file.$url.'.js';
        if(file_exists($file))
        {
            return $url.'.js';
        }
        else{
            return "";
        }
    }

    /*
   * Destrulle la instancia del Modelo
   * */
    function __destruct()
    {
        $this->db = null;
    }
}