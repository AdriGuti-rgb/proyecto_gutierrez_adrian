<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $sql = "SELECT * FROM races";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);

            header("HTTP/1.1 200 OK");            
            echo json_encode($races);

        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>