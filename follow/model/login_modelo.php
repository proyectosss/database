<?php
class login_modelo
{
    private $DB;
    private $user;

    public function __construct()
    {
        $this->DB   = conexion::getConnection();
        $this->user = array();
    }

    public function login($ema, $pas)
    {
        $query = $this->DB->query("CALL sp_usuario_login('" . $ema . "')");
        $fila  = $query->fetch_object();
        $array = json_decode(json_encode($fila), true);
        if (!empty($array)) {
            if (desencriptar($array["password_usuario"]) == $pas) {
                $user[] = 7;
                $user[] = $array["email_usuario"];
                $user[] = $array["nombre"] . " " . $array["apellido"];
                $user[] = $array["documento"];
                $user[] = $array["rol"];
            } else {
                $user[] = 8; //Usuario valido, contraseña incorrecta
                $user[] = "";
            }
        } else {
            $user[] = 9; //Usuario no existe
            $user[] = "";
        }
        return $user;
    }
}
