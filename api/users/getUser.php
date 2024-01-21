<?php

    require_once "../conexion.php";
    $con = new Conexion();
    $idAlfanumerico;
    $username;

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


    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            $sql = "SELECT * FROM users";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);
            
            header("HTTP/1.1 200 OK");

            // echo $_POST["username"];
            // echo $_POST["pass"];

            foreach ($users as $key => $value) {
                foreach ($value as $clave => $valor) {
                    // echo $value["username"];
                    if ($value["username"] == $_POST["username"]
                        && $value["pass"] == $_POST["pass"]) {
                            // echo "$valor <br>";
                            $idAlfanumerico = $value["id"];
                            $username = $value["username"];
                    }

                    // echo "Clave $clave: $valor <br>";
                    // echo "Valor $valor <br>";
                }
            }

            $key = "tu_clave_secreta";
            $payload = array(
                "user_id" => $idAlfanumerico,
                "username" => $username,
                "exp" => time() + 3600
            );
            
            $jwt = generateJWT($payload, $key);
            
            $tokenFinal = array(
                "username" => $username,
                "token" => $jwt
            );
            
            echo json_encode($tokenFinal);

            // echo json_encode($users);
            
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