<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            $datosTotales = array();

            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            $raceName = $data["name"];

            $sql = "SELECT * FROM races WHERE name = '$raceName'";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);
            $raceData = array(
                "name" => $races[0]["name"], 
                "race_day" => $races[0]["race_day"], 
                "positive_slope" => $races[0]["positive_slope"], 
                "negative_slope" => $races[0]["negative_slope"], 
                "total_slope" => $races[0]["total_slope"], 
                "distance" => $races[0]["distance"], 
                "poblation" => $races[0]["poblation"], 
                "main_photo" => $races[0]["main_photo"]
            );


            $id_race = $races[0]["id"];
            $id_category = $races[0]["id_category"];
            $id_modality = $races[0]["id_modality"];
            
            $sql = "SELECT winner, second_place, third_place, year_race, time_race FROM older_clasifications WHERE id_race = '$id_race'
                            ORDER BY year_race DESC";
            $resultado = $con->query($sql);
            $clasifications = $resultado->fetch_all(MYSQLI_ASSOC);
            
            $sql = "SELECT type FROM services S, races_services RS 
                    WHERE RS.id_race = '$id_race' AND S.id = RS.id_service";
            $resultado = $con->query($sql);
            $services = $resultado->fetch_all(MYSQLI_ASSOC);


            $sql = "SELECT type FROM categories WHERE id = '$id_category'";
            $resultado = $con->query($sql);
            $categories = $resultado->fetch_all(MYSQLI_ASSOC);
            $categoriesData = array(
                "type" => $categories[0]["type"]
            );

            $sql = "SELECT * FROM modalities WHERE id = '$id_modality'";
            $resultado = $con->query($sql);
            $modalities = $resultado->fetch_all(MYSQLI_ASSOC);
            $modalitiesData = array(
                "type" => $modalities[0]["type"],
                "first_prize" => $modalities[0]["first_prize"],
                "second_prize" => $modalities[0]["second_prize"],
                "third_prize" => $modalities[0]["third_prize"]
            );

            
            $datosTotales[] = $raceData;
            $datosTotales[] = $clasifications;
            $datosTotales[] = $services;
            $datosTotales[] = $categoriesData;
            $datosTotales[] = $modalitiesData;

            echo json_encode($datosTotales);

            header("HTTP/1.1 200 OK");            
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>