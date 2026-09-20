<?php
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/urlModel.php";
require_once $_SERVER["DOCUMENT_ROOT"]."/sirema/models/funcionUsuarioModel.php";
class urlController
{
    protected $model;
    protected $modelFuncionUsuario;
    function __construct()
    {
        $this->model = new urlModel();
        $this->modelFuncionUsuario = new funcionUsuarioModel();
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        
    // Se anexo
    if (!isset($_GET['action'])) {

        $ruta = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

        $ruta = str_replace('/sirema/', '', $ruta);
        $ruta = trim($ruta, '/');

        if ($ruta != '' && $ruta != 'index.php') {
            $_GET['action'] = $ruta;
        }
    }





    }
    /*
     * Envia registro de enlace para
     * que sea almacenado
     * */
    public function insert($data)
    {
       return $this->model->Insert($data);

    }


    /*
     * Devuelve formato de cuerpo de tabla HMTL
     * con los registros de Enlaces.
     * */
    public function index()
    {
        $enlaces = $this->model->Index();
        $tbody = "";
        foreach($enlaces as $enlace)
        {
            $icon = 'fas fa-eye fa-1x';
            $color = 'btn-success';
            $title = 'VISIBLE';

            if(!$enlace['Estado'])
            {
                $icon= 'fas fa-eye-slash fa-1x';
                $color = 'btn-secondary';
                $title = 'OCULTO';
            }

            $estado = "InActivo";
            if($enlace['Estado'] == 1)
            {
                $estado = "Activo";
            }
            $tbody .= '<tr>';
            $tbody .= '<td>'.$enlace['TextoMostrar'].'</td>';
            $tbody .= '<td>'.$enlace['Modulo'].'</td>';
            $tbody .= '<td>'.$enlace['Padre'].'</td>';
            $tbody .= '<td>'.$enlace['IconoModulo'].'</td>';
            $tbody .= '<td>'.$enlace['Accion'].'</td>';
            $tbody .= '<td>'.$enlace['IconoAccion'].'</td>';
            $tbody .= '<td>'.$estado.'</td>';
            /*Table data para botones*/
            $tbody .= "<td>";
            $tbody .= "<a class='btn btn-icon btn-round ".$color."' style='margin-right: 10px;' onclick='deleteRegistry(".$enlace["Id"].")' title='".$title."'><i class='".$icon."'></i></button>";
            $tbody .$icon.= "<a class='btn btn-icon btn-round btn-info' href='admin_urls_update?id=".$enlace['Id']."'><i class='fas fa-redo fa-1x'></i></button>";
            $tbody .= "</td>";
            /*Fin de botones*/
            $tbody .= '</tr>';
        }

        return $tbody;
    }
    /*
   * Envia el id del registro
   * que se estado sera actualizado
   * */
    public function change_state($Id)
    {
        $estado = $this->modelFuncionUsuario->validarPermiso('ENLCHS');
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

    public function update($data)
    {
        $result = $this->model->update($data);

        return $result;
    }

    /*
     * Funcion para formar los enlaces del menu.
     * Side Bar menu formater
     * */
    public function formSideBarMenu()
    {
        if(isset($_SESSION['valido']))
        {
            $padres = $this->model->getEnlacesPadres();
            $hijos = $this->model->getEnlacesHijos();

            $enlace = "";
            foreach($padres as $padre)
            {
                $p = '<a data-bs-toggle="collapse" href="#'.$padre['Id'].'">
                  <i class="'.$padre['IconoModulo'].'"></i>
                  <p>'.$padre['TextoMostrar'].'</p>
                  <span class="caret"></span>
                </a>
                <div class="collapse" id="'.$padre['Id'].'">
                  <ul class="nav nav-collapse">';

                foreach ($hijos as $hijo)
                {
                    if($hijo['PadreId'] == $padre['Id'])
                    {
                        if($hijo['Modulo'] == 'modal')
                        {
                            $li = '<li>
                              <a href="#" data-bs-toggle="modal" data-bs-target="#'.$hijo['Accion'].'">
                                <span class="sub-item">'.$hijo['TextoMostrar'].'</span>
                              </a>
                            </li>';
                        }
                        else
                        { 
                            /// se cambio
                            $li = '<li>
                            
                              <a href="index.php?action='.$hijo['Modulo'].'_'.$hijo['Accion'].'">   
                                <span class="sub-item">'.$hijo['TextoMostrar'].'</span>
                              </a>
                            </li>';
                        }


                        $p .= $li;
                    }

                }
                $p .=' </ul>
                </div>';

                $enlace .= $p;
            }

            echo $enlace;
        }

    }

    /*
     * Returna enlaces padres
     * para los combobox
     * */
    public function getEnlacesPadres()
    {
        $padres = $this->model->getEnlacesPadres();
        $options = '<option value="0">Es_Padre</option>';
        foreach ($padres as $padre)
        {
            $options .= '<option value="'.$padre['Id'].'">'.$padre["TextoMostrar"].'</option>';
        }
        echo $options;
    }
    /*
     * Retorna pagina para ser renderizado
     * */
    public function displayPage()
    {
	    if (session_status() != PHP_SESSION_NONE) {
			if(!isset($_SESSION['funciones_validos']) || !isset($_SESSION['valido'])){
				include_once "views/modules/iniciarSession.php";
			}
			else{
				if($_SESSION['funciones_validos'] == false && $_SESSION['valido'] == true)
				{
					include_once "views/modules/error/403.php";
				}
				else{
					if(isset($_SESSION['valido'])) {
						if (isset($_GET['action'])) {
							
							$enlaces = $_GET["action"];
							
							if($enlaces == 'iniciarSession')
							{
								include_once "views/modules/index.php";
							}
							else{
								$respuesta = $this->model->returnValidPage($enlaces);
								
								include_once $respuesta;
							}
							
						} else {
							include_once "views/modules/index.php";
						}
					}
					else{
						include_once "views/modules/iniciarSession.php";
					}
				}
			}
		   
	    }
	    else{
		    include_once "views/modules/iniciarSession.php";
	    }
    }

    /*
     * Retorna JS para ser renderizado
     * */
    public function renderJS()
    {
	    if (session_status() === PHP_SESSION_NONE) {
		    return 'assets/pages/js/login/login.js';
	    }
	    if($_SESSION['funciones_validos'] == false && $_SESSION['valido'] == true)
	    {
		    return '';
	    }
	    if(isset($_SESSION['valido'])) {
		    if (isset($_GET['action'])) {
			    $enlaces = $_GET['action'];
			    
			    $enlaces = $_GET["action"];
			    
			    if($enlaces == 'iniciarSession')
			    {
				    include_once "assets/pages/js/index.js";
			    }
			    
			    else{
				    $respuesta = $this->model->returnValidJSFile($enlaces);
				    
				    return $respuesta;
			    }
			    
		    }
		    return 'assets/pages/js/index.js';
	    }
	    return 'assets/pages/js/login/login.js';
    }

    /*
    * Destrulle la instancia del controlador
    * */
    function __destruct()
    {
        $this->model = null;
    }
}
