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


function consultaDatos($id=0) {
    
    $db = connectDB();
    
    $resultado = '<div class="row">';
    
    $query = 'SELECT id, nombre, foto, created_at FROM amigos';
    
    if($id != 0) {
        $query .= " WHERE id=$id";
    }
    
    // Query execution; returns identifier of the result group
    $registros = $db->query($query);
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= '
            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <a href="verAmigos.php?id='.$fila["id"].'"><img src="'.$fila["foto"].'"></a>
                        <span class="card-title">'.$fila["nombre"].'</span>
                    </div>
                    <div class="card-content">
                        <p>Miembro desde '.$fila["created_at"].'</p>
                    </div>
                </div>
            </div>
        ';
    }
    
    $resultado .= "</div>";
    
    // it releases the associated results
    mysqli_free_result($registros);
    // Options: MYSQLI_NUM to use only numeric indexes
    // MYSQLI_ASSOC to use only name (string) indexes
    // MYSQLI_BOTH, to use both

    closeDB($db);
    
    return $resultado;
}

function primeraConsulta(){
     $db = connectDB();
    
    $resultado = '<div class="row">';
    
    $query = 'SELECT Id, Genero, Descripcion, Imagen FROM Memes';
    
    
    
    // Query execution; returns identifier of the result group
    $registros = $db->query($query);
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= '
            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <img src="'.$fila["Imagen"].'"></a>
                        <span class="card-title">'.$fila["Genero"].'</span>
                    </div>
                    <div class="card-content">
                        <p>Descripcion: '.$fila["Descripcion"].'</p>
                    </div>
                </div>
            </div>
        ';
    }
    
    $resultado .= "</div>";
    mysqli_free_result($registros);
    closeDB($db);
    
    return $resultado;
}



function segundaConsulta($genero){
     $db = connectDB();
    
    $resultado = '<div class="row">';
    
    $query = 'SELECT Id, Genero, Descripcion, Imagen FROM Memes WHERE Genero="'.$genero.'"';
     
    // Query execution; returns identifier of the result group
    $registros = $db->query($query);
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= '
            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <img src="'.$fila["Imagen"].'"></a>
                        <span class="card-title">'.$fila["Genero"].'</span>
                    </div>
                    <div class="card-content">
                        <p>Descripcion: '.$fila["Descripcion"].'</p>
                    </div>
                </div>
            </div>
        ';
        
    }
    
    $resultado .= "</div>";
    mysqli_free_result($registros);
    closeDB($db);
    
    return $resultado;
}

function terceraConsulta($id){
    $db = connectDB();
    
    $resultado = '<div class="row">';
    
    $query = 'SELECT Id, Genero, Descripcion, Imagen FROM Memes WHERE Id="'.$id.'"';
    
     // Query execution; returns identifier of the result group
    $registros = $db->query($query);
     // cycle to explode every line of the results
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= '
            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <img src="'.$fila["Imagen"].'"></a>
                        <span class="card-title">'.$fila["Genero"].'</span>
                    </div>
                    <div class="card-content">
                        <p>Descripcion: '.$fila["Descripcion"].'</p>
                    </div>
                </div>
            </div>
        ';
        
    }
    
    $resultado .= "</div>";
    mysqli_free_result($registros);
    closeDB($db);
    
    return $resultado;
}


?>