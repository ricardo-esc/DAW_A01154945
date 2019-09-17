<?php
$flag = false;
$resultado = "";
$porcentaje = 100;

if (isset($_POST['nombre']) && isset($_POST['edad']) && isset($_POST['option'])){
  $resultado .= entradaVacia();
  if( strlen($resultado)>5){
    $flag = true;
  } 

  if($flag == false){
    $nombre = htmlspecialchars($_POST['nombre']);
    $edad = htmlspecialchars($_POST['edad']);
    $flag = caracteresEspeciales($nombre);
    if($flag == false){
      if(strlen($nombre) > 8){
        $porcentaje -= 10;
      }
      if($edad > 22){
        $porcentaje -= 15;
      }
      if($_POST['option'] == 3){
        $porcentaje -= 20;
      }
      else
      $porcentaje -= 5;

    echo "El porcentaje de que te vayas a casar es del ";
    echo $porcentaje;
    echo " porciento <br> <br> Da click en refresh para volver a empezar";
    }

  }
}
else{
  $resultado .= "No has seleccionado una opcion <br>";
  $resultado .= entradaVacia();
  $flag = true;
}


 function entradaVacia()
    {
      $vacio = "";
      if(empty($_POST['nombre'])){
        $vacio .= "No has introducido el nombre <br>";
        $flag = true;
      }
      if(empty($_POST['edad'])){
        $vacio .= "No has introducido la edad <br>";
        $flag = true;
      }
      return $vacio;
    }

  function caracteresEspeciales($nombre){
    if (!preg_match("/^[a-zA-Z ]*$/",$nombre)) {
     echo   "Solo se permiten letras"; 
     $flag = true;
    }
   return $flag;
  }

  if($flag == true){
  echo $resultado;
  echo "<br><br>Da click en refresh para volver a empezar";
  }

?>

