<?php

    function connectDB() {
            
            $servername = "mysql1008.mochahost.com";
            $username = "dawbdorg_1154945";
            $password = "1154945";
            $dbname = "dawbdorg_A01154945";
            
            $environment = "DEV";
            if ($environment == "DEV") {
                 $connection = mysqli_connect($servername, $username, $password, $dbname);
            } else if($environment == "PROD") {
                 $connection = mysqli_connect($servername, $username, "passwdadmin", $dbname);
            }
            if(!$connection){
                die("Conexión fallida: " . mysqli_connect_error());
            }

            mysqli_set_charset($connection,"utf8");
            return $connection;
        }

    function closeDB($connection) {
            mysqli_close($connection);
    }
    
    function registrarZombie($nombre1){
    $db = connectDB();
   // $query= "CALL `RegistrarZombie`($nombre1)";
   $query= "INSERT INTO Zombie (nombre) VALUES (?)";
   
             
    if (!($statement = $db->prepare($query))) {
        die("No se pudo preparar la consulta para la bd: (" . $db->errno . ") " . $db->error);

    }
    if (!$statement->bind_param("s", $nombre1)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error);

    }
    
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    } 
    closeDB($db);
    }

	

function obtenerZombies()
{
   $db = connectDB();
    
    $resultado = array();
    $query = "SELECT id, nombre FROM Zombie";
   // $query = "CALL obZombies()";
    $registros = $db->query($query);
    
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
       array_push($resultado, array($fila["id"],$fila["nombre"]));
   }
    $regresar='<table><thead><tr><td>Nombre</td><td>Estados</td></tr></thead><tbody>';
    
    for($i = 0; $i < count($resultado); $i++){
        
        $id=$resultado[$i][0];
        $query1 = "SELECT estado,fechaHora FROM Registro,Estado WHERE idZombie='" . $id . "' AND Estado.id=idEstado";
        $resultado2 = array();
        $registros2 = $db->query($query1);
    if($registros2){
           while ($fila = mysqli_fetch_array($registros2, MYSQLI_BOTH)) {
               array_push($resultado2, array($fila["estado"],$fila["fechaHora"]));
           }
            $regresar.="<tr><td>".$resultado[$i][1]."</td><td>";

            for($j=0; $j < count($resultado2); $j++){
                $regresar.= $resultado2[$j][0]."  ".$resultado2[$j][1]."<br/>";
            }
            $regresar.="</td></tr>";
        }
        else{
             $regresar.="<tr><td>".$resultado[$i][1]."</td><td>";
             $regresar.="</td></tr>";
        }
    }
    $regresar.="</tbody></table>";
  
   closeDB($db);
   echo $regresar;
}
function consultarEstado(){
        $db = connectDB();
        $query="SELECT estado,id FROM Estado";
        $registros = $db->query($query);
        $datos=array();
        $entro=0;

        while($row = mysqli_fetch_array($registros,MYSQLI_BOTH)){
          array_push($datos, array($row["estado"],$row["id"]));
        }
        for($i=0; $i<count($datos); $i++)
        {
            $razon=$datos[$i][0];
            $id=$datos[$i][1];
            echo"<option value='$id'> $razon</option>";
        }
        closeDB($db);
    }
function consultarZombie(){
        $db = connectDB();
        $query="SELECT nombre,id FROM Zombie";
        $registros = $db->query($query);
        $datos=array();

        while($row = mysqli_fetch_array($registros,MYSQLI_BOTH)){
          array_push($datos, array($row["nombre"],$row["id"]));
        }
        for($i=0; $i<count($datos); $i++)
        {
            $razon=$datos[$i][0];
            $id=$datos[$i][1];
            echo"<option value='$id'> $razon</option>";
        }
        closeDB($db);
    }

function registrarEstado($zombie,$estado){
        $db = connectDB();
    $query='INSERT INTO Registro (idZombie,idEstado) VALUES (?,?) ';
 // $query= "CALL `RegistrarEstado`($zombie,$estado)";
    

    if (!($statement = $db->prepare($query))) {
        die("No se pudo preparar la consulta para la bd: (" . $db->errno . ") " . $db->error);

    }
    if (!$statement->bind_param("ss", $zombie,$estado)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error);

    }
    
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    } 

    closeDB($db);
    }



function segundaConsulta(){
     $db = connectDB();
    
    $query ="SELECT COUNT(idZombie) AS 'Total' FROM Registro";
    $registros = $db->query($query);
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
       array_push($resultado, array($fila["Total"]));
   }
     for($i = 0; $i < count($resultado); $i++){
    
     }

}
         
    

?>