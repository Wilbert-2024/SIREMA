<?php
require_once("config.php");
class comunidadModel
{

    protected $db;

    function __construct()
    {
        $this->db = new DB();
    }

    /*
     * Crear un nuevo comunidad.
     * Invoca a procedimiento comunidad_crear
     * */
    public function insert($data)
    {
        $stmt = $this->db->conectar()->prepare("call comunidad_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["comunidad"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["municipio_id"], PDO::PARAM_INT);
        $stmt->execute();

        $comunidad =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($comunidad["count"] < 1) {
            $stmt = null;
            $stmt = $this->db->conectar()->prepare("call comunidad_crear(?,?)");
            $stmt->bindParam(1, $data["comunidad"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["municipio_id"], PDO::PARAM_INT);

            if ($stmt->execute()) {
                return "ok";
            }
            return "error";
        }
        return "duplicado";
    }
    /*
     * Returna los registros existentes de Comunidades.
     * Para mostrar en Index
     * */
    public function index()
    {
        $stmt = $this->db->conectar()->prepare("call comunidad_index()");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
     * Funcion para cambiar el estado de un registro
     * de comunidad
     * */
    public function change_state($Id)
    {
        $stmt = $this->db->conectar()->prepare("call comunidad_encontrar(?)");
        $stmt->bindParam(1, $Id, PDO::PARAM_INT);
        $stmt->execute();

        $comunidad =$stmt->fetch(PDO::FETCH_ASSOC);

        $new_state = false;
        if($comunidad["Estado"] == 1)
        {
            $new_state = false;
        }
        else{
            $new_state = true;
        }


        $stmt = null;
        $stmt = $this->db->conectar()->prepare("call comunidad_cambiar_estado(?,?)");
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
        $stmt = $this->db->conectar()->prepare("call comunidad_encontrar(?)");
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
        $stmt = $this->db->conectar()->prepare("call comunidad_validar_duplicado(?,?)");
        $stmt->bindParam(1, $data["comunidad_nuevo"], PDO::PARAM_STR);
        $stmt->bindParam(2, $data["municipio_id_nuevo"], PDO::PARAM_INT);
        $stmt->execute();

        $tipo =  $stmt->fetch(PDO::FETCH_ASSOC);

        if($tipo["count"] < 1)
        {
            $stmt = null;

            $stmt = $this->db->conectar()->prepare("call comunidad_actualizar(?,?,?)");
            $stmt->bindParam(1, $data["comunidad_nuevo"], PDO::PARAM_STR);
            $stmt->bindParam(2, $data["municipio_id_nuevo"], PDO::PARAM_INT);
            $stmt->bindParam(3, $data["id"], PDO::PARAM_STR);

            if($stmt->execute())
            {
                return "ok";
            }

            return "error";
        }

        return "duplicado";
    }
    public function getComunidadesConLatLon()
    {
        $stmt = $this->db->conectar()->prepare("SELECT com.Id as comId,tipcen.Id as tipId,tipcen.DescripcionTipoCentro as tipo,cen.DescripcionCentro as Centro,com.latitud as lat,com.longitud as lon FROM sirema.comunidad as com inner join sirema.centro as cen on com.Id = cen.Comunidad_Id inner join sirema.tipo_de_centro as tipcen on cen.TipoDeCentro_Id = tipcen.Id where com.latitud != 0 and com.longitud != 0 order by tipcen.Id");
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);

    }

    public function getTotalRegistradosPorComunidad($comunidadId)
    {
        $stmt = $this->db->conectar()->prepare("SELECT sum(reg.Total) as total FROM sirema.carrera_centro as cc inner join registro_matricula as reg on reg.CarreraCentro_Id = cc.Id inner join centro as c on cc.Centro_Id = c.Id where  c.Comunidad_Id = ? and reg.Estado = 1");
        $stmt->bindParam(1, $comunidadId, PDO::PARAM_INT);

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