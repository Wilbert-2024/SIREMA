<?php
require_once("config.php");
class funcionModel
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
     * para crear una nueva funcion
     * */
    public function Insert($data)
    {

        $stmt = $this->db->conectar()->prepare("call funcion_crear(?,?,?)");
        $stmt->bindParam(1, $data['controlador'], PDO::PARAM_STR);
        $stmt->bindParam(2, $data['accion'], PDO::PARAM_STR);
        $stmt->bindParam(3, $data['acronimo'], PDO::PARAM_STR);

        if($stmt->execute())
        {
            return "ok";
        }
        return "error";
    }

    /*
     * actualizar un  menu.
     * Recive como parametro los datos necesarios
     * para actualizar una funcion
     * */
    public function update($data)
    {

        $stmt = $this->db->conectar()->prepare("call funcion_actualizar(?,?,?,?)");
        $stmt->bindParam(1, $data['id'], PDO::PARAM_INT);
        $stmt->bindParam(2, $data['controlador'], PDO::PARAM_STR);
        $stmt->bindParam(3, $data['accion'], PDO::PARAM_STR);
        $stmt->bindParam(4, $data['acronimo'], PDO::PARAM_STR);
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
        $stmt = $this->db->conectar()->prepare("call funcion_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
     * Funcion para cambiar el estado de un registro
     * de menu
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call funcion_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $funcion =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($funcion["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call funcion_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call funcion_encontrar(?)");
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
  * Destrulle la instancia del Modelo
  * */
    function __destruct()
    {
        $this->db = null;
    }
}