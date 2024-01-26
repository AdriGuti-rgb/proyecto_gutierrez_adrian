<?php

    require_once "../../conexion.php";
    $con = new Conexion();

    if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type");
        header("Content-Length: 0");
        header("HTTP/1.1 200 OK");
        exit;
    }    

    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    header('Content-Type: application/json');

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {            
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            
            $raceName = $data["raceName"];
            $category = $data['categories'];
            $total_slope = $data["total_slope"];
            $positive_slope = $data['positive_slope'];
            $negative_slope = $data['negative_slope'];
            $poblation = $data['poblation'];
            $main_photo = $data['main_photo'];
            $gpx = $data['gpx'];
            $race_day = $data['race_day'];
            $services = $data['services'];
            $modality = $data['modality'];
            $older_photos = $data['older_photos'];

            $uniqid = uniqid();
            $hash = md5($uniqid);
            $idAlfanumerico = substr($hash, 0, 20);

            $sqlCategory = "SELECT * FROM categories WHERE type = '$category'";
            $resultadosCategory = $con->query($sqlCategory);
            $categories = $resultadosCategory->fetch_all(MYSQLI_ASSOC);
            $id_category = $categories[0]["id"];
            

            $sqlModality = "SELECT * FROM modalities WHERE type = '$modality'";
            $resultadosModality = $con->query($sqlModality);
            $modalities = $resultadosModality->fetch_all(MYSQLI_ASSOC);
            $id_modality = $modalities[0]["id"];


            $sqlServices = "SELECT * FROM services";
            $resultadoServices = $con->query($sqlServices);
            $servicesConsulta = $resultadoServices->fetch_all(MYSQLI_ASSOC);
    
            $totalServices = array();
            foreach ($servicesConsulta as $key => $value) {
                foreach ($services as $keyJS => $valueJS) {
                    if ($valueJS == $value["type"]) {
                        $totalServices[] = $value["id"];
                    }
                }
            }

            if ($id_category != "" || $id_modality != "") {
                $sqlNormal = "
                        INSERT INTO races ()
                        VALUES ('$idAlfanumerico', '$raceName', '$race_day', '$positive_slope', '$negative_slope', '$total_slope', '$poblation', '$main_photo', '$id_category', '$id_modality')
                    ";
                $con->query($sqlNormal);
            } else header("HTTP/1.1 404 Not Found");


            foreach ($totalServices as $value) {
                $sqlNormal = "
                        INSERT INTO races_services ()
                        VALUES ('$idAlfanumerico', '$value')
                    ";
                $con->query($sqlNormal);
            }

            header("HTTP/1.1 201 Created");

            echo json_encode(array("message" => "Carrera creada"));

        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("message" => $e->getMessage()));
            echo json_encode(array("message" => "Error de los datos"));
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }  
?>