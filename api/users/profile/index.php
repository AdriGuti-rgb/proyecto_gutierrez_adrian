<?php

    use Firebase\JWT\JWT;
    use Firebase\JWT\Key;
    require 'vendor/autoload.php';

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

    // print_r ($_GET);

    if ($_SERVER["REQUEST_METHOD"] === "GET") {

        $headers = getallheaders();
        $jwt = $headers["Authorization"];
        $decoded = JWT::decode($jwt, new Key($GLOBALS["key"], 'HS256'));
        echo json_encode($decoded);

        // echo json_encode($headers);
        echo $headers["Authorization"];

        // try {            
        //     $json_data = file_get_contents("php://input");
        //     $data = json_decode($json_data, true);
            
        //     $token = $data["token"];



        //     header("HTTP/1.1 201 Created");

        //     echo json_encode(array("message" => "Usuario creado"));

        // } catch (mysqli_sql_exception $e) {
        //     echo json_encode(array("message" => "Error de los datos"));
        //     header("HTTP/1.1 404 Not Found");
        // }
    } else {
        header("HTTP/1.1 400 Bad request");
    }

    
    
?>