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

            $username = $decoded->username;
            $id = $decoded->user_id;

            $sql = "SELECT photo FROM users WHERE id = '$id'";
            $resultado = $con->query($sql);
            $users = $resultado->fetch_all(MYSQLI_ASSOC);

            echo json_encode($users[0]);
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
