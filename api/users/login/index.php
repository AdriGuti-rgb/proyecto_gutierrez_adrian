<?php

    require_once "../../conexion.php";
    $con = new Conexion();
    $idAlfanumerico;
    $username;
    $rol;

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
                            $rol = $value["rol"];

                            $exists = true;

                            $key = uniqid();
                            $payload = array(
                                "user_id" => $idAlfanumerico,
                                "username" => $username,
                                "exp" => time() + 3600
                            );
                            
                            $jwt = generateJWT($payload, $key);
                            
                            $tokenFinal = array(
                                'username' => "$username",
                                'token' => "$jwt",
                                'rol' => "$rol"
                            );
                            
                            echo json_encode($tokenFinal);
                }
            }
            
            if (!$exists) echo json_encode(array("error" => "Credenciales inválidas."));
   
        } catch (mysqli_sql_exception $e) {
            header("HTTP/1.1 404 Not Found");
        }
    } else {
        header("HTTP/1.1 400 Bad request");
    }

    
/* Crear el token de cada usuario para devolverlo */

    function generateJWT($payload, $key) {

        $header = base64_encode(json_encode(['typ' => 'JWT', 'alg' => 'HS256']));

        $payloadBase64 = base64_encode(json_encode($payload));

        $signature = hash_hmac('sha256', "$header.$payloadBase64", $key, true);
        $signatureBase64 = base64_encode($signature);

        $token = "$header.$payloadBase64.$signatureBase64";

        return $token;
    }
    
?>