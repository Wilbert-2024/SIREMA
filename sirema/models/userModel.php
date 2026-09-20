<?php

require_once("config.php");
class userModel
{

    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear un nuevo usuario.
     * Invoca a procedimiento usuario_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call usuario_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["usuario"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["centro_id"], PDO::PARAM_STR);
        $stmt->execute();

        $centro =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($centro["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call usuario_crear(?,?,?)");
            $stmt->bindParam(1, $data["usuario"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["centro_id"], PDO::PARAM_STR);
            $stmt->bindParam(3, $data["clave"], PDO::PARAM_STR);
            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de Usuarios.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call usuario_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de usuario
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call usuario_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $usuario =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($usuario["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call usuario_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call usuario_encontrar(?)");
        $stmt->bindParam(1, $id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
     * Actualizar el registro de un usuario
     * */
    public function update($data)
    {
        $stmt = $this->db->conectar()->prepare("call usuario_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["usuario"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["centro_id"], PDO::PARAM_INT);
        $stmt->execute();

        $tipo =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($tipo["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call usuario_actualizar(?,?,?)");
            $stmt->bindParam(1,$data["id"], PDO::PARAM_INT);
            $stmt->bindParam(2, $data["usuario"], PDO::PARAM_STR);
            $stmt->bindParam(3, $data["centro_id"], PDO::PARAM_INT);

            if($stmt->execute())
            {
                return "ok";
            }

            return "error";
        }

        return "duplicado";
    }

    /*
    * Actualizar la contraseña de un usuario
    * */
    public function updatePassWord($data)
    {
        $stmt = $this->db->conectar()->prepare("call usuario_actualizar_clave(?,?)");
        $stmt->bindParam(1,$data["id"], PDO::PARAM_INT);
        $stmt->bindParam(2, $data["clave_nueva"], PDO::PARAM_STR);

        if($stmt->execute())
        {
            return "ok";
        }

        return "error";
    }

    public function userLogin($data)
    {
        $stmt = $this->db->conectar()->prepare("call usuario_login(?)");
        $stmt->bindParam(1, $data['email'], PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function validarFuncionesUsuario($data)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_validarFuncionesUsuario(?)");
        $stmt->bindParam(1, $data['email'], PDO::PARAM_STR);
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