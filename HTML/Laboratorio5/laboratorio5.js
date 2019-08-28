var iguales = true;
var series = 500;
var peliculas = 500;
var celulares = 500;
var precio_serie = 1500;
var precio_pelicula = 500;
var precio_celular = 10000;
var total = 0;
var total1 = 0;
var total2 = 0;
var total2 = 0;
var desglose = "";
var desglose2 = "";
var desglose3 = "";

function validar(){
    var contraseña_1 = document.getElementById("contraseña1").value;
    var contraseña_2 = document.getElementById("contraseña2").value;
    var mensaje = new Array();

    if(contraseña_1 != contraseña_2){
       iguales = false;
        mensaje .push("Las dos contraseñas no son iguales");
    }
    else{
        iguales = true;
    }
    
    if(iguales == true){
        document.getElementById("contraseña1").style.backgroundColor = "green";
        document.getElementById("contraseña2").style.backgroundColor = "green";
    }
    else{
        document.getElementById("contraseña1").style.backgroundColor = "white";
        document.getElementById("contraseña2").style.backgroundColor = "white";
    }
    
        comentar(mensaje);

}

function comentar(mensaje){
    let toPrint = new Array();
    for(i = 0;i<mensaje.length;i++){
        if(i == mensaje.length-1){
            toPrint[i] = mensaje[i];
        }else{
           toPrint[i] = mensaje[i] + " / "; 
        }
        
    }
    document.getElementById("mensajes").innerHTML = "";
    for(i = 0;i<mensaje.length;i++){
        document.getElementById("mensajes").innerHTML += toPrint[i];  
    } 
}

function agregar(numero){
    switch(numero){
        case 1:
            let cantidad = document.getElementById("articulo1").value;
            if((series-cantidad)>0){
                total1=0;
                desglose="";
                desplegar1(desglose);
                series = series - cantidad;
                document.getElementById("disponible").innerHTML= "Unidades disponibles "+series;
                total1 += cantidad*precio_serie;
                if(cantidad>0){
                  desglose += "El subtotal de "+cantidad+" Series de Friends es de "+total1+" pesos"+"<p>"; 
                }
                desplegar1(desglose,desglose2,desglose3);
            }
            break;
            
        case 2:
            let cantidad2 = document.getElementById("articulo2").value;
            if((peliculas-cantidad2)>0){
                total2 = 0;
                desglose2="";
                desplegar1(desglose);
                peliculas = peliculas - cantidad2;
                document.getElementById("disponible2").innerHTML= "Unidades disponibles "+peliculas;
                total2 += cantidad2*precio_pelicula;
                if(cantidad2>0){
                     desglose2 += "El subtotal de "+cantidad2+" Peliculas de Harry Potter es de "+total2+" pesos"+"<p>";
                }
                desplegar1(desglose,desglose2,desglose3);
            }
            break;
            
        case 3:
            let cantidad3 = document.getElementById("articulo3").value;
            if((celulares-cantidad3)>0){
                total3 = 0;
                desglose3="";
                desplegar1(desglose);
                celulares = celulares - cantidad3;
                document.getElementById("disponible3").innerHTML= "Unidades disponibles "+celulares;
                total3 += cantidad3*precio_celular;
                if(cantidad3>0){
                    desglose3 += "El subtotal de "+cantidad3+" iPhones es de "+total3+" pesos"+"<p>";
                }
                desplegar1(desglose,desglose2,desglose3);
            } 
            break;        
    }
   total = total1+total2+total3;
    if(total>0){
      let iva = "El subtotal es de "+total+" pesos <p> El total con 16% de IVA es de "+(total*1.16)+" pesos";
    desplegar2(iva)  
    }
   else{
    let iva = "";
    desplegar2(iva) 
   }
}
    function test (){
        var probabilidad = 100;
        let nombre = document.getElementById("nombre").value;
        let edad = document.getElementById("edad").value;
        let relaciones = document.getElementById("relaciones").value;
                

        if(nombre.length > 5){
            probabilidad -= 15;
        }
    
        if(nombre.length>7){
            probabilidad -= 20;
        }
     
        if(edad>20 && edad < 35){
            probabilidad -= 5;
        }
        
        if(edad > 35){
            probabilidad -= 25;
        }
        
        if(relaciones == 1){
            probabilidad -= 10;
        }
  
        if(relaciones == 2){
            probabilidad += 10;
        }
    
        if(relaciones == 3){
            probabilidad -= 20;
        }
      
        document.getElementById("resultado").innerHTML = "La probabilidad de que te vayas a casar es de: "+probabilidad +"%";
    }

function desplegar1(desglose,desglose2,desglose3){
    document.getElementById("subtotal").innerHTML = desglose+desglose2+desglose3;
}
function desplegar2(total){
    document.getElementById("total").innerHTML = total;
}