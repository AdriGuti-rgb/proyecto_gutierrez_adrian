<?php

    use Firebase\JWT\JWT;
    use Firebase\JWT\Key;

    require '../../jwt/vendor/autoload.php';
    require_once "../../conexion.php";

    $con = new Conexion();
    session_start();

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
            if (isset($_SESSION["key"])) {
                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

                $json_data = file_get_contents("php://input");
                $data = json_decode($json_data, true);
                
                $raceName = $data['name'];
                $id_organizer = $decoded->user_id;

                $sql = "SELECT * FROM races 
                        WHERE name = '$raceName' AND id_organizer = '$id_organizer' ";
                $resultado = $con->query($sql);
                $races = $resultado->fetch_all(MYSQLI_ASSOC);
                header("HTTP/1.1 404 Not Found");

                if (count($races) > 0) {
                    header("HTTP/1.1 200 OK");
                }

            } else {
                echo json_encode(array("error" => "La clave no está disponible en la sesión."));
            }

        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("message" => $e->getMessage()));
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }  
?>