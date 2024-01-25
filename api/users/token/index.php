<?php

    use Firebase\JWT\JWT;
    use Firebase\JWT\Key;

    require '../../jwt/vendor/autoload.php';
    require_once "../../conexion.php";

    session_start();

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            if (isset($_SESSION["key"])) {
                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));


                $payload = array(
                    "user_id" => $decoded->user_id,
                    "username" => $decoded->username,
                    "name" => $decoded->name,
                    "rol" => $decoded->rol,
                    "exp" => time() + 3600
                );
                $jwtFinal = JWT::encode($payload, $key, 'HS256');                             

                $tokenFinal = array(
                    'username' => "$decoded->username",
                    'token' => "$jwtFinal",
                    'rol' => $decoded->rol,
                    'name' => $decoded->name
                );
                
                echo json_encode($tokenFinal);
            }
        } catch (Firebase\JWT\ExpiredException $e) {
            header("HTTP/1.1 401 Unauthorized");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
?>
