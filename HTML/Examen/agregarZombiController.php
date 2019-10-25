<?php 
	include("header.html");
    require_once("modelo.php");
    
    if(isset($_POST["name"])){
    
    registrarZombie($_POST["name"]);
    header("location:exitoController.php");
    }
    else{
        include_once("agregarZombi.html");
    }
    include_once("footer.html");

 ?>

