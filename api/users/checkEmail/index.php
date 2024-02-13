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
            $mail = $_POST['mail'];

            $sql = "SELECT mail FROM users WHERE mail = '$mail'";
            $resultado = $con->query($sql);
            $user = $resultado->fetch_all(MYSQLI_ASSOC);

            if ($resultado->num_rows > 0) {
                header("HTTP/1.1 200 OK");
            } else {
                header("HTTP/1.1 401 Unauthorized");
            }

        } catch (mysqli_sql_exception $e) {
            echo json_encode(array("error" => "Error: " . $e->getMessage()));
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
?>
