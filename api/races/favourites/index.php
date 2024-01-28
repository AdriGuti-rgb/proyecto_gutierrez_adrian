<?php

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

require '../../jwt/vendor/autoload.php';
require_once "../../conexion.php";

$con = new Conexion();
session_start();


    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            if (isset($_SESSION["key"])) {
                $key = $_SESSION["key"];
                $headersJS = getallheaders();
                $jwt = $headersJS["Authorization"];

                $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

                $id = $decoded->user_id;

                $sql = "SELECT id_race FROM favourites WHERE id_user = '$id'";
                $resultado = $con->query($sql);
                $favourites = $resultado->fetch_all(MYSQLI_ASSOC);

                $racesList = array();

                foreach ($favourites as $key => $value) {
                    $id_race = $value["id_race"];
                    $sql = "SELECT * FROM races WHERE id = '$id_race'";
                    $resultado = $con->query($sql);
                    $favouritesRaces = $resultado->fetch_all(MYSQLI_ASSOC);
                    $racesList[] = $favouritesRaces[0];
                }

                echo json_encode($racesList);
            } else {
                header("HTTP/1.1 500 Server Error");
            }
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    }
    

?>