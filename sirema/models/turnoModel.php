<?php
require_once("config.php");
class turnoModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
 * Crear un nuevo turno.
 * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call turno_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["turno"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["modalidad_id"], PDO::PARAM_INT);
        $stmt->execute();

        $carrera =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($carrera["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call turno_crear(?,?)");
            $stmt->bindParam(1, $data["turno"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["modalidad_id"], PDO::PARAM_INT);

            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de turnos.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call turno_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de comunidad
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call turno_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $carrera =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($carrera["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call turno_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call turno_encontrar(?)");
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
        $stmt = $this->db->conectar()->prepare("call turno_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["turno_nuevo"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["modalidad_id_nuevo"], PDO::PARAM_INT);
        $stmt->execute();

        $tipo =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($tipo["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call turno_actualizar(?,?,?)");
            $stmt->bindParam(1, $data["id"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["turno_nuevo"], PDO::PARAM_STR);
            $stmt->bindParam(3, $data["modalidad_id_nuevo"], PDO::PARAM_INT);


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