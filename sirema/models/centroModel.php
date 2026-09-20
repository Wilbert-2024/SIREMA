<?php
require_once("config.php");
class centroModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear un nuevo centro.
     * Invoca a procedimiento centro_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call centro_validar_duplicado(?,?,?)");
        $stmt->bindParam(1, $data["descripcion_centro"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["tipo_centro_id"], PDO::PARAM_INT);
        $stmt->bindParam(3, $data["comunidad_id"], PDO::PARAM_INT);
        $stmt->execute();

        $comunidad =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($comunidad["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call centro_crear(?,?,?,?)");
            $stmt->bindParam(1, $data["descripcion_centro"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["tipo_centro_id"], PDO::PARAM_INT);
            $stmt->bindParam(3, $data["comunidad_id"], PDO::PARAM_INT);
            $stmt->bindParam(4, $data["padre_id"], PDO::PARAM_INT);
            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }

    /*
    * Actualizar nuevo centro.
    * Invoca a procedimiento centro_actualizar
    * */
    public function update($data)
    {
        $stmt = $this->db->conectar()->prepare("call centro_validar_duplicado(?,?,?)");
        $stmt->bindParam(1, $data["descripcion_centro"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["tipo_centro_id"], PDO::PARAM_INT);
        $stmt->bindParam(3, $data["comunidad_id"], PDO::PARAM_INT);
        $stmt->execute();

        $comunidad =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($comunidad["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call centro_actualizar(?,?,?,?,?)");
            $stmt->bindParam(1, $data["id"], PDO::PARAM_INT);
            $stmt->bindParam(2, $data["descripcion_centro"], PDO::PARAM_STR);
            $stmt->bindParam(3, $data["tipo_centro_id"], PDO::PARAM_INT);
            $stmt->bindParam(4, $data["comunidad_id"], PDO::PARAM_INT);
            $stmt->bindParam(5, $data["padre_id"], PDO::PARAM_INT);
            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }

    /*
    * Returna los registros existentes de Centros.
    * Para mostrar en Index
    * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call centro_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
     * Funcion para cambiar el estado de un registro
     * de centro
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call centro_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $centro =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($centro["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call centro_cambiar_estado(?,?)");
        $stmt->bindParam(1, $new_state,PDO::PARAM_BOOL);
        $stmt->bindParam(2, $Id, PDO::PARAM_INT);

        if($stmt->execute())
        {
            return "ok";
        }
        return "error";
    }

    /*
     * Conseguir los centros Padres.
     * Devuelve el Id y la descripcion del centro
     * */
    public function getCentrosPadres()
    {
        $stmt = $this->db->conectar()->prepare("call centro_get_padres()");
        $stmt->execute();

        $padres = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $padres;
    }

    /*
   * Funcion para returnar un registro de
    * centro
   * */
    public function get_centro($Id)
    {
        $stmt = $this->db->conectar()->prepare("call centro_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}