<?php
  require_once("util.php");
require_once("consultas.php");

  include_once("header.html");
  
  if (isset($_POST["Id"]) && isset($_POST["Genero"]) && isset($_POST["Descripcion"]) && isset($_POST["Imagen"])) {
      
      if(actualizar($_POST["Id"],$_POST["Genero"],$_POST["Descripcion"],
      $_POST["Imagen"])){
          if($_POST["Id"]!=""){
              echo "<h4>Dato Actualizado</h4>";
        }
          else{
              echo "<h4>Error Editando</h4>";
          }
      }
      else{
          echo "<h4>Error editando</h4>";
      }
  }
  include_once("footer.html");
?>