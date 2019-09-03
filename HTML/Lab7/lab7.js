var estilo;
var estilo2;
var bandera = true;

function cambiarestilo(){

    estilo = document.getElementById("clic").style.fontWeight="bold";
    estilo = document.getElementById("clic").style.fontStyle="italic";
    
}

function cambiarestilo2(){
   estilo2 = document.getElementById("key").style.fontSize = "larger";
    estilo2 = document.getElementById("key").style.fontWeight ="lighter";
        estilo2 = document.getElementById("key").style.font ="calibri";

}

function agregarfoto(){
    var img = document.createElement("img");
    img.src = "corgi.png";
    var src = document.getElementById("fotos");
    src.appendChild(img);
}

function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}

function ayuda(){
    if(bandera){
        alert("Es múy fácil hacer drop, solo haz clic en la foto del hermoso corgi y arrastrala a la caja debajo y ve la magia");
        bandera = false;
    }
    
}