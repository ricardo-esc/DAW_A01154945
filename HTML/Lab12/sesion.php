<?php
        include("felicitaciones.html");
        echo $_SESSION["nombre"];
        echo " te felicitamos por haber cortado cualquier lazo tóxico que hayas tenido con ";
        echo $_SESSION["pareja"] . ".<br>";
        echo "<br>Esta será la última vez que veas esta foto como parte de tu futuro.";
        echo '<img class="responsive-img" alt="El chico" src="'.$_SESSION["foto"].'">';
        include("final.html");
        include("regresarInicio.html");
?>