<?php
class summary_controller
{
    private $sesion;
    public function __construct()
    {

    }

    public function index()
    {
        $tittle = "follow-" . $_SESSION["name"];
        $ip     = getRealIP();
        if ($_SESSION["rol"] == '1') {
            require_once HTML_DIR_GERENTE . 'overall/header.php';
            require_once HTML_DIR_GERENTE . 'overall/topnav.html';
            require_once HTML_DIR_GERENTE . 'overall/home.php';
            require_once HTML_DIR_GERENTE . 'overall/modal.php';
            require_once HTML_DIR_GERENTE . 'overall/footer.php';
        } else if ($_SESSION["rol"] == '2'){
            require_once HTML_DIR_ADMIN . 'overall/header.php';
            require_once HTML_DIR_ADMIN . 'overall/topnav.html';
            require_once HTML_DIR_ADMIN . 'overall/home.php';
            require_once HTML_DIR_ADMIN . 'overall/modal.php';
            require_once HTML_DIR_ADMIN . 'overall/footer.php';
        }else if ($_SESSION["rol"] == '3'){
            require_once HTML_DIR_DIRECTOR . 'overall/header.php';
            require_once HTML_DIR_DIRECTOR . 'overall/topnav.html';
            require_once HTML_DIR_DIRECTOR . 'overall/home.php';
            require_once HTML_DIR_DIRECTOR . 'overall/modal.php';
            require_once HTML_DIR_DIRECTOR . 'overall/footer.php';
        }else if ($_SESSION["rol"] == '4'){
            require_once HTML_DIR_VENDEDOR . 'overall/header.php';
            require_once HTML_DIR_VENDEDOR . 'overall/topnav.html';
            require_once HTML_DIR_VENDEDOR . 'overall/home.php';
            require_once HTML_DIR_VENDEDOR . 'overall/modal.php';
            require_once HTML_DIR_VENDEDOR . 'overall/footer.php';
        }

    }
    public function cerrar()
    {
        session_destroy();
        header('location:index.php');
    }

}
