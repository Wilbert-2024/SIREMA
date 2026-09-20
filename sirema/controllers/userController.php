<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/userModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/centroModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class userController
{

    protected $model;
    protected  $modelCentro;
    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new userModel();
        $this->modelCentro = new centroModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }
    /*
     * Envia nuevo registro de usuario para ser almacenado
     * */
    public function insert($data)
    {
        $data['clave'] = password_hash($data['clave'], PASSWORD_DEFAULT);
        $usuario = $this->model->insert($data);

        return $usuario;
    }
    /*
     * Devuelve formato de cuerpo de table HTML
     * con los registros de usuario
     * */
    public function index()
    {
        $usuarios = $this->model->index();
        $tbody="";
        $count=1;

        foreach ($usuarios as $usuario)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$usuario['Estado'])
            {
                $icon = 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $tbody .= "<tr>";
            $tbody .= "<td>".$count."</td>";
            $tbody .= "<td>".$usuario["NombreUsuario"]."</td>";
            $tbody .= "<td>".$usuario["Centro"]."</td>";
            $tbody .= "<td>".$usuario["FechaCreacion"]."</td>";
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$usuario["Id"].")' title='".$title."'><i class='".$icon."'></i></a>";
            $tbody .= "<a class='btn btn-icon btn-round btn-secondary' style='margin-right: 10px;' onclick='changePassWord(".$usuario["Id"].")'><i class='fas fa-key fa-1x'></i></a>";
            $tbody .= "<a class='btn btn-icon btn-round btn-info' href='admin_users_update?id=".$usuario['Id']."'><i class='fas fa-redo fa-1x'></i></a>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= "</tr>";
            $count++;
        }

        return $tbody;
    }

    /*
     * Envia el id del registro
     * que se estado sera actualizado
     * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('USCHS');
        if(!$estado['Estado'])
            return 'denegado';


        $result = $this->model->change_state($Id);

        return $result;
    }

    /*
     * Devuelve un registro espefico al
     * usuario
     * */
    public function find($id)
    {
        $result = $this->model->find($id);

        return $result;
    }

    /*
     * Actualizar un registro
     * de usuario, no incluye la contraseña
     * */
    public function update($data)
    {
        $result = $this->model->update($data);

        return $result;
    }

    /*
     * actualizar la contraseña de un
     * usuario
     * */
    public function updatePassWord($data)
    {
        $data['clave_nueva'] = password_hash($data['clave_nueva'], PASSWORD_DEFAULT);
        $result = $this->model->updatePassWord($data);

        return $result;
    }
    /*
     * Render selector de centros
     * */
    public function renderSelectCentros()
    {
        $centros = $this->modelCentro->index();
        $options = "<option value='0'>Seleccion el Centro</option>";

        foreach ($centros as $centro)
        {
            $options .= "<option value='".$centro["Id"]."'>".$centro["DescripcionCentro"]."</option>";
        }

        return $options;
    }

    public function userLogin($data)
    {
        $login = $this->model->userLogin($data);
        $funcionesValidas = $this->model->validarFuncionesUsuario($data);
        if(!isset($login['NombreUsuario']))
        {
            return 'noExiste';
        }

        if(password_verify($data['clave'], $login['Clave']))
        {
            $_SESSION['valido'] = true;
            $_SESSION['usuario'] =  $login['NombreUsuario'];
            $_SESSION['centro'] = $login['centro'];

            if($funcionesValidas['caducado'] < 1)
                $_SESSION['funciones_validos'] = true;
            else
                $_SESSION['funciones_validos'] = false;
	        session_start();
            return 'ok';
        }
       
        //$_SESSION['valido'] = true;

        return 'error';
    }

    // Generates a strong password of N length containing at least one lower case letter,
// one uppercase letter, one digit, and one special character. The remaining characters
// in the password are chosen at random from those four sets.
//
// The available characters in each set are user friendly - there are no ambiguous
// characters such as i, l, 1, o, 0, etc. This, coupled with the $add_dashes option,
// makes it much easier for users to manually type or speak their passwords.
//
// Note: the $add_dashes option will increase the length of the password by
// floor(sqrt(N)) characters.

    public function generateStrongPassword($length = 9, $add_dashes = false, $available_sets = 'luds')
    {
        $sets = array();
        if(strpos($available_sets, 'l') !== false)
            $sets[] = 'abcdefghjkmnpqrstuvwxyz';
        if(strpos($available_sets, 'u') !== false)
            $sets[] = 'ABCDEFGHJKMNPQRSTUVWXYZ';
        if(strpos($available_sets, 'd') !== false)
            $sets[] = '23456789';
        if(strpos($available_sets, 's') !== false)
            $sets[] = '!@#$%&*?';

        $all = '';
        $password = '';
        foreach($sets as $set)
        {
            $password .= $set[array_rand(str_split($set))];
            $all .= $set;
        }

        $all = str_split($all);
        for($i = 0; $i < $length - count($sets); $i++)
            $password .= $all[array_rand($all)];

        $password = str_shuffle($password);

        if(!$add_dashes)
            return $password;

        $dash_len = floor(sqrt($length));
        $dash_str = '';
        while(strlen($password) > $dash_len)
        {
            $dash_str .= substr($password, 0, $dash_len) . '-';
            $password = substr($password, $dash_len);
        }
        $dash_str .= $password;
        return $sets;
    }

    /*
     * Destrulle la instancia del controlador
     * */
    function __destruct()
    {
        $this->model = null;
    }

}