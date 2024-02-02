<?php

    require_once "../../conexion.php";
    $con = new Conexion();
    
    // header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Origin: https://localhost/php/proyecto/registro.html");

    if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {
        header("Access-Control-Allow-Methods: POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type");
        header("Content-Length: 0");
        header("HTTP/1.1 200 OK");
        exit;
    }

    header("Access-Control-Allow-Methods: POST, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    header('Content-Type: application/json');

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {            
            $name = $_POST["name"];
            $username = $_POST['username'];
            $mail = $_POST["mail"];
            $pass = $_POST['pass'];
            $city = $_POST['city'];

            $rutaDestino = '../../../img/userPhotos/';
            if (!file_exists($rutaDestino)) {
                mkdir($rutaDestino, 0777, true);
            }
            move_uploaded_file($_FILES['file']['tmp_name'], '../../../img/userPhotos/'.strtolower($username).".png");

            $uniqid = uniqid();
            $hash = md5($uniqid);
            $idAlfanumerico = substr($hash, 0, 20); 
        
            $con->autocommit(false);  

            $hashPass = password_hash($pass, PASSWORD_BCRYPT);

            $sqlNormal = "
                    INSERT INTO users (id, name, username, mail, pass, city, photo)
                    VALUES ('$idAlfanumerico', '$name', '$username', '$mail', '$hashPass', '$city', '$username.png')
                ";
            
            $con->query($sqlNormal);
                
            if (isset($_POST['phone']) && isset($_POST['club'])) {
                $phone = $_POST['phone'];
                $club = $_POST['club'];
                    
                $sqlOrganizer = "
                    INSERT INTO organizers (id_user, phone, club) VALUES ('$idAlfanumerico', '$phone', '$club')
                ";
                $con->query($sqlOrganizer);
            }

            $con->commit();

            header("HTTP/1.1 201 Created");

        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }

    
    
?>