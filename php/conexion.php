<?php
    class Conexion extends mysqli {
        private $host = "localhost";
        private $db = "proyecto_integrador";
        private $user = "root";
        private $pass = "";

        public function __construct() {
            try {
                parent::__construct($this->host, $this->user, $this->pass, $this->db);
            } catch (mysqli_sql_exception $e) {
                echo "Error: {$e->getMessage()}";  //ESTO SE HACE PARA VER ERRORES
                //header("HTTP/1.1 400 Nad Request");    //USAR SIEMPRE ESTO CUANDO ESTE FINALIZADO0
                exit;
            }
        }
    }

?>