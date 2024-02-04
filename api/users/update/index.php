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

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    try {        
        if (isset($_SESSION["key"])) {
            $key = $_SESSION["key"];
            $headersJS = getallheaders();
            $jwt = $headersJS["Authorization"];

            $decoded = JWT::decode($jwt, new Key ($key, 'HS256'));

            $username = $decoded->username;
            $id = $decoded->user_id;
            $userNameJWT = $decoded->username;

            $name = $_POST["name"];
            $username = $_POST["username"];
            $mail = $_POST["mail"];
            $city = $_POST["city"];
            $pass = $_POST["pass"];

            echo $pass;
            $hashPass = password_hash($pass, PASSWORD_BCRYPT);
            echo $hashPass;
            $con->autocommit(false);  
            
            if (isset($_FILES["file"])) {
                if (file_exists('../../../img/userPhotos/'.strtolower($userNameJWT).".png")) {
                    unlink('../../../img/userPhotos/'.strtolower($userNameJWT).".png");
                }
                $photo = $_FILES["file"];
                $rutaDestino = '../../../img/userPhotos/';
                if (!file_exists($rutaDestino)) {
                    mkdir($rutaDestino, 0777, true);
                }
                move_uploaded_file($_FILES['file']['tmp_name'], '../../../img/userPhotos/'.strtolower($username).".png");
                
                $sqlNormal = "
                        UPDATE users
                        SET name = '$name', username = '$username', mail = '$mail', city = '$city', photo = '$username.png'
                        WHERE id = '$id';
                    ";
                    
            } else {
                $sqlNormal = "
                        UPDATE users
                        SET name = '$name', username = '$username', mail = '$mail', city = '$city'
                        WHERE id = '$id';
                    ";
            }

            
            $con->query($sqlNormal);
                
            if (isset($_POST['phone']) && isset($_POST['club'])) {
                $phone = $_POST['phone'];
                $club = $_POST['club'];
                    
                $sqlOrganizer = "
                    UPDATE organizers
                    SET  phone = '$phone', club = '$club'
                    WHERE id_user = '$id';
                ";
                $con->query($sqlOrganizer);
            }
    
            $con->commit();
            header("HTTP/1.1 200 OK");
        }
    } catch (mysqli_sql_exception $e) {
        header("HTTP/1.1 404 Not Found");
    } catch (Firebase\JWT\ExpiredException $e) {
        header("HTTP/1.1 401 Unauthorized");
    }
} else {
    header("HTTP/1.1 400 Bad request");
}


?>