<?php

/**
 * Description of tblEquipo_controller
 *
 * @author juan
 */

require_once 'model/equipo_model.php';
class equipo_controller {
    private $sesion;
    public function __construct()
    {
        $this->equipo = new equipo_model();
    }

    public function index()
    {
        $tittle = "follow-" . $_SESSION["name"];
        $data   = $this->equipo->get();
        $ip     = getRealIP();
        if ($_SESSION["rol"] == '1') {
            require_once HTML_DIR_GERENTE . 'equipo/vista.php';
        } else if ($_SESSION["rol"] == '2'){
            require_once HTML_DIR_ADMIN . 'equipo/vista.php';
        }else if ($_SESSION["rol"] == '3'){
            require_once HTML_DIR_DIRECTOR . 'equipo/vista.php';
        }else if ($_SESSION["rol"] == '4'){
            require_once HTML_DIR_VENDEDOR . 'equipo/vista.php';
        }

    }
    public function cerrar()
    {
        session_destroy();
        header('location:index.php');
    }    
}
