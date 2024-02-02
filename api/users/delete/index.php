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


    if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
        try {
            if (isset($_SESSION["key"])) {
                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));
                
                $rol = $decoded->rol;
                $id = $decoded->user_id;

                $con->autocommit(false);

                $sqlFavourite = "DELETE FROM favourites WHERE id_user = '$id'";
                $resultado = $con->query($sqlFavourite);

                if ($rol == "Organizer") {
                    $sqlOrganizer = "DELETE FROM organizers WHERE id_user = '$id'";
                    $con->query($sqlOrganizer);
                }

                $sqlUser = "DELETE FROM users WHERE id = '$id'";
                $resultado = $con->query($sqlUser);

                $con->commit();
                
                echo json_encode("Todo bien");

            } else {
                echo json_encode(array("error" => "La clave no está disponible en la sesión."));
            }
        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("error" => "Error: " . $e->getMessage()));
        } catch (Firebase\JWT\ExpiredException $e) {
            header("HTTP/1.1 401 Unauthorized");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
    
?>