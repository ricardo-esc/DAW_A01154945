/*
6: 
Crea una solución para un problema de tu elección (puede ser algo relacionado con tus intereses, alguna problemática que hayas identificado en algún ámbito, un problema de programación que hayas resuelto en otro lenguaje, un problema de la ACM, entre otros). El problema debe estar descrito en un documento HTML, y la solución implementada en JavaScript, utilizando al menos la creación de un objeto, el objeto además de su constructor deben tener al menos 2 métodos. Muestra los resultados en el documento HTML.
*/

function tabla_cuadrados(limite) {
document.write("Primer Ejercicio:");
   let resultado = "<table> <tbody>";
    
    for(let i = 1; i <= limite;i++){
            resultado += "<td>";
            resultado += i * 1;
            resultado += "</td>"; 
    }
    resultado += "</tr>";
    resultado += "<tr>";
    let k = 1;
    for (let j = 1; j <= limite; j++) {
            resultado += "<td>";
            resultado += j * k;
            k++;
            resultado += "</td>";
        }
    resultado += "</tr>";
    resultado += "<tr>";
    let p = 1;
    for (let r = 1; r <= limite; r++) {
            resultado += "<td>";
            resultado += r * p *p;
            p++;
            resultado += "</td>";
        }
    resultado += "</tr>";
    resultado = "<table border = 3>" + resultado+ "</table>";
   // resultado += "</tbody></table>";
    return resultado;

}

function funcion2(){
    let numero1 = Math.floor((Math.random()*(11))+1);
    let numero2 = Math.floor((Math.random()*(11))+1);
    resultado = numero1+numero2;
    let tiempo1 = performance.now();
    let adivina = prompt("Introduce el resultado de la suma de"+numero1+"+"+numero2 +":");
    let tiempo2 = performance.now();
        
    if(resultado == adivina){
        document.write("¡Correcto!<br>");
    }
    else {
        document.write("La respuesta es incorrecta, la respuesta correcta es "+resultado+".<br>");
    }
    
   document.write("El tiempo que tardaste en responder fue de "+((tiempo2-tiempo1)/1000)+" segundos.");
}


function funcion3(){
    let arreglo = new Array();
    var negativos=0;
    var cero=0;
    var mayores=0;
    var j=0;
    document.write("El arreglo es: <br>")
    for(let i=0;i<20;i++){
        arreglo[i] = Math.floor((Math.random()*15)-9);
        document.write(arreglo[i]+" ");
    }
    
    for(j=0;j<20;j++){
        if(arreglo[j] < 0){
            negativos++;
        }
    }
    
    for(j=0;j<20;j++){
        if(arreglo[j] == 0){
            cero++;
        }
    }
    
     for(j=0;j<20;j++){
        if(arreglo[j] > 0){
            mayores++;
        }
    }
    document.write("<br>Existen "+negativos+" numeros negativos, "+cero+" ceros, "+mayores+" numeros mayores a 0 en el arreglo");
}

function funcion4(){
    let num = prompt("¿Cuántos renglones deseas?");
    
    let arreglo_i= new Array(num);
    let elementos = new Array();
    
    let local = 0;
    let resultado = 0;
    
    for(let i = 0;i<num;i++){
        local = prompt("¿Cuántos elementos deseas en el renglon "+(i+1)+"?");
        elementos[i]=local;
        arreglo_i[i]=new Array(local);
        for(let j = 0;j<local;j++){
            arreglo_i[i][j]=Math.floor((Math.random()*(11))+1);
        }
    }
    for(let i = 0;i<num;i++){
        for(let j = 0;j<local;j++){
           resultado += arreglo_i[i][j]; 
        }
        document.write("<br> Promedio del renglon "+ (i+1) + ": <br> "+(resultado/elementos[i]));
        resultado = 0;
    }
}

function funcion5(){
    var numero = prompt("Introduce un numero con al menos 2 digitos");
    let arreglo = Array(numero.length);
    var longitud = numero.length-1;
    for(let i = 0;i<numero.length;i++){
        arreglo[i] = numero[longitud];
        longitud --;
    }
 
    for(let j = 0; j<numero.length;j++){
        document.write(arreglo[j]);  
    }
}

//Crea tu propia libreria de peliculas
function creacion_Objeto(){
    var bandera = "true";
    var pelicula = Array();
    var i=0;
    while(bandera== "true"){
        pelicula[i] = new Object();
        pelicula[i].nombre = prompt("Introduce el nombre de la pelicula:");
        pelicula[i].genero = prompt("Introduce el género");
        pelicula[i].clasificacion = prompt("Introduce la clasificación: ");
        bandera = prompt("Deseas agregar otra pelicula?(true o false)");
        i++;
    }
    
    tabla_peliculas(pelicula);
}

function tabla_peliculas(pelicula){
    
    var tabla = "";
    tabla = tabla + "<tr>"
                    +"<th> Película </th>"
                    +"<th> Género </th>"
                    +"<th> Clasificación </th>" + "</tr>";

    for (var i = 0; i < pelicula.length; i++) {
        tabla = tabla + "<tr>"
                        +"<td>" + pelicula[i].nombre + "</td>"
                        +"<td>" + pelicula[i].genero+ "</td>"
                        +"<td>" + pelicula[i].clasificacion + "</td>"
                        +"</tr>";
    }
    
    tabla="<table border = 2>" + tabla + "</table>";
    document.write("" + tabla);
  
}

function correr_funcion1(){
    let limite_usuario = prompt("Ingresa un numero: ");
    let tabla_personalizada = tabla_cuadrados(limite_usuario);
    document.write(""+tabla_personalizada);
}

function correr_funcion2(){
    funcion2();
}

function correr_funcion3(){
    funcion3();
}

function correr_funcion4(){
    funcion4();
}

function correr_funcion5(){
    funcion5();
}

function correr_funcion6(){
     creacion_Objeto();
}
