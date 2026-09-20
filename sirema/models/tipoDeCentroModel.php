<?php
require_once("config.php");
class tipoDeCentroModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear un nuevo tipo de centro.
     * Invoca a procedimiento tipo_centro_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call tipo_centro_validar_duplicado(?)");
        $stmt->bindParam(1, $data["tipo_centro"], PDO::PARAM_STR);
        $stmt->execute();

        $tipo =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($tipo["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call tipo_centro_crear(?)");
            $stmt->bindParam(1, $data["tipo_centro"], PDO::PARAM_STR);

            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de Tipo de Centro.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call tipo_centro_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de tipo de centro
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call tipo_centro_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $tipo_centro =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($tipo_centro["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


       $stmt = null;
        $stmt = $this->db->conectar()->prepare("call tipo_centro_cambiar_estado(?,?)");
        $stmt->bindParam(1, $new_state,PDO::PARAM_BOOL);
        $stmt->bindParam(2, $Id, PDO::PARAM_INT);

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
        $stmt = $this->db->conectar()->prepare("call tipo_centro_encontrar(?)");
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
     * Verificar si no existe un registro
     * con el mismo nombre
     * */
    public function update($data)
    {
        $stmt = $this->db->conectar()->prepare("call tipo_centro_validar_duplicado(?)");
        $stmt->bindParam(1, $data["tipo_centro_nuevo"], PDO::PARAM_STR);
        $stmt->execute();

        $tipo =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($tipo["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call tipo_centro_actualizar(?,?)");
            $stmt->bindParam(1, $data["tipo_centro_nuevo"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["id"], PDO::PARAM_STR);

            if($stmt->execute())
            {
                return "ok";
            }

            return "error";
        }

        return "duplicado";
    }
    /*
    * Destrulle la instancia del Modelo
    * */
    function __destruct()
    {
        $this->db = null;
    }
}