<?php

    require_once "./conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $sql = "SELECT * FROM users";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);
            
            header("HTTP/1.1 200 OK");
            echo json_encode($users);
            
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>