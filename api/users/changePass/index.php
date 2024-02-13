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
    header("Access-Control-Allow-Methods: GET, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type");
    header('Content-Type: application/json');

    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            $pass = $_POST["pass"];
            $mail = $_POST["mail"];

            $hashPass = password_hash($pass, PASSWORD_BCRYPT);

            $sql = "UPDATE users 
                    SET pass = '$hashPass' 
                    WHERE mail = '$mail'";
            $resultado = $con->query($sql);


            header("HTTP/1.1 200 OK");

        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 401 Unauthorized");
            echo json_encode(array("error" => "Error: " . $e->getMessage()));
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
?>
