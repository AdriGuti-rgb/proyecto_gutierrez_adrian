<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $sql = "SELECT * FROM modalities";
            $resultado = $con->query($sql);
            $modalities = $resultado->fetch_all(MYSQLI_ASSOC);

            echo json_encode($modalities);

            header("HTTP/1.1 200 OK");
            
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>