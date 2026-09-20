<?php
require_once("config.php");
class buscadorModel
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
 * Retorna las carreras npertenecientes a un centro
 * */
    public function filtroCentro($destripcion)
    {
        $stmt = $this->db->conectar()->prepare("call buscar_filtro_centro(?,?)");
        $stmt->bindParam(1, $destripcion, PDO::PARAM_STR);
        $stmt->bindParam(2, $_SESSION['usuario'], PDO::PARAM_STR);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /*
 * Destrulle la instancia del Modelo
 * */
    function __destruct()
    {
        $this->db = null;
    }
}