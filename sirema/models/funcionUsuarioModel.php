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
        $conexion = $this->db->conectar();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        try {
            $conexion->beginTransaction();
            $stmt = $conexion->prepare('call filtro_getCentrosUsuarioPorUsuario(?)');
            $stmt->execute([$data[0]['UsuarioId']]);
            $actuales = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            // El valor 0 significa dejar al usuario sin centros; no es un centro real.
            $seleccionados = [];
            foreach ($data as $centro) {
                if ($centro['RegistroId'] > 0) {
                    $seleccionados[(int) $centro['RegistroId']] = $centro;
                }
            }

            $eliminar = $conexion->prepare('call filtro_eliminarCentrosUsuario(:Id)');
            foreach ($actuales as $actual) {
                if (!isset($seleccionados[(int) $actual['Centro_Id']])) {
                    $eliminar->execute(['Id' => $actual['Id']]);
                    $eliminar->closeCursor();
                }
            }

            $agregar = $conexion->prepare('call filtro_agregarCentrosUsuario(:RegistroId,:UsuarioId)');
            foreach ($seleccionados as $centro) {
                $agregar->execute($centro);
                $agregar->closeCursor();
            }
            $conexion->commit();
            return 'ok';
        } catch (Throwable $error) {
            if ($conexion->inTransaction()) $conexion->rollBack();
            error_log('Error al asignar centros al usuario: ' . $error->getMessage());
            return 'errorGuardar';
        }
    }

    /*
     * Eliminar o actualizar uno o mas registros de funciones asignado a un usuario
     * */
    public function eliminarAgregarFuncionesUsuario($data)
    {
        $conexion = $this->db->conectar();
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        try {
            $conexion->beginTransaction();
            $stmt = $conexion->prepare('call filtro_getFucionesPorUsuario(?)');
            $stmt->execute([$data[0]['UsuarioId']]);
            $actuales = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $stmt->closeCursor();

            // El valor 0 indica quitar todas las funciones; nunca se inserta.
            $seleccionadas = [];
            foreach ($data as $funcion) {
                if ($funcion['RegistroId'] > 0) {
                    $seleccionadas[(int) $funcion['RegistroId']] = $funcion;
                }
            }

            $eliminar = $conexion->prepare('call filtro_eliminarFuncionUsuario(:Id)');
            foreach ($actuales as $actual) {
                if (!isset($seleccionadas[(int) $actual['Funciones_Id']])) {
                    $eliminar->execute(['Id' => $actual['Id']]);
                    $eliminar->closeCursor();
                }
            }

            $agregar = $conexion->prepare('call filtro_agregarFuncionUsuario(:RegistroId,:UsuarioId,:Fecha1,:Fecha2)');
            foreach ($seleccionadas as $funcion) {
                $agregar->execute($funcion);
                $agregar->closeCursor();
            }
            $conexion->commit();
            return 'ok';
        } catch (Throwable $error) {
            if ($conexion->inTransaction()) $conexion->rollBack();
            error_log('Error al asignar funciones al usuario: ' . $error->getMessage());
            return 'errorGuardar';
        }
    }
    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->db = null;
    }
}