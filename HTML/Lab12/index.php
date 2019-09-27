<?php
    //Inicio o recuperdo la sesión
    session_start();

    include("_header.html");

    //Checar si existe una sesion abierta y desplegarla

    if(isset($_SESSION["nombre"])) {
        
        include("sesion.php");
        
    } else if(isset($_POST["nombre"])) {
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
        $uploadOk = 1;
        $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
        // Check if image file is a actual image or fake image
        if(isset($_POST["enviar"])) {
            $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
            if($check !== false) {
                echo "File is an image - " . $check["mime"] . ".";
                $uploadOk = 1;
            } else {
                echo "El archivo no es una imagen.";
                echo "<br>";
                $uploadOk = 0;
            }
        }
        // Check if file already exists
        if (file_exists($target_file)) {
            echo "Lo siento, el archivo ya existe";
            echo "<br>";
            $uploadOk = 0;
        }
        // Check file size
        if ($_FILES["fileToUpload"]["size"] > 500000) {
            echo "Sorry, your file is too large.";
            $uploadOk = 0;
        }
        // Allow certain file formats
        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif" ) {
            echo "Recuerda solo se pueden subir archivos JPG, JPEG, PNG & GIF";
            echo "<br>";
            $uploadOk = 0;
        }
        // Check if $uploadOk is set to 0 by an error
        if ($uploadOk == 0) {
            echo "Lo siento, tu archivo no se pudo subir.";
        // if everything is ok, try to upload file
        } else {
            if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
                echo "El archivo ". basename( $_FILES["fileToUpload"]["name"]). " se ha cargado con éxito";
                echo "<br>";
            } else {
                echo "Lo siento, hubo un error cargando tu archivo";
                echo "<br><br>";
            }
        }
        
        //Creo la variable de sesión amigo.
        $_SESSION["nombre"] = $_POST["nombre"];
        $_SESSION["foto"] = $target_file;
        $_SESSION["pareja"] = $_POST["pareja"];
        include("sesion.php");
        
    } else {
        
        include("_login.html");
    }
    
    include("_footer.html");

?>