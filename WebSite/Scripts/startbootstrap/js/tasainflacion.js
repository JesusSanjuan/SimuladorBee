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

            /* Limpia los demas campos posteriores */
            var op1 = [];
            op1.push("<option value='' class='dropdown-item' selected>Seleccione</option>");
            $('#select1').html(op1);
            $('#select1').prop("disabled", true); 
            $('#select1').selectpicker('refresh');
            /* Limpia los demas campos posteriores */
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
                            var id_anio = resultado[2];
                            var anio = resultado[3];
                            var TF = inicio[1].concat(" ", inicio[0]," - ", fin[1]," ", fin[0]);
                            $("#rango").html(' <h6>' + TF + '<h6>');
                            $('#pre_datos2').css("display", "block");

                        var optionsAnio = [];
                        var valorAnio = "<option value='' class='dropdown-item' selected>Seleccione</option>";
                        optionsAnio.push(valorAnio);
                        for (i = 0; i < id_anio.length; i++) {
                            var option;
                            option = "<option value=" + id_anio[i] + ">" + anio[i] + "</option>";
                            //console.log(option);
                            optionsAnio.push(option);
                        }

                        $('#select').html(optionsAnio);
                        $('#select').selectpicker('refresh');
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

    $('#select.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var id_periodo_select = $("#select.selectpicker").val();
        $.ajax({
            type: "POST",
            url: "tasainflacion.aspx/get_imputs_post_anio",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ id_periodo_select: id_periodo_select }),
            success: function (result) {

                $('#select1').prop("disabled", false);
                var meses = JSON.parse(result.d); 
                var optionsMeses = [];
                var valormes = "<option value='' class='dropdown-item' selected>Seleccione</option>";
                optionsMeses.push(valormes);
                for (i = 0; i < meses.length; i++) {
                    var option;
                    option = "<option value=" + meses[i].toLowerCase() + ">" + meses[i]+ "</option>";
                    optionsMeses.push(option);
                }

                $('#select1').html(optionsMeses);
                $('#select1').selectpicker('refresh');
            },
            error: function (result) {
                console.log(result.responseText);
            }

        }).done(function (data) {
            //console.log(data);
        }).fail(function (data) {
            console.log("Error: " + data);
        });


    });

    $('#select1.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var id_periodo_select_anio = $("#select.selectpicker").val();
        var id_periodo_select_mes = $("#select1.selectpicker").val();
        if (id_periodo_select_mes.length == 0) {
            id_periodo_select_anio = "";
        }
        $.ajax({
            type: "POST",
            url: "tasainflacion.aspx/get_imputs_post_anio_2",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ id_periodo_select_anio: id_periodo_select_anio}),
            success: function (result) {

                var resultados = JSON.parse(result.d); 
                var id_anios = resultados[0];
                var anios = resultados[1];                
                $('#select2').prop("disabled", false);

                var optionsMeses = [];
                var valormes = "<option value='' class='dropdown-item' selected>Seleccione</option>";
                optionsMeses.push(valormes);
                 for (i = 0; i <anios.length; i++) {
                    var option;
                    option = "<option value=" + id_anios[i] + ">" + anios[i] + "</option>";
                    optionsMeses.push(option);
                }

                $('#select2').html(optionsMeses);
                $('#select2').selectpicker('refresh');
            },
            error: function (result) {
                console.log(result.responseText);
            }

        }).done(function (data) {
            //console.log(data);
        }).fail(function (data) {
            console.log("Error: " + data);
        });









    });

});