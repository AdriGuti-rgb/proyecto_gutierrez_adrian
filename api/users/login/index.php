<?php

    use Firebase\JWT\JWT;
    require '../../jwt/vendor/autoload.php';
    require_once "../../conexion.php";
    $con = new Conexion();
    $idAlfanumerico;
    $username;
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
            $sql = "SELECT * FROM users";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);
            $exists = false;
            
            header("HTTP/1.1 200 OK");

            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            
            $username = $data['username'];
            $password = $data['pass'];

            $datos = array(
                "username" => $username,
                "pass" => $password
            );

            foreach ($users as $key => $value) {
                if ($value["username"] == $datos["username"]
                        && $value["pass"] == $datos["pass"]) {
                            $idAlfanumerico = $value["id"];
                            $username = $value["username"];
                            $name = $value["name"];

                            $queryOrganizer = "SELECT *
                                                FROM organizers
                                                LEFT JOIN users ON users.id = organizers.id_user
                                                WHERE users.id = '$idAlfanumerico'";
                            $resultOrganizer = $con->query($queryOrganizer);

                            $numRows = $resultOrganizer->num_rows;
                            $rol = ($numRows > 0) ? "Organizer" : "User";

                            $exists = true;

                            $key = uniqid();
                            
                            $payload = array(
                                "user_id" => $idAlfanumerico,
                                "username" => $username,
                                "name" => $name,
                                "rol" => $rol,
                                "exp" => time() + 3600
                            );
                            
                            $_SESSION['key'] = $key;
                            $jwt = JWT::encode($payload, $key, 'HS256');                             
                            
                            $tokenFinal = array(
                                'username' => "$username",
                                'token' => "$jwt",
                                'rol' => $rol,
                                'name' => $name
                            );
                            
                            echo json_encode($tokenFinal);
                }
            }
            
            if (!$exists) echo json_encode(array("error" => "Credenciales inválidas"));
   
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 405 Not Found");
        }
    } 

    if ($_SERVER["REQUEST_METHOD"] === "GET") {
        try {
            $sql = "SELECT * FROM users";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);
            header("HTTP/1.1 200 OK");
            
            echo json_encode($users);

        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not found");
        }
    } 
    
?>