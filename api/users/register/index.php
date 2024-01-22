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
            header("HTTP/1.1 200 OK");
            
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            
            $name = $data["name"];
            $username = $data['username'];
            $mail = $data["mail"];
            $pass = $data['pass'];
            $photo = $data['photo'];
            $city = $data['city'];

            // $datos = array(
            //     "name" => $name,
            //     "username" => $username,
            //     "mail" => $mail,
            //     "pass" => $pass,
            //     "photo" => $photo,
            //     "city" => $city
            // );

            // echo json_encode($datos);

            $uniqid = uniqid();
            $hash = md5($uniqid);
            $idAlfanumerico = substr($hash, 0, 20); 
            $sqlNormal = "
                    INSERT INTO users (id, name, username, mail, pass, city, photo)
                    VALUES ('$idAlfanumerico', '$name', '$username', '$mail', '$pass', '$city', '$photo')
                ";
                
            if (isset($data['phone']) && isset($data['club'])) {
                $phone = $data['phone'];
                $club = $data['club'];
                    
                $sqlOrganizer = "
                    INSERT INTO organizers (id_user, phone, club) VALUES ('$idAlfanumerico', '$phone', '$club')
                ";
                $con->query($sqlOrganizer);
            }

            $con->query($sqlNormal);
            header("HTTP/1.1 201 Created");

            echo json_encode(array("message" => "Usuario creado exitosamente", "user_id" => $idAlfanumerico));

        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("error" => $e->getMessage()));
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
    
?>