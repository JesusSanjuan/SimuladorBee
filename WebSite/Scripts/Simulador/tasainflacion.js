$(document).ready(function () {
/*Ejecucion de MI CALCULADORA*/
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
        var result_ids_indice = JSON.parse(JSON.stringify(x));
        var result_descrip_indice_base = JSON.parse(JSON.stringify(y));
        var valor1 = "<option value='' class='dropdown-item' selected>Seleccione</option>";
        options.push(valor1);
        for (i = 0; i < result_ids_indice.length; i++)
        {
            var option;
            option = "<option value=" + result_ids_indice[i] + ">" + result_descrip_indice_base[i] + "</option>";
            options.push(option);
        }
        $('#select_indice_base').html(options);
        $('#select_indice_base').selectpicker('refresh');
    }

    $('#select_indice_base.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var periodo_select = $("#select_indice_base.selectpicker").val();
        if (periodo_select.length === 0) {
            $('#pre_datos').css("display", "none"); 
        }
        else
        {
            $('#pre_datos').css("display", "block");
            consulta_inputs(periodo_select);
        }        
        /* Limpia los demas campos posteriores */
        var op1 = [];
        op1.push("<option value='' class='dropdown-item' selected>Seleccione</option>");
        $('#select1').html(op1);
        $('#select2').html(op1);
        $('#select3').html(op1);
        $('#select1').prop("disabled", true);
        $('#select2').prop("disabled", true);
        $('#select3').prop("disabled", true);
        $('#select1').selectpicker('refresh');
        $('#select2').selectpicker('refresh');
        $('#select3').selectpicker('refresh');
        $("#Calculartasainfla").css('visibility', 'hidden');
        $('#Resultados').css("display", "none");
        $('#inf1').val("");
        $('#TPMI1').val("");
       /* Limpia los demas campos posteriores */
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
                    if (result.d === "")
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
            }).fail(function (data) {
                console.log("Error: " + data);
            });        
    }

    $('#select.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var id_periodo_select = $("#select.selectpicker").val();
        $("#Calculartasainfla").css('visibility', 'hidden');
        
        $('#Resultados').css("display", "none");
        $('#inf1').val("");
        $('#TPMI1').val("");
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
                $('#select2').html(optionsMeses);
                $('#select3').html(optionsMeses);
                $('#select2').selectpicker('refresh');
                $('#select3').selectpicker('refresh');
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
        }).fail(function (data) {
            console.log("Error: " + data);
        });
    });

    $('#select1.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var id_periodo_select_anio = $("#select.selectpicker").val();
        var id_periodo_select_mes = $("#select1.selectpicker").val();
        $("#Calculartasainfla").css('visibility', 'hidden');
        if (id_periodo_select_mes.length === 0) {
            id_periodo_select_anio = "";            
        }
        $('#Resultados').css("display", "none");
        $('#inf1').val("");
        $('#TPMI1').val("");
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
                $('#select3').html(optionsMeses);


                $('#select3').selectpicker('refresh');
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
        }).fail(function (data) {
            console.log("Error: " + data);
        });
    });

    $('#select2.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        var id_periodo_select_anio = $("#select.selectpicker").val();
        var id_periodo_select_mes = $("#select1.selectpicker").val();
        var id_periodo_select_anio2 = $("#select2.selectpicker").val();
        $("#Calculartasainfla").css('visibility', 'hidden');
        $('#Resultados').css("display", "none");
        $('#inf1').val("");
        $('#TPMI1').val("");
        $.ajax({
            type: "POST",
            url: "tasainflacion.aspx/get_imputs_post_anio_3",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ id_periodo_select_anio: id_periodo_select_anio,id_periodo_select_mes: id_periodo_select_mes, id_periodo_select_anio2: id_periodo_select_anio2 }),
            success: function (result) {
                var resultados = JSON.parse(result.d);
                $('#select3').prop("disabled", false);

                var optionsMeses = [];
                var valormes = "<option value='' class='dropdown-item' selected>Seleccione</option>";
                optionsMeses.push(valormes);
                for (i = 0; i < resultados.length; i++) {
                    var option;
                    option = "<option value=" + resultados[i].toLowerCase() + ">" + resultados[i] + "</option>";
                    optionsMeses.push(option);
                }
                $('#select3').html(optionsMeses);
                $('#select3').selectpicker('refresh');
            },
            error: function (result) {
                console.log(result.responseText);
            }
        }).done(function (data) {
        }).fail(function (data) {
            console.log("Error: " + data);
        });
    });

    $('#select3.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie        
        var v4 = $("#select3.selectpicker").val();
        if (v4.length === 0) {
            $("#Calculartasainfla").css('visibility', 'hidden');
        }
        else
        {
            $("#Calculartasainfla").css('visibility', 'visible');
        }
        $('#Resultados').css("display", "none");
        $('#inf1').val("");
        $('#TPMI1').val("");
    });
    var myInput = document.getElementById('inf1');
    var myInput2 = document.getElementById('TPMI1');
    myInput.onpaste = function (e) {
        e.preventDefault();
    };
    myInput2.onpaste = function (e) {
        e.preventDefault();
    };
    $('#Calculartasainfla').click(function () {
        var v1 = $("#select.selectpicker").val();
        var v2 = $("#select1.selectpicker").val();
        var v3 = $("#select2.selectpicker").val();
        var v4 = $("#select3.selectpicker").val();
        if (v1.length === 0 && v2.length === 0 && v3.length === 0 && v4.length === 0) {
            $('#myModal').modal({ show: true });
        }
        else {
                $.ajax({
                    type: "POST",
                    url: "tasainflacion.aspx/calcular_inflacion",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ id_inpc_inicial: v1, id_inpc_inicial_mes: v2, id_inpc_final: v3, id_inpc_final_mes:v4 }),
                    success: function (result) {
                        var resultados = JSON.parse(result.d);               
                        $('#Resultados').css("display", "block");
                        $("#P1").html('<h6>Periodo Seleccionado:&nbsp; <strong>' + resultados[1] + ' ' + resultados[0] + ' a ' + resultados[3] + ' ' + resultados[2] + '</strong> </h6>');
                        $('#inf1').val(resultados[4]);                
                        $("#P2").html('<h6>Periodo Seleccionado:&nbsp; <strong>' + resultados[1] + ' ' + resultados[0] + ' a ' + resultados[3] + ' ' + resultados[2] + '</strong> </h6>');
                        $('#TPMI1').val(resultados[5]);
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
/*Ejecucion de MI CALCULADORA*/

/*Ejecucion de CALCULADORA INEGI/
    /***************************/
    $('#alertSucces').hide();
    $('#alertSDanger').hide();
    inicializarProyectos();
   /*Carga de proyectos en select de INEGI*/ 
    function inicializarProyectos() {       
        $.ajax({
            type: "POST",
            url: "tasainflacion.aspx/cargar_proyectos",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            success: function (result) {
                var resultados = JSON.parse(result.d);
                var options = [];
                for (var i = 0; i < resultados.length; i++) {
                    var option;
                    option = resultados[i];
                    options.push(option);
                    //console.log(option);
                }
                $('#proyectos.selectpicker').html(options);
                $('#proyectos.selectpicker').selectpicker('refresh');
                $('#proyectosINEGI.selectpicker').html(options);
                $('#proyectosINEGI.selectpicker').selectpicker('refresh');
            },
            error: function (result) {
                console.log(result.responseText);
            }
        }).done(function (data) {
        }).fail(function (data) {
            console.log("Error: " + data);
        });

        var fecha = new Date();
        var anio = fecha.getFullYear();

        var optionsanio1 = [];
        optionsanio1.push("<option value=''>Seleccione</option>");
        for (var i = anio; i >= 1969; i--) {
            var option;
            option = "<option value='"+i+"'>"+i+"</option>";
            optionsanio1.push(option);
            //console.log(option);
        }
        $('#anio.selectpicker').html(optionsanio1);
        $('#anio.selectpicker').selectpicker('refresh');

    }
    /*Carga de proyectos en select de INEGI*/

    $('#Guardarinflacion').click(function () {
        $('#myModal').modal({ show: true });
    });

    $('#saveI').click(function () {
        var inflacion = $("#inf1").val();
        var inMensual = $("#TPMI1").val();

        var proyectos = $('#proyectos.selectpicker').val();


        if (inflacion != "" && inMensual != "" && proyectos.length > 0) {//inflacion != "" && inMensual != ""
            var array_inflacion = [];
            array_inflacion[0] = inflacion;
            array_inflacion[1] = inMensual;

            var periodo = $("#P1").find("h6").find("strong").html();

            
           //GUardamos los datos en la tabla de indices
            $.ajax({
                type: "POST",
                url: "tasainflacion.aspx/guardar_inflacion",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Periodo: periodo, Proyectos: proyectos, Inflaciones: array_inflacion }),
                async: false,
                success: function (result) {
                    console.log("resul " + resul);
                    var resul = result.d;
                    if (resul == "OK") {
                        $("#myModal").modal('hide');
                        location.reload();
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

    var anioval = false, anioval2 = false, mesval = false, mesval2 = false, anio2val = false, anio2val2 = false, mes2val = false, mes2val2 = false, proyectoval = false, proyectoval2 = false, inflacionval = false, inflacionval2 = false, tasapromediomensual = false, tasapromediomensual2 = false;

/*Validacion de campos en calculadora de INEGI antes de*/
    $('#anio').change(function () {
        var anio = $("#anio").val();
       ///No funciona en los selectpicker el removeclass por eso los erreores visuales
       
        if (anio === '') {
            $("#Anio1Val").addClass("invalid-feedback");
            $("#anio").removeClass("is-valid");
            $("#anio").addClass("is-invalid");
            $('#anio').selectpicker('refresh');    
            $('#Anio1Val').text('Por favor seleccione el año');
            $('#Anio1Val').show();

            $('#mes').selectpicker('val', '');
            $('#mes').change(); 
            $('#mes').selectpicker('refresh');
            $('#anio2').selectpicker('val', '');
            $('#anio2').change();
            $('#anio2').selectpicker('refresh');
            $('#mes2').selectpicker('val', '');
            $('#mes2').change();
            $('#mes2').selectpicker('refresh');
            $('#mes').prop("disabled", true);
            $('#mes').selectpicker('refresh');
            $('#anio2').prop("disabled", true);
            $('#anio2').selectpicker('refresh');   
            $('#mes2').prop("disabled", true);
            $('#mes2').selectpicker('refresh'); 
            anioval = false;
        }
        else {
            $("#anio").removeClass("is-invalid");
            $("#anio").addClass("is-valid");
            $('#anio').selectpicker('refresh');  
            $('#Anio1Val').hide();
            $('#mes').prop("disabled", false);
            $('#mes').selectpicker('refresh');
            anioval = true;
        }
    });

    $('#mes').change(function () {   
        var mes = $("#mes").val();
        if (mes === '') {
            $("#Mes1Val").addClass("invalid-feedback");
            $("#mes").removeClass("is-valid");
            $("#mes").addClass("is-invalid");
            $('#mes').selectpicker('refresh'); 
            $('#Mes1Val').text('Por favor seleccione el mes');
            $('#Mes1Val').show();


            $('#anio2').selectpicker('val', '');
            $('#anio2').change();
            $('#anio2').selectpicker('refresh');
            $('#mes2').selectpicker('val', '');
            $('#mes2').change();
            $('#mes2').selectpicker('refresh');
            $('#anio2').prop("disabled", true);
            $('#anio2').selectpicker('refresh');
            $('#mes2').prop("disabled", true);
            $('#mes2').selectpicker('refresh');  
            mesval = false;
        }
        else {
            $("#mes").removeClass("is-invalid");
            $("#mes").addClass("is-valid");
            $('#mes').selectpicker('refresh'); 
            $('#Mes1Val').hide();            
            var anio = $("#anio").val();
            var fecha = new Date();
            var anioAct = fecha.getFullYear();
            var optionsanio1 = [];
            optionsanio1.push("<option value=''>Seleccione</option>");
            for (var i = anioAct; i >= anio; i--) {
                var option;
                option = "<option value='" + i + "'>" + i + "</option>";
                optionsanio1.push(option);
            }
            $('#anio2.selectpicker').html(optionsanio1);
            $('#anio2.selectpicker').selectpicker('refresh');
            $('#anio2').prop("disabled", false);
            $('#anio2').selectpicker('refresh');

            $('#mes2').selectpicker('val', '');
            mesval = true;
        }
    });


    $('#anio2').change(function () {
        var anio2 = $("#anio2").val();
        if (anio2 === '') {
            $("#Anio2Val").addClass("invalid-feedback");
            $("#anio2").removeClass("is-valid");
            $("#anio2").addClass("is-invalid");
            $('#anio2').selectpicker('refresh');
            $('#Anio2Val').text('Por favor seleccione el año');
            $('#Anio2Val').show();

            $('#mes2').selectpicker('val', '');
            $('#mes2').change();
            $('#mes2').selectpicker('refresh');
            $('#mes2').prop("disabled", true);
            $('#mes2').selectpicker('refresh');  
            anio2val = false;
        }
        else {
            $("#anio2").removeClass("is-invalid");
            $("#anio2").addClass("is-valid");
            $('#anio2').selectpicker('refresh');
            $('#Anio2Val').hide();
            $('#mes2').prop("disabled", false);
            $('#mes2').selectpicker('refresh');
            var mesesPROPI = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
            var anio = $("#anio").val();
            if (anio === anio2) {
                var mes = $("#mes").val();
                var laposicion = 0;
                for (var i = 0; i < mesesPROPI.length; i++) {
                    if (mesesPROPI[i] === mes) {
                        laposicion = i;
                    }
                }
                var optionsanio1 = [];
                optionsanio1.push("<option value=''>Seleccione</option>");
                for (var x = laposicion + 1; x < mesesPROPI.length; x++) {
                    var option;
                    option = "<option value='" + mesesPROPI[x] + "'>" + mesesPROPI[x] + "</option>";
                    optionsanio1.push(option);
                }
                $('#mes2.selectpicker').html(optionsanio1);
                $('#mes2.selectpicker').selectpicker('refresh');
            }
            else {
                var optionsanio2 = [];
                optionsanio2.push("<option value=''>Seleccione</option>");
                for (var x1 = 0; x1 < mesesPROPI.length; x1++) {
                    var option1;
                    option1 = "<option value='" + mesesPROPI[x1] + "'>" + mesesPROPI[x1] + "</option>";
                    optionsanio2.push(option1);
                }
                $('#mes2.selectpicker').html(optionsanio2);
                $('#mes2.selectpicker').selectpicker('refresh');
            }
            anio2val = true;
        }
        
    });

    $('#mes2').change(function () {
        var mes2 = $("#mes2").val();
        if (mes2 === '') {
            $("#Mes2Val").addClass("invalid-feedback");
            $("#mes2").removeClass("is-valid");
            $("#mes2").addClass("is-invalid");
            $('#mes2').selectpicker('refresh');
            $('#Mes2Val').text('Por favor seleccione el mes');
            $('#Mes2Val').show();
            mes2val = false;
        }
        else {
            $("#mes2").removeClass("is-invalid");
            $("#mes2").addClass("is-valid");
            $('#mes2').selectpicker('refresh');
            $('#Mes2Val').hide();
            mes2val = true;
        }
    });

   $('#proyectosINEGI').change(function (){
       var proyecto = $("#proyectosINEGI").val();
       if (proyecto === '') {
           $("#proyectosINEGIval").addClass("invalid-feedback");
           $("#proyectosINEGI").removeClass("is-valid");
           $("#proyectosINEGI").addClass("is-invalid");
           $('#proyectosINEGIval').text('Por favor seleccione el proyecto');
           $('#proyectosINEGIval').show();
           proyectoval = false;
       }
       else {
           $("#proyectosINEGI").addClass("is-invalid");
           $("#proyectosINEGI").removeClass("is-valid");          
           $('#proyectosINEGIval').hide();
           proyectoval = true;
       }
    });
    
    const number4 = document.querySelector('.number4');
    function formatNumber4(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number4.addEventListener('keyup', (e4) => {
        const element4 = e4.target;
        const value4 = element4.value;
        element4.value = formatNumber4(value4);
    });

    $('#inflacion').keyup(function (event) {
        var inflacion = $("#inflacion").val();
        if (inflacion.length === 0) {
            $("#inflacionval").addClass("invalid-feedback");
            $("#inflacion").removeClass("is-valid");
            $("#inflacion").addClass("is-invalid");
            $('#inflacionval').text('Por favor ingrese la inflacion.');
            $('#inflacionval').show();
            inflacionval = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (inflacion.match(reg)) {
                if (inflacion >= 0.01 && inflacion <= 100.00) {
                    $("#inflacion").removeClass("is-invalid");
                    $("#inflacion").addClass("is-valid");
                    $('#inflacionval').hide();
                    inflacionval = true;
                }
                else {
                    $("#inflacion").removeClass("is-valid");
                    $("#inflacion").addClass("is-invalid");
                    $('#inflacionval').text('Por favor ingrese la inflacion mayor de 0.01 y menor 100.01');
                    $('#inflacionval').show();
                    $("#inflacion").val("");
                    inflacionval = false;
                }
            } else {
                $("#inflacionval").addClass("invalid-feedback");
                $("#inflacion").removeClass("is-valid");
                $("#inflacion").addClass("is-invalid");
                $('#inflacionval').text('Por favor ingrese mas digitos');
                $('#inflacionval').show();
                inflacionval = false;
            }
        }
    });

    const number5 = document.querySelector('.number5');
    function formatNumber5(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number5.addEventListener('keyup', (e5) => {
        const element5 = e5.target;
        const value5 = element5.value;
        element5.value = formatNumber5(value5);
    });

    $('#TPMI').keyup(function (event) {
        var TPMIV = $("#TPMI").val();
        if (TPMIV.length === 0) {
            $("#TPMIval").addClass("invalid-feedback");
            $("#TPMI").removeClass("is-valid");
            $("#TPMI").addClass("is-invalid");
            $('#TPMIval').text('Por favor ingrese la Tasa de Promedio Mensual.');
            $('#TPMIval').show();
            tasapromediomensual = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (TPMIV.match(reg)) {
                if (TPMIV >= 0.01 && TPMIV <= 100.00) {
                    $("#TPMI").removeClass("is-invalid");
                    $("#TPMI").addClass("is-valid");
                    $('#TPMIval').hide();
                    tasapromediomensual = true;
                }
                else {
                    $("#TPMI").removeClass("is-valid");
                    $("#TPMI").addClass("is-invalid");
                    $('#TPMIval').text('Por favor ingrese la Tasa de Promedio Mensual mayor de 0.01 y menor 100.01');
                    $('#TPMIval').show();
                    $("#TPMI").val("");
                    tasapromediomensual = false;
                }
            } else {
                $("#TPMIval").addClass("invalid-feedback");
                $("#TPMI").removeClass("is-valid");
                $("#TPMI").addClass("is-invalid");
                $('#TPMIval').text('Por favor ingrese mas digitos');
                $('#TPMIval').show();
                tasapromediomensual = false;
            }
        }
    });
    /*Validacion de campos en calculadora de INEGI antes de*/



    $('#saveINEGI').click(function () {
        var anio = $("#anio").val();
        var mes = $("#mes").val();
        var anio2 = $("#anio2").val();
        var mes2 = $("#mes2").val();
        var proyectos = $("#proyectosINEGI.selectpicker").val();
        var inflacion = $("#inflacion").val();
        var inMensual = $("#TPMI").val();



        if (inflacion != "" && inMensual != "" && proyectos.length > 0) {//inflacion != "" && inMensual != ""
            var array_inflacion = [];
            array_inflacion[0] = inflacion;
            array_inflacion[1] = inMensual;

          /*  var periodo = $("#periodoINEGI").val();

            //Diciembre 2018 a Marzo 2019
            periodo = periodo.trim();

            periodo = periodo.replace(/\s+/gi, ' ');

            arregloDeSubCadenas = periodo.split(" ");
            if (arregloDeSubCadenas.length == 5) {
                var mesI = arregloDeSubCadenas[0];
                var mesF = arregloDeSubCadenas[3];
                var mesesINEGI = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];
                var mesesPROPI = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                for (var x = 0; x < mesesINEGI.length; x++) {
                    if (mesI == mesesINEGI[x]) 
                        mesI = mesesPROPI[x];
                    if (mesF == mesesINEGI[x])
                        mesF = mesesPROPI[x];
                }
                arregloDeSubCadenas[0] = mesI;
                arregloDeSubCadenas[3] = mesF;
                periodo = arregloDeSubCadenas.toString();
                periodo = periodo.replace(/,/g, ' ');*/
                //periodo = periodo.trim();
                //GUardamos los datos en la tabla de indices
                $.ajax({
                    type: "POST",
                    url: "tasainflacion.aspx/guardar_inflacion",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ Periodo: periodo, Proyectos: proyectos, Inflaciones: array_inflacion }),
                    async: false,
                    success: function (result) {
                        console.log("resul " + resul);
                        var resul = result.d;
                        //console.log("-->" + resul);
                        if (resul == "OK") {
                            $('#alertSucces').show();
                            setTimeout(
                                function () {
                                    $("#alertSucces").hide();
                                }, 3000);
                            location.reload();
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
            else {
                $('#alertSDanger').show();
                setTimeout(
                    function () {
                        $("#alertSDanger").hide();
                    }, 3000);
            }
        }
    });
    //solo porcentaje
    $("body").on('keyup', ".porcen", function (event) {
        this.value = this.value.match(/\d{0,3}(\.\d{0,2})?/)[0];
    });
    /*Ejecucion de CALCULADORA INEGI*/  
});