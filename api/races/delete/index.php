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
                        eliminarContenidoCarpeta($archivo, $raceName);
                        rmdir($archivo);
                    }
                }
                if (file_exists("../../../img/races/$name")) {
                    rmdir("../../../img/races/$name");
                }
            }

            if (file_exists("../../../pdf/" . strtolower($raceName) . ".pdf")) {
                unlink("../../../pdf/" . strtolower($raceName) . ".pdf");
            }

            $carpetaAEliminar = '../../../img/races/' . $raceName;
            
            eliminarContenidoCarpeta($carpetaAEliminar, $raceName);

            header("HTTP/1.1 203 Deleted");
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }


    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        try {
            $raceName = $_POST["name"];
            $secondName = $_POST["secondName"];
            $poblation = $_POST["poblation"];
            $race_day = $_POST["race_day"];
            $distance = $_POST["distance"];

            $finalNames = strtolower($secondName);
            
            $con->autocommit(false);  
            
            $sql = "SELECT id FROM races WHERE name = '$raceName'";
            $resultado = $con->query($sql);
            $races = $resultado->fetch_all(MYSQLI_ASSOC);
            
            $id_race = $races[0]["id"];
            
            $sqlUpdate = "UPDATE races SET name = '$secondName', poblation = '$poblation', race_day = '$race_day', 
                            distance = '$distance'";
            
            if (!empty($_FILES["main_photo"])) {
                $main_photo = $_FILES["main_photo"];
                move_uploaded_file($main_photo['tmp_name'], '../../../img/races/' . $secondName . '/' . $finalNames . ".png");
                $sqlUpdate .= ", main_photo = '$finalNames.png'";
            }

            function eliminarContenidoCarpeta($carpeta, $name) {
                $archivos = glob($carpeta . '/*');
                foreach ($archivos as $archivo) {
                    if (is_file($archivo)) {
                        unlink($archivo);
                    } elseif (is_dir($archivo)) {
                        eliminarContenidoCarpeta($archivo, $name);
                        rmdir($archivo);
                    }
                }
                if (file_exists("../../../img/races/$name")) {
                    rmdir("../../../img/races/$name");
                }
            }

            if (!empty($_FILES["older_photos"])) {
                $older_photos = $_FILES["older_photos"];
                $sqlDelete = "DELETE FROM older_photos WHERE id_race = '$id_race'";
                $con->query($sqlDelete);

                $carpetaAEliminar = '../../../img/races/' . $secondName . '/olderPhotos/';
                eliminarContenidoCarpeta($carpetaAEliminar, $raceName);

                $contador = 0;

                $rutaDestinoOlder = '../../../img/races/' . $raceName . '/olderPhotos/';
                $rutaDestinoMain = '../../../img/races/' . $raceName . '/';

                if (!file_exists($rutaDestinoOlder)) {
                    mkdir($rutaDestinoOlder, 0777, true);
                }

                if (!file_exists($rutaDestinoMain)) {
                    mkdir($rutaDestinoMain, 0777, true);
                }

                foreach ($older_photos['tmp_name'] as $key => $tmpName) {
                    move_uploaded_file($tmpName, '../../../img/races/' . $secondName . '/olderPhotos/' . $finalNames ."$contador.png");
                    $contador++;
                }


                $contadorFotos = 0;
                foreach ($older_photos["name"] as $value) {
                    $uniqid = uniqid();
                    $hash = md5($uniqid);
                    $idPhotos = substr($hash, 0, 20);

                    $sqlPhotosInsert = "
                            INSERT INTO older_photos () 
                            VALUES ('$idPhotos', '$finalNames$contadorFotos.png', '$id_race')
                        ";
                    $contadorFotos++;
                    $con->query($sqlPhotosInsert);
                }
            }


            $sqlUpdate .= " WHERE id = '$id_race'";

            $resultado = $con->query($sqlUpdate);

            $con->commit();

            header("HTTP/1.1 200 OK");
        } catch (mysqli_sql_exception $e) {
            echo json_encode($e->getMessage());
            header("HTTP/1.1 404 Not found");
        }
    }

?>