<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $con->autocommit(false);  

            $sql = "SELECT distinct(poblation) FROM races";
            $resultado = $con->query($sql);
            $cities = $resultado->fetch_all(MYSQLI_ASSOC);

            $con->commit();
            
            echo json_encode($cities);

            header("HTTP/1.1 200 OK");
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }

?>