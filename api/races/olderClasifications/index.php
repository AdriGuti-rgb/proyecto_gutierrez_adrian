<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            $datosTotales = array();

            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            $raceName = $data["raceName"];
            $winner = $data["winner"];
            $second_place = $data["second_place"];
            $third_place = $data["third_place"];
            $year = $data["year"];
            $time = $data["time"];

            
            $sql = "SELECT * FROM races WHERE name = '$raceName'";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);
            
            $id_race = $races[0]["id"];

            $uniqid = uniqid();
            $hash = md5($uniqid);
            $id_clasification = substr($hash, 0, 20);

            $sql = "INSERT INTO older_clasifications ()
                    VALUES ('$id_clasification', '$winner', '$second_place', '$third_place', '$year', '$time', '$id_race')";
            
            $resultado = $con->query($sql);

            header("HTTP/1.1 201 OK");            
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>