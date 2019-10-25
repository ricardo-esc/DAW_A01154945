<?php

include_once("header.html");
require_once("modelo.php");

if(isset($_POST["zombie"]) && isset($_POST["estado"])){
    
    registrarEstado($_POST["zombie"], $_POST["estado"]);
    header("location:exitoController.php");
}
else{
    include_once("estado.html");
}
include_once("footer.html");
?>



    