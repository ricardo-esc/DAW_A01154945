<?php
require_once("util.php");

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