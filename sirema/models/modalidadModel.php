<?php
require_once("config.php");
class modalidadModel
{

    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear una nueva modalidad.
     * Invoca a procedimiento modalidad_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call modalidad_validar_duplicado(?)");
        $stmt->bindParam(1, $data["modalidad"], PDO::PARAM_STR);
        $stmt->execute();

        $modalidad =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($modalidad["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call modalidad_crear(?)");
            $stmt->bindParam(1, $data["modalidad"], PDO::PARAM_STR);

            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de Modalidades.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call modalidad_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de modalidad
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call modalidad_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $modalidad =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($modalidad["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call modalidad_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call modalidad_encontrar(?)");
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
        $stmt = $this->db->conectar()->prepare("call modalidad_validar_duplicado(?)");
        $stmt->bindParam(1, $data["modalidad_nuevo"], PDO::PARAM_STR);
        $stmt->execute();

        $modalidad =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($modalidad["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call modalidad_actualizar(?,?)");
            $stmt->bindParam(1,$data["id"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["modalidad_nuevo"], PDO::PARAM_STR);

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