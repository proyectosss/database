<?php
class log_modelo
{
    private $DB;
    private $log;

    public function __construct()
    {
        $this->DB   = conexion::getConnection();
        $this->user = array();
    }

    public function log($documento, $name, $ema, $acion, $getRealIP, $ipscript, $ipusuario, $fecha)
    {
        $query = "CALL sp_log('" . $documento . "', '" . $ema . "', '" . $name . "', '" . $acion . "', '" . $getRealIP . "', '" . $ipscript . "', '" . $ipusuario . "', '" . $fecha . "')";
        mysqli_query($this->DB, $query) or die('error \n' . mysqli_error($this->DB));
    }
}
