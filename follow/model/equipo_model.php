<?php

/**
 * Description of equipo_model
 *
 * @author juan
 */
class equipo_model {
    //put your code here
    private $DB;
    private $equipo;

    public function __construct()
    {
        $this->DB      = conexion::getConnection();
        $this->equipos = array();
    }
    
    public function get()
    {
        $query = $this->DB->query("select * from tblEquipo");
        while($fila = $query->fetch_assoc()){
            $this->equipos[] = $fila;
        }
        return $this->equipos;
    }

}
