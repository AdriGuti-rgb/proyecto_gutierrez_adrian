<?php
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

    require '../../PHPMailer-master/src/Exception.php';
    require '../../PHPMailer-master/src/PHPMailer.php';
    require '../../PHPMailer-master/src/SMTP.php';

    if($_SERVER["REQUEST_METHOD"] === "POST"){
        try {
            $mailAddress = $_POST["mail"];
            $mail = new PHPMailer(true);
    
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username='agutierrezusoz@gmail.com';
            $mail->Password = "gftv ydkz ntco ujys";
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;
    
            // $mail->setFrom('racemapp23@gmail.com');
            $mail->addAddress($mailAddress);
    
            $mail->isHTML(true);
            $mail->Subject = "Recuperacion de contraseña";
            $mail->Body = "Enlace para restableces la contraseña \n <a href='http://localhost/php/proyecto/recuperacion.html?mail=$mailAddress'>Click</a>";
    
            $mail->send();
            
        } catch (Exception $e) {
            echo json_encode(["message" => $e->getMessage()]);
        }
    }

?>