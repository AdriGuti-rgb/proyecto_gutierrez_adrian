<?php

    require_once "../conexion.php";
    $con = new Conexion();

    
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        if (isset($_POST["nombre"]) && isset($_POST["nombreMostrado"])
            && isset($_POST["correo"]) && isset($_POST["contrasena"]) 
            && isset($_POST["fotoPerfil"]) && isset($_POST["localidad"])
            && isset($_POST["telefono"]) && isset($_POST["entidad"])) {
                $nombre = $_POST["nombre"];
                $nombreMostrado = $_POST["nombreMostrado"];
                $correo = $_POST["correo"];
                $contraseña = $_POST["contrasena"];
                $fotoPerfil = $_POST["fotoPerfil"];
                $localidad = $_POST["localidad"];
                $telefono = $_POST["telefono"];
                $entidad = $_POST["entidad"];

                /* Crear un id unico mas seguro para cada usuario */
                $uniqid = uniqid();
                $hash = md5($uniqid);
                $idAlfanumerico = substr($hash, 0, 20); 
                $sql = "
                    INSERT INTO users (id, name, username, mail, pass, city, phone, club, photo)
                    VALUES ('$idAlfanumerico', '$nombre', '$nombreMostrado', '$correo', '$contraseña', '$localidad', '$telefono', '$entidad', '$fotoPerfil')
                    ";
                    

                try {
                    $con->query($sql);
                    header("HTTP/1.1 201 Created");

                    // echo json_encode($con->insert_id);

                } catch (mysqli_sql_exception $e) {
                    echo $e->getMessage();
                    header("HTTP/1.1 404 Not Found");
                }
            }
    } else {
        header("HTTP/1.1 400 Bad request");
    }
    

?>