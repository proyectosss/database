<?php
require_once 'model/login_modelo.php';
require_once 'model/log_modelo.php';
class login_controller
{
    private $model_l;
    private $logmodel;
    private $segurity;
    public function __construct()
    {
        $this->segurity = new conexion();
        $this->model_l  = new login_modelo();
        $this->logmodel = new log_modelo();
    }
    public function index()
    {
        $tittle = "follow-login";
        require_once HTML_DIR_PUBLIC . 'login/header.php';
        require_once HTML_DIR_PUBLIC . 'login/login.html';
        require_once HTML_DIR_PUBLIC . 'login/modal.php';
        require_once HTML_DIR_PUBLIC . 'login/footer_login.php';
    }
    public function validacion()
    {
        $usuario  = $this->segurity->protect($_POST['ema']);
        $password = $this->segurity->protect($_POST['pas']);
        if ($usuario != '' && $password != '') {
            $data = $this->model_l->login($usuario, $password);
            if ($data[0] == 7) {
                $_SESSION["ema"]       = $data[1];
                $_SESSION["name"]      = $data[2];
                $_SESSION["documento"] = $data[3];
                $_SESSION["rol"]       = $data[4];
                $this->logmodel->log($_SESSION["documento"], $_SESSION["name"], $_SESSION["ema"], "inicio de sesion", getRealIP(), $_SERVER['SERVER_ADDR'], $_SERVER['REMOTE_ADDR'], date('Y-m-d H:i:s'));
                header('location: index.php?c=summary');
            } elseif ($data[0] == 8) {
                $this->index();
                echo "<script> openModalLogin('password'); </script>";
            } elseif ($data[0] == 9) {
                $this->index();
                echo "<script> openModalLogin('email'); </script>";
            }

        }

    }
}
