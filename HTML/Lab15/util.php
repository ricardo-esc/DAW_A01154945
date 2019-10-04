<?php
/**
 * Crea una conexión con una base de datos en mysql
 **/
function connectDB() {
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Memes";
    
    $environment = "DEV";
    
    if ($environment == "DEV") {
         $bd = mysqli_connect($servername,$username,$password,$dbname);
    } else if($environment == "PROD") {
         //TODO: Cambiar la configuración de acuerdo al ambiente de producción
         $bd = mysqli_connect($servername,$username,"passwdadmin",$dbname);
    }
    
    if(!$bd){
        die("Conexion Fallida:" .mysqli_connect_error());
    }
    
    // Change character set to utf8
    mysqli_set_charset($bd,"utf8");
   
    return $bd;
}

function closeDB($bd) {
    
    mysqli_close($bd);
}

function nuevoMeme($genero, $descripcion, $imagen){
    $db = connectDB();
    
    $query='INSERT INTO Memes (Genero,Descripcion,Imagen) VALUES (?,?,?) ';
    
    // Preparing the statement 
    if (!($statement = $db->prepare($query))) {
        die("No se pudo preparar la consulta para la bd: (" . $db->errno . ") " . $db->error);
    }
    // Binding statement params 
    if (!$statement->bind_param("sss", $genero, $descripcion,$imagen)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error); 
    }
    
    // Executing the statement
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    } 

    closeDB($db);
}

function editarMeme($Id){
    $conexion = connectDB();
    $sql = 'SELECT * FROM Memes ';
    $sql .="WHERE Memes.Id='$Id'";
    $result= mysqli_query($conexion,$sql) ;
    $fila = mysqli_fetch_array($result, MYSQLI_BOTH);
    mysqli_free_result($result);
    closeDB($conexion);
    return $fila;
}

function actualizar($Id,$Genero,$Descripcion,$Imagen){
    
    $conexion = connectDB();
    
    
    if($Id == "") {
        $mensaje = "Ingresa un Id existente";
        return $mensaje;
    } 
    $resultado = editarMeme($Id);
    if($Genero == ""){
        $Genero=$resultado["Genero"];
    }
    if($Descripcion == ""){
        $Descripcion=$resultado["Descripcion"];
    }
    if($Imagen==""){
        $Imagen=$resultado["Imagen"];
    }
    echo $Id." ".$Genero." ".$Descripcion." ".$Imagen." ";
    
    // insert command specification 
    $query='UPDATE Memes SET Genero=?, Descripcion=?, Imagen=? WHERE Id=?';
    // Preparing the statement 
    if (!($statement = $conexion->prepare($query))) {
        die("No se pudo preparar la consulta para la bd: (" . $conexion->errno . ") " . $conexion->error);
    }
    // Binding statement params 
    if (!$statement->bind_param("ssss", $Genero, $Descripcion, $Imagen, $Id)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error); 
    }
    
    // Executing the statement
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    }
    
    return $statement;
    
}


?>