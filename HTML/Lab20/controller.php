<?php
require_once("util.php");
$pattern=strtolower($_GET['pattern']);
$words=array();
$result=consulta();


if(mysqli_num_rows($result)>0){
    //Cargar
    while($row=mysqli_fetch_assoc($result)){
      array_push($words,$row["Descripcion"]);
    }
  }else{
    echo 'No existe un refran';
  }
$response="";
$size=0;
for($i=0; $i<count($words); $i++)
{
   $pos=stripos(strtolower($words[$i]),$pattern);
   if(!($pos===false))
   {
     $size++;
     $word=$words[$i];
     $response.="<option value=\"$word\">$word</option>";
   }
}
if($size>0){
    echo 
  "<table class='responsive-table'>                
  <tbody>
    $response
  </tbody>
  </table>";
}else{
  echo "No se encontro ningun resultado";
}
?>



