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
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    header('Content-Type: application/json');

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            if (isset($_SESSION["key"])) {
                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

                $id = $decoded->user_id;

                $pass = $_POST["pass"];

                $hashPass = password_hash($pass, PASSWORD_BCRYPT);

                $sql = "UPDATE users 
                        SET pass = '$hashPass' 
                        WHERE id = '$id'";
                $resultado = $con->query($sql);


                header("HTTP/1.1 200 OK");

            } else {
                echo json_encode(array("error" => "La clave no está disponible en la sesión."));
            }
        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("error" => "Error: " . $e->getMessage()));
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
?>
