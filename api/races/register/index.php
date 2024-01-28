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
            $distance = $data["distance"];
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
                $con->autocommit(false);  

                $sqlNormal = "
                        INSERT INTO races ()
                        VALUES ('$idAlfanumerico', '$raceName', '$race_day', '$positive_slope', '$negative_slope', '$total_slope', '$distance', '$poblation', '$main_photo', '$id_category', '$id_modality')
                    ";
                $con->query($sqlNormal);

                foreach ($totalServices as $value) {
                    $sqlServicesInsert = "
                            INSERT INTO races_services ()
                            VALUES ('$idAlfanumerico', '$value')
                        ";
                    $con->query($sqlServicesInsert);
                }

                foreach ($older_photos as $value) {
                    $uniqid = uniqid();
                    $hash = md5($uniqid);
                    $idPhotos = substr($hash, 0, 20);

                    $sqlPhotosInsert = "
                            INSERT INTO older_photos () 
                            VALUES ('$idPhotos', '$value', '$idAlfanumerico')
                        ";
                    $con->query($sqlPhotosInsert);
                }

                $con->commit();
            } else header("HTTP/1.1 404 Not Found");

            header("HTTP/1.1 201 Created");

        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("message" => $e->getMessage()));
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }  
?>