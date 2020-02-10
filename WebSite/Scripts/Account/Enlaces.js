$(document).ready(function () {
    $("#ref1").attr("href", "../About");
    $("#ref2").attr("href", "../Contact");


    var URLactual = jQuery(location).attr('href');
    let posicion = URLactual.indexOf("Account");
    if (posicion !== -1) {
        $("#contactopag").attr("href", "../Contact");
        //console.log("La palabra está en la posición " + posicion);
    }
    else {
        //console.log("No encontré lo que estás buscando");
        $("#contactopag").attr("href", "Contact");
    }


});

