<?php

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

require '../../jwt/vendor/autoload.php';
require_once "../../conexion.php";

$con = new Conexion();
session_start();


    if ($_SERVER["REQUEST_METHOD"] === "PUT") {
        try {
            if (isset($_SESSION["key"])) {
                $json_data = file_get_contents("php://input");
                $data = json_decode($json_data, true);
                
                $raceName = $data["name"];

                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

                $id_user = $decoded->user_id;

                $sql = "SELECT id FROM races WHERE name = '$raceName'";
                $resultadoGet = $con->query($sql);
                $races = $resultadoGet->fetch_all(MYSQLI_ASSOC);

                $id_race = $races[0]["id"];

                $sqlInsert = "INSERT INTO favourites () VALUES ('$id_user', '$id_race')";
                $resultado = $con->query($sqlInsert);

                header("HTTP/1.1 201 Created");
            } else {
                header("HTTP/1.1 500 Server Error");
            }
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    } 
    
    if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
        try {
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            
            $raceName = $data["name"];

            $sql = "SELECT id FROM races WHERE name = '$raceName'";
            $resultadoGet = $con->query($sql);
            $races = $resultadoGet->fetch_all(MYSQLI_ASSOC);

            $id_race = $races[0]["id"];

            $sqlDelete = "DELETE FROM favourites WHERE id_race = '$id_race'";
            $resultado = $con->query($sqlDelete);

            header("HTTP/1.1 203 Deleted");
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
     

?>