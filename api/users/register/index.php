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
            
            $name = $data["name"];
            $username = $data['username'];
            $mail = $data["mail"];
            $pass = $data['pass'];
            $photo = $data['photo'];
            $city = $data['city'];

        echo ($photo);

            // $nombreImagen = $data['photo']['name'];
            // $rutaTemporal = $data['photo']['tmp_name'];
    
            echo $photo[0]["name"];
            // Puedes realizar otras validaciones y procesamientos aquí
    
            // Mover la imagen a una carpeta de destino
            // $rutaDestino = '../../img/userPhotos/' . $$name;
            // move_uploaded_file($rutaTemporal, $rutaDestino);

            $uniqid = uniqid();
            $hash = md5($uniqid);
            $idAlfanumerico = substr($hash, 0, 20); 
            $sqlNormal = "
                    INSERT INTO users (id, name, username, mail, pass, city, photo)
                    VALUES ('$idAlfanumerico', '$name', '$username', '$mail', '$pass', '$city', '$photo')
                ";
            
                // $con->query($sqlNormal);
                
            if (isset($data['phone']) && isset($data['club'])) {
                $phone = $data['phone'];
                $club = $data['club'];
                    
                $sqlOrganizer = "
                    INSERT INTO organizers (id_user, phone, club) VALUES ('$idAlfanumerico', '$phone', '$club')
                ";
                // $con->query($sqlOrganizer);
            }

            header("HTTP/1.1 201 Created");

        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }

    
    
?>