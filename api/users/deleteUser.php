<?php

    require_once "../clases/conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
        if (isset($_GET["id_alumno"])) {
                $id_alumno = $_GET["id_alumno"];

                $sql = "DELETE FROM users WHERE id_alumno = $id_alumno";
            
                try {
                    $con->query($sql);
                    header("HTTP/1.1 200 OK");

                    echo json_encode($id_alumno);

                } catch (mysqli_sql_exception $e) {
                    header("HTTP/1.1 404 Not Found");
                }
            
        } else {
            header("HTTP/1.1 400 Bad request");
        }
    }

?>