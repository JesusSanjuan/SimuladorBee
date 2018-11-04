$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: "tasainflacion.aspx/extraerindices",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
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

    $('#select_indice_base.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var periodo_select = $("#select_indice_base.selectpicker").val();
        if (periodo_select.length == 0) {
            $('#pre_datos').css("display", "none");
        }
        else
        {
            $('#pre_datos').css("display", "block");
            consulta_inputs(periodo_select);
        }
     
    });

    function consulta_inputs(id_indice_base)
    {
        
            $.ajax({
                type: "POST",
                url: "tasainflacion.aspx/get_imputs_post",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ id_indice_base: id_indice_base}),
                success: function (result) {
                    if (result.d == "")
                    {
                        $("#rango").html(' <h6> No hay datos aun para esta base intente con otro base distinta<h6>');
                        $('#pre_datos2').css("display", "none");
                    }
                    else
                    {
                    
                            var resultado = JSON.parse(result.d);                    
                            var inicio = resultado[0];
                            var fin = resultado[1];
                            var TF = inicio[1].concat(" ", inicio[0]," - ", fin[1]," ", fin[0]);
                            $("#rango").html(' <h6>' + TF + '<h6>');
                            $('#pre_datos2').css("display", "block");
                    }

                },
                error: function (result) {
                    console.log(result.responseText);
                }

            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });
        
    }


});