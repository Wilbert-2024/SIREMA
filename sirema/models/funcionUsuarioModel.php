<?php
require_once("config.php");
class funcionUsuarioModel
{
    protected $db;

    function __construct()
    {
        $this->db = new DB();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }
    public function validarPermiso($acronimo)
    {
        $stmt = $this->db->conectar()->prepare("call permiso_funcion_usuario(?,?)");
        $stmt->bindParam(1, $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->bindParam(2, $acronimo, PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /*
     * Returna los registros existentes de Etnias.
     * Para mostrar en Index
     * */
    public function getUsuariosActivos()
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getUsuariosActivos()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
   * Retorna los registros no pertenecientes al usuario
   * */
    public function centrosNoPertenecientesAlUsuario($data)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getCentrosNoPertenecienesAUsuario(?)");
        $stmt->bindParam(1, $data['Id'], PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
  * Retorna los registros pertenecientes al usuario
  * */
    public function centrosPertenecientesAlUsuario($data)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getCentrosPertenecientesAUsuario(?)");
        $stmt->bindParam(1, $data['Id'], PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
* Retorna los registros no pertenecientes al usuario
* */
    public function funcionesNoPertenecientesAlUsuario($data)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getFuncionNoPertenecientesAlUsuario(?)");
        $stmt->bindParam(1, $data['Id'], PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
  * Retorna los registros pertenecientes al usuario
  * */
    public function funcionesPertenecientesAlUsuario($data)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getFuncionesPertenecientesAlUsuario(?)");
        $stmt->bindParam(1, $data['Id'], PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
     * Eliminar o actualizar uno o mas registros de centros asignado a un usuario
     * */
    public function eliminarAgregarCentrosParaUsuario($data)
    {
        //Conseguir lista de carreras por el centro
        $stmt = $this->db->conectar()->prepare("call filtro_getCentrosUsuarioPorUsuario(?)");
        $stmt->bindParam(1, $data[0]['UsuarioId'], PDO::PARAM_INT);
        $stmt->execute();

        $centrosUsuariosDB = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt->closeCursor();

        $registrosCentrosUsuarioEliminados = [];
        $index = 0;
        $noDentro = false;

        /*
         * Filtrar la lista de centros asignados a un usuario de la base de datos
         * contra la lista de cenentros usuarios enviada por el usuario.
         * Los que no se encuetran en la lista del usuario se ingresaran dentro del
         * arreglo de $registrosCentrosUsuarioEliminados
         * */
        foreach ($centrosUsuariosDB as $cudb)
        {
            if($data[0]['RegistroId'] != 0)
            {
                foreach ($data as $ucu)
                {
                    if(intval($ucu['RegistroId']) == intval($cudb['Centro_Id']) && intval($ucu['UsuarioId']) == intval($cudb['Usuarios_Id']))
                    {
                        $noDentro = false;
                        break;
                    }
                    else
                    {
                        $noDentro = true;
                    }

                }
            }
            else
                $noDentro = true;

            if($noDentro)
            {
                $re['Id'] =$cudb['Id'];
                $registrosCentrosUsuarioEliminados[$index] = $re;
                $index++;
            }
        }

        /*
        * Proceso para eliminar un o mas registros de usuario centros
        * */
        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call filtro_eliminarCentrosUsuario(:Id)");
        foreach ($registrosCentrosUsuarioEliminados as $ucdb)
        {
            $stmt->execute($ucdb);
            $stmt->closeCursor();
        }

        $stmt = null;
        //Insertar nuevo registros
        $stmt = $this->db->conectar()->prepare("call filtro_agregarCentrosUsuario(:RegistroId,:UsuarioId)");
        /*
         * Insertar un nuevo registro
         * */
        foreach ($data as $cc)
        {
            $stmt->execute($cc);
            $stmt->closeCursor();
        }

        return 'ok';
    }

    /*
     * Eliminar o actualizar uno o mas registros de funciones asignado a un usuario
     * */
    public function eliminarAgregarFuncionesUsuario($data)
    {
        //Conseguir lista de carreras por el centro
        $stmt = $this->db->conectar()->prepare("call filtro_getFucionesPorUsuario(?)");
        $stmt->bindParam(1, $data[0]['UsuarioId'], PDO::PARAM_INT);
        $stmt->execute();

        $funcionesUsDB = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt->closeCursor();

        $registrosFuncionesUsuarioEliminados = [];
        $index = 0;
        $noDentro = false;

        /*
         * Filtrar la lista de centros asignados a un usuario de la base de datos
         * contra la lista de cenentros usuarios enviada por el usuario.
         * Los que no se encuetran en la lista del usuario se ingresaran dentro del
         * arreglo de $registrosCentrosUsuarioEliminados
         * */
        foreach ($funcionesUsDB as $fudb)
        {
            if($data[0]['RegistroId'] != 0)
            {
                foreach ($data as $ucu)
                {
                    if(intval($ucu['RegistroId']) == intval($fudb['Funciones_Id']) && intval($ucu['UsuarioId']) == intval($fudb['Usuarios_Id']))
                    {
                        $noDentro = false;
                        break;
                    }
                    else
                    {
                        $noDentro = true;
                    }

                }
            }
            else
                $noDentro = true;
            if($noDentro)
            {
                $re['Id'] =$fudb['Id'];
                $registrosFuncionesUsuarioEliminados[$index] = $re;
                $index++;
            }
        }

        /*
        * Proceso para eliminar un o mas registros de usuario centros
        */
        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call filtro_eliminarFuncionUsuario(:Id)");
        foreach ($registrosFuncionesUsuarioEliminados as $ucdb)
        {
            $stmt->execute($ucdb);
            $stmt->closeCursor();
        }

        $stmt = null;
        //Insertar nuevo registros
        $stmt = $this->db->conectar()->prepare("call filtro_agregarFuncionUsuario(:RegistroId,:UsuarioId, :Fecha1, :Fecha2)");
        /*
         * Insertar un nuevo registro
         * */
        foreach ($data as $cc)
        {
            $stmt->execute($cc);
            $stmt->closeCursor();
        }

        return 'ok';
    }
    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->db = null;
    }
}