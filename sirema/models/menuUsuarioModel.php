<?php
require_once("config.php");
class menuUsuarioModel
{

    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
   * Retorna los menus padres
   * */
    public function menusPadres($UsuarioId)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getMenusPadresPorUsuario(?)");
        $stmt->bindParam(1, $UsuarioId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    /*
  * Retorna los menus Hijos
  * */
    public function menusHijos($UsuarioId, $padreId)
    {
        $stmt = $this->db->conectar()->prepare("call filtro_getMenusHijosPorUsuario(?,?)");
        $stmt->bindParam(1, $UsuarioId, PDO::PARAM_INT);
        $stmt->bindParam(2, $padreId, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

        /*
     * Eliminar o actualizar uno o mas registros de menus por usuario
     * */
    public function eliminarAgregarMenusParaUsuario($data)
    {
        //Conseguir lista de carreras por el centro
        $stmt = $this->db->conectar()->prepare("call filtro_getMenuActualDelUsuario(?)");
        $stmt->bindParam(1, $data[0]['usuarioId'], PDO::PARAM_INT);
        $stmt->execute();

        $menusUsuarioDB = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $stmt->closeCursor();

        $registrosMenusUsuarioEliminados = [];
        $index = 0;
        $noDentro = false;

        /*
         * Filtrar la lista de menus asignados a un usuario de la base de datos
         * contra la lista de menus usuarios enviada por el usuario.
         * Los que no se encuetran en la lista del usuario se ingresaran dentro del
         * arreglo de $registrosMenusUsuarioEliminados
         * */
        foreach ($menusUsuarioDB as $mudb)
        {
            if($data[0]['menuId'] != 0)
            {
                foreach ($data as $muu)
                {
                    if(intval($muu['menuId']) == intval($mudb['Menu_Id']) && intval($muu['usuarioId']) == intval($mudb['Usuarios_Id']))
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
                $re['Id'] =$mudb['Id'];
                $registrosMenusUsuarioEliminados[$index] = $re;
                $index++;
            }
        }

        /*
        * Proceso para eliminar un o mas registros de usuario menus
        * */
        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call filtro_eliminarMenuUsuario(:Id)");
        foreach ($registrosMenusUsuarioEliminados as $ucdb)
        {
            $stmt->execute($ucdb);
            $stmt->closeCursor();
        }

        $stmt = null;
        if($data[0]['menuId'] != 0) {
            //Insertar nuevo registros
            $stmt = $this->db->conectar()->prepare("call filtro_agregarMenuUsuario(:menuId,:usuarioId)");
            /*
             * Insertar un nuevo registro
             * */
            foreach ($data as $cc) {
                $stmt->execute($cc);
                $stmt->closeCursor();
            }
        }

        return $data;
    }
    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->db = null;
    }
}