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
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] === "PUT") {
    try {        
        if (isset($_SESSION["key"])) {
            $key = $_SESSION["key"];
            $headersJS = getallheaders();
            $jwt = $headersJS["Authorization"];

            $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

            $username = $decoded->username;
            $id = $decoded->user_id;

            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
    
            $name = $data["nombreUsuario"];
            $username = $data["nombreMostrado"];
            $mail = $data["correo"];
            $photo = $data["fotoPerfil"];
            $mail = $data["contrasena"];
            $city = $data["localidad"];
            $pass = $data["contrasena"];
    
            $sqlNormal = "
                    UPDATE users
                    SET name = '$name', username = '$username', mail = '$mail', pass = '$pass', city = '$city', photo = '$photo'
                    WHERE id = '$id';
                ";
            
            $con->query($sqlNormal);
                
            if (isset($data['phone']) && isset($data['club'])) {
                $phone = $data['phone'];
                $club = $data['club'];
                    
                $sqlOrganizer = "
                    UPDATE organizers
                    SET  phone = '$phone', club = '$club'
                    WHERE id_user = '$id';
                ";
                $con->query($sqlOrganizer);
            }
    
            header("HTTP/1.1 200 OK");
    
            echo json_encode(array("message" => "Usuario modificado"));
        } else {
            echo json_encode(array("error" => "La clave no está disponible en la sesión."));
        }
    } catch (mysqli_sql_exception $e) {
        echo json_encode(array("message" => "Error de los datos"));
        header("HTTP/1.1 404 Not Found");
    }
} else {
    header("HTTP/1.1 400 Bad request");
}


?>