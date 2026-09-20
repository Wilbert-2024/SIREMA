<?php
require_once("config.php");
class tiposModalidadModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear una nueva modalidad cnu.
     * Invoca a procedimiento grupo_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_validar_duplicado(?)");
        $stmt->bindParam(1, $data["modalidadCNU"], PDO::PARAM_STR);
        $stmt->execute();

        $semestre =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($semestre["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call tipo_modalidad_crear(?)");
            $stmt->bindParam(1, $data["modalidadCNU"], PDO::PARAM_STR);

            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de Grupos.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de modalidad
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $semestre =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($semestre["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_encontrar(?)");
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
        $stmt = $this->db->conectar()->prepare("call tipo_modalidad_validar_duplicado(?)");
        $stmt->bindParam(1, $data["modalidadCNU_nuevo"], PDO::PARAM_STR);
        $stmt->execute();

        $semestre =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($semestre["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call tipo_modalidad_actualizar(?,?)");
            $stmt->bindParam(1,$data["id"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["modalidadCNU_nuevo"], PDO::PARAM_STR);

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