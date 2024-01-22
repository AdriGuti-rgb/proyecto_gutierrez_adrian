<?php

    require_once "./conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $sql = "SELECT * FROM users";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);

            $queryOrganizer = "SELECT users.id, users.name, organizers.id_user
                            FROM users
                            LEFT JOIN organizers ON users.id = organizers.id_user
                            WHERE users.id = '03u7cup02ed1'";
            $resultOrganizer = $con->query($queryOrganizer);

            $existeOrganizer = $resultOrganizer->fetch_all(MYSQLI_ASSOC);

            if (count($existeOrganizer) > 0) echo "Es organizador";
                else echo "Es usuario normal";
            

            header("HTTP/1.1 200 OK");
            // echo json_encode($users);
            
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>