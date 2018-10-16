$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "tasainflacion.aspx/extraerindices",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            console.log(data.d);
            var valores = JSON.parse(data.d);
            var id_indice_base = valores[0];
            var id_base_nombres = valores[1];

            inicializacion(id_indice_base, id_base_nombres);
        },
        error: function (err) {
            console.log(err);
            console.log(err.responseText);
        }
    }).done(function (data) {
        //console.log(data);
    }).fail(function (data) {
        console.log("Error: " + data);
    });


   function inicializacion(x, y) {

   
    var options = [];
    //convertimos el array en json
    var result_ids_indice = JSON.parse(JSON.stringify(x));
    var result_descrip_indice_base = JSON.parse(JSON.stringify(y));
    console.log(result_ids_indice.length);

       var valor1 = "<option value='' class='dropdown-item' selected>Seleccione</option>";
       options.push(valor1);
    for (i = 0; i < result_ids_indice.length; i++)
    {
        var option;
        option = "<option value=" + result_ids_indice[i] + ">" + result_descrip_indice_base[i] + "</option>";
        //console.log(option);
        options.push(option);
    }

       $('#select_indice_base').html(options);
       $('#select_indice_base').selectpicker('refresh');

    }

});