<?php
    
    
    include("header.html");
    include("intro.html");
    require_once("util.php");
 
    echo "Primera Consulta";
    echo primeraConsulta();

    $genero="Comedia";
    echo "Segunda Consulta";
    echo segundaConsulta($genero);

    $id="2";
    echo "Tercera Consulta";
    echo terceraConsulta($id);
   
    include("preguntas.html");
    include("footer.html");
?>