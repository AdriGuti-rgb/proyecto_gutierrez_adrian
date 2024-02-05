<?php

    require_once "../../conexion.php";
    $con = new Conexion();


    if ($_SERVER["REQUEST_METHOD"] === "DELETE") {
        try {
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            $raceName = $data["name"];
            $con->autocommit(false);  

            $sql = "SELECT id FROM races WHERE name = '$raceName'";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);

            $id_race = $races[0]["id"];

            $sqlDelete = "DELETE FROM favourites WHERE id_race = '$id_race'";
            $resultado = $con->query($sqlDelete);

            $sqlDelete = "DELETE FROM older_clasifications WHERE id_race = '$id_race'";
            $resultado = $con->query($sqlDelete);

            $sqlDelete = "DELETE FROM older_photos WHERE id_race = '$id_race'";
            $resultado = $con->query($sqlDelete);

            $sqlDelete = "DELETE FROM races_services WHERE id_race = '$id_race'";
            $resultado = $con->query($sqlDelete);

            $sqlDelete = "DELETE FROM races WHERE id = '$id_race'";
            $resultado = $con->query($sqlDelete);

            $con->commit();

            function eliminarContenidoCarpeta($carpeta, $name) {
                $archivos = glob($carpeta . '/*');
                foreach ($archivos as $archivo) {
                    if (is_file($archivo)) {
                        unlink($archivo);
                    } elseif (is_dir($archivo)) {
                        eliminarContenidoCarpeta($archivo);
                        rmdir($archivo);
                    }
                }
                if (file_exists("../../../img/races/$name")) {
                    rmdir("../../../img/races/$name");
                }
            }
            $carpetaAEliminar = '../../../img/races/' . $raceName;
            
            eliminarContenidoCarpeta($carpetaAEliminar, $raceName);
            



            header("HTTP/1.1 203 Deleted");
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }


    if ($_SERVER["REQUEST_METHOD"] === "UPDATE") {
        try {
            $json_data = file_get_contents("php://input");
            $data = json_decode($json_data, true);
            $raceName = $data["name"];
            $secondName = $data["secondName"];
            $poblation = $data["poblation"];
            $race_day = $data["race_day"];
            $distance = $data["distance"];

            $con->autocommit(false);  

            $sql = "SELECT id FROM races WHERE name = '$raceName'";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);

            $id_race = $races[0]["id"];

            $sqlUpdate = "UPDATE races SET name = '$secondName', poblation = '$poblation', race_day = '$race_day', 
                            distance = '$distance'";
            
            if (!empty($data["main_photo"])) {
                $main_photo = $data["main_photo"];
                $sqlUpdate .= ", main_photo = '$main_photo'";
            }


            if (!empty($data["older_photos"])) {
                $older_photos = $data["older_photos"];
                $sqlDelete = "DELETE FROM older_photos WHERE id_race = '$id_race'";
                $con->query($sqlDelete);
                foreach ($older_photos as $value) {
                    $uniqid = uniqid();
                    $hash = md5($uniqid);
                    $idPhotos = substr($hash, 0, 20);

                    $sqlPhotosInsert = "
                            INSERT INTO older_photos () 
                            VALUES ('$idPhotos', '$value', '$id_race')
                        ";
                    $con->query($sqlPhotosInsert);
                }
            }


            $sqlUpdate .= " WHERE id = '$id_race'";

            // echo ($sqlUpdate);
            $resultado = $con->query($sqlUpdate);

            $con->commit();

            header("HTTP/1.1 200 OK");
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }

?>