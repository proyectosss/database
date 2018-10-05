<?php
class conexion
{
    public static function getConnection()
    {
        $conn = new mysqli('localhost', 'root', '', 'db_follow');
        $conn->query("SET NAMES 'utf8'");
        if ($conn->connect_error) {
            die('no se pudo conectar a la base de dato' . $conn->connect_error);
        } else {
            return $conn;
        }
    }

    public function protect($v)
    {
        $conn = new mysqli('localhost', 'root', '', 'db_follow');
        $v    = mysqli_real_escape_string($conn, $v);
        $v    = htmlentities($v, ENT_QUOTES);
        $V    = trim($v);
        return $v;
    }
}
