<?php
class conexion
{
    static $dbhost = "127.0.0.1";
    static $dbuser = "juan";
    static $dbpass = "12345678";
    static $dbname = "inventarioTmp";

    public static function getConnection()
    {
        $conn = new mysqli(conexion::$dbhost, conexion::$dbuser, conexion::$dbpass, conexion::$dbname);
        $conn->query("SET NAMES 'utf8'");
        if ($conn->connect_error) {
            die('no se pudo conectar a la base de dato' . $conn->connect_error);
        } else {
            return $conn;
        }
    }

    public function protect($v)
    {
        
        $conn = new mysqli(conexion::$dbhost, conexion::$dbuser, conexion::$dbpass, conexion::$dbname);
        $v    = mysqli_real_escape_string($conn, $v);
        $v    = htmlentities($v, ENT_QUOTES);
        $V    = trim($v);
        return $v;
    }
}