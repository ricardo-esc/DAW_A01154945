<?php
    
    include("header.html");
    require_once("util.php");
    require_once("consultas.php");

    if($_POST["genero"] == "" || $_POST["descripcion"] == "" || $_POST["imagen"] == ""){
         if ($_POST["genero"] == "") {
                $error_genero = "El genero no debe de estar en blanco";
            }

    if ($_POST["descripcion"] == "") {
                $error_descripcion = "La descripcion no puede estar vacia";
            }

    if ($_POST["imagen"] == "") {
                $error_imagen = "La dirección de la imagen no puede ir vacia";
            }
    include("registrar.html");
        
    }
else{
    nuevoMeme($_POST["genero"], $_POST["descripcion"],$_POST["imagen"]);
    echo primeraConsulta();
}
   
    include("footer.html");
?>