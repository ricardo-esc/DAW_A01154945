<?php
/**
 * Crea una conexión con una base de datos en mysql
 **/
function connectDB() {
    
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Refranes";
    
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

function primeraConsulta($pattern){
    $db = connectDB();
    $resultado = array();
    
    $query = 'SELECT Descripcion FROM Refranes';
    
    if(!empty($pattern)){
        $query .= "WHERE Nombre LIKE '%pattern%'";
    }
    else{
        $query .= "LIMIT 50";
    }
    
    
    $resultado = "Camaron";
    
    closeDB($db);
    
    return $resultado;
}

 function consulta(){
        $db =connectDB();
    
        $sql="SELECT Descripcion FROM Refranes";
     
        $result = mysqli_query($db,$sql);
     
        closeDb($db);
     
        return $result;
    }



?>