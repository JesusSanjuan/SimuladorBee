$(document).ready(function () {

    /*******SCRIPTS PARA CONTENT INDEX***************/
    //verificar si la session id_proyect existe 
    $.ajax({
        type: "POST",
        url: "Index.aspx/buscarID_proyect",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            if (data.d != "false") {

                $("#nameProject").text(data.d);
                //visualizamos el mensaje
                $(".alert").removeClass("d-none").addClass("d-block");
            }

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
    /**Inicialización selectpicker.js**/
    $('.selectpicker').selectpicker();
    /***Inicializando la Tabla de Mis proyectos****/
    $.ajax({
        type: "POST",
        url: "Index.aspx/getsource",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            //console.log(data.d);
            var registros = JSON.parse(data.d);
            $('#nproyect').text(registros.length);
            $('#tableProyect').DataTable({
                "aaData": registros,
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                }
            });

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

    /****cargar el proyecto****/
    $("body").on("click", ".cargar", function () {
        //obtenemos los datas
        var id = $(this).attr("data-id");

        var name = $(this).attr("data-name");
        console.log("id" + id + "-- nombre" + name);
        $("#nameProject").text(name);
        //visualizamos el mensaje
        $(".alert").removeClass("d-none").addClass("d-block");

        $.ajax({
            type: "POST",
            url: "Index.aspx/createSessionProyect",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ id_proyect: id, nam_proyect: name }),
            success: function (data) {
                console.log(data.d);
                if (typeof ID_Proyecto !== 'undefined') {

                    console.log("existee session --->" + ID_Proyecto);
                }
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

    });

    $("#valid1").hide();
    $("#valid2").hide();
    $("#valid3").hide();
    $("#valid4").hide();
    $("body").on('blur', "#Nombre_Proyecto", function () {

        if ($(this).val() == "") 
            $("#valid1").show();
        else 
            $("#valid1").hide();
   
    });

    $("body").on('input', "#nperiodo", function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
    $("body").on('blur', "#nperiodo", function () {
        if ($(this).val() == "")
            $("#valid2").show();
        else {
            $("#valid2").hide();
            
            if ($("#lapso").val() == "Años") {
                if ($(this).val() > 80) {
                    $("#valid3").html("El periodo debe sér máximo de 80 años");
                    $("#valid3").show();
                }
                else
                    $("#valid3").hide();
            }
            else if ($("#lapso").val() == "Meses") {
                if ($(this).val() > 300) {
                    $("#valid3").html("El periodo debe sér máximo de 300 meses");
                    $("#valid3").show();
                }
                else
                    $("#valid3").hide();
            }
                
        }

    });

    $("#Guardar_Proyecto").on('click', function () {
        var nproyecto = $("#Nombre_Proyecto").val();
        var lapso = $("#lapso").val();
        var nperiodo = $("#nperiodo").val();
        if (nproyecto != "" && nperiodo != "") {

            $.ajax({
                type: "POST",
                url: "Index.aspx/Guardar_ProyectoBtn",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ proyect: nproyecto, lapse: lapso, periodo: nperiodo }),
                success: function (result) {
                    location.reload();
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
            $("#valid1").show();
            $("#valid2").show();
        }

        
    });


    /****************************************/
    /*******SCRIPTS PARA CONTENT AMORTIZACION***************/
    //verificar si la session id_proyect existe 
    var id_proyecto;
    $.ajax({
        async: false,
        cache: false,
        type: "POST",
        url: "amortizacion.aspx/buscarID_proyect",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d != "false") {
                var data = JSON.parse(result.d);
                id_proyecto = data[0];
                //visualizamos el mensaje de succes
                $("#message").html("Proyecto <strong>¡" + data[1] + "!</strong> cargado...");
                $("#message").removeClass("d-none").addClass("d-block");
                $("#message").addClass("alert-success");
            }
            else {
                //visualizamos el mensaje de error
                $("#message").html("<strong>¡No hay proyecto cargado!</strong>");
                $("#message").removeClass("d-none").addClass("d-block");
                $("#message").addClass("alert-danger");
                id_proyecto = "false";
            }

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

    var completeC = false;
    $('#cnperiodo.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        if (completeC == true)
            cargar_data_amort();
    });


    /******Obteneer el numero de periodos******/
    if (id_proyecto !== "false") {
        $.ajax({
            type: "POST",
            url: "amortizacion.aspx/getPeriodo",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idProyecto: id_proyecto }),
            success: function (result) {
                var resultado = JSON.parse(result.d);
                var res_period = resultado[0][(resultado[0].length-1)];
                var nperiodo = (res_period).substring(0, (res_period).length - 1);
                // si es mensual o anual
                var periodo = (res_period).charAt((res_period).length - 1);
                
                $("#lapse").val(periodo);
                if (periodo === "M") {
                    $("#lapso").html("Mes");
                }
                else {
                    $("#lapso").html("Año");
                }

                var options = [];

                if ((resultado[0].length - 1) == nperiodo) {
                    for (i = 1; i <= nperiodo; i++) {
                        var option;
                        option = "<option value=" + i + ">" + i + "</option>";
                        options.push(option);
                    }
                    console.log("finalizado!!");
                    $('#cnperiodo').html(options);
                    $('#cnperiodo').selectpicker('refresh');
                    completeC = true;
                    $('#cnperiodo.selectpicker').change();
                }
                else {
                    var ban = 0;
                    for (i = 1; i <= nperiodo; i++) {
                        //Buscar que periodos ya estan ingresados
                        for (j = 0; j < resultado[0].length - 1; j++) {

                            if (i == resultado[0][j]) {
                                ban = 1;
                                break;
                            }
                            else {
                                ban = 0;
                            }

                        }
                        var option;
                        if (ban == 1) {
                            option = "<option value=" + i + " disabled>" + i + "</option>";
                        }
                        else {
                            option = "<option value=" + i + ">" + i + "</option>";
                        }

                        options.push(option);
                    }
                    $('#cnperiodo').html(options);
                    $('#cnperiodo').selectpicker('refresh');

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


    function cargar_data_amort() {
        if (id_proyecto !== "false") {
            var periodo_select = $("#cnperiodo").val();
            $.ajax({
                type: "POST",
                url: "amortizacion.aspx/get_data_amort",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ idproyecto: id_proyecto, periodSelect: periodo_select }),
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var table = $('#myTabContent2').find('table').DataTable();
                    table.clear().draw();
                    //Tab amortizacion
                    var res = JSON.parse(resultado[2]);
                    var i, obj, param1, param2, param3, param4;
                    for (i = 0; i < res.length - 1; i++) {
                        obj = res[i];
                        param1 = obj["Concepto"];
                        param2 = obj["$ Costo"];
                        param3 = obj["%"];
                        param4 = obj["Total"];
                        cargar_datatable_amort(param1, param2, param3, param4);
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
    }

    function cargar_datatable_amort (camp1, camp2, camp3, camp4) {
        var t = $('#amortTable').DataTable();
        t.row.add([
            camp1,
            camp2,
            camp3,
            camp4,
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([1, 'desc']).draw();
        //aplicamos lasa propiedades editable de las celdas
        $("#amortTable").find('td:nth-child(1)').addClass('previous');
        $("#amortTable").find('td:nth-child(2)').addClass('costo');
        $("#amortTable").find('td:nth-child(3)').addClass('porct');
        $("#amortTable").find('td:last').attr("data-editable", "false");
        $("#amortTable").find('td:nth-child(5)').attr("data-editable", "false");
        $("#amortTable").find('td:nth-child(4)').attr("data-editable", "false");  
        $("#amortTable").editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    
    }
     /****************************************/
    /*******SCRIPTS PARA CONTENT COSTOS***************/
    var complete = false;
    var controller = "costos.aspx";
    $('#cnperiod_c.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        if (complete == false)
            cargar_cont_c_g(controller, "cnperiod_c", "myTab");
        else
            get_data_c_g("", controller, "cnperiod_c", "myTab");
    });

    $('#cnperiod_c.selectpicker').change();

    //Funciones genericas para costos y gastos
    function cargar_cont_c_g(controller, select, Tab) {
        if (id_proyecto !== "false") {
            $.ajax({
                type: "POST",
                url: controller + "/getPeriodo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ idProyecto: id_proyecto }),
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var res_period = String(resultado[2]);
                    var nperiodo = (res_period).substring(0, (res_period).length - 1);
                    // si es mensual o anual
                    var periodo = (res_period).charAt((res_period).length - 1);
                    $("#lapse").val(periodo);
                    if (periodo === "M") {
                        $("#lapso").html("Mes");
                    }
                    else {
                        $("#lapso").html("Año");
                    }

                    var options = [];

                    if (resultado[0].length == nperiodo) {
                        for (i = 1; i <= nperiodo; i++) {
                            var option;
                            option = "<option value=" + i + ">" + i + "</option>";
                            options.push(option);
                        }
                        if (Tab == "myTab")
                            complete = true;
                        else
                            completeG = true;
                        $(".continuar").hide();
                        $(".actualizar").show();
                        $('#'+select+'').html(options);
                        $('#' + select + '').selectpicker('refresh');
                        $('#' + select + '').change();
                    }
                    else {
                       
                        var ban = 0;
                        for (i = 1; i <= nperiodo; i++) {
                            //Buscar que periodos ya estan ingresados
                            for (j = 0; j < resultado[0].length; j++) {
                                if (i == resultado[0][j]) {
                                    ban = 1;
                                    break;
                                }
                                else {
                                    ban = 0;
                                }

                            }
                            var option;
                            if (ban == 1) {
                                option = "<option value=" + i + " disabled>" + i + "</option>";
                            }
                            else {
                                option = "<option value=" + i + ">" + i + "</option>";
                            }

                            options.push(option);
                        }
                        if (resultado[1].length > 0) {
                            $('#'+Tab+' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').removeClass('disabled');
                            $('#'+ Tab +' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').tab('show');
                            $('#'+ Tab +' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').addClass('active');
                        }
                        
                        else {
                            $('#' + Tab +' li a:first').removeClass('disabled');
                            $('#' + Tab +' li a:first').tab('show');
                            $('#' + Tab +' li a:first').addClass('active');
                        }
                        $('#'+ select +'').html(options);
                        $('#'+ select +'').selectpicker('refresh');
                    }                    
                    //llaamos una funcion para crear la session de id_costo
                    crear_session_costo_gasto(select, controller);

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

    }

    function crear_session_costo_gasto(select, controller) {

        var periodo_select = $('#' + select + '').val();
        $.ajax({
            type: "POST",
            url: controller+"/crear_session",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idproyecto: id_proyecto, periodSelect: periodo_select }),
            success: function (result) {
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

    function get_data_c_g(ncontent, controller, select, Tab) {
        if (id_proyecto !== "false") {
            var periodo_select = $("#"+select+"").val();
            $.ajax({
                type: "POST",
                url: controller +"/get_data",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ idproyecto: id_proyecto, periodSelect: periodo_select }),
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var table = $('#myTabContent' + ncontent+'').find('table').DataTable();
                    table.clear().draw();
                    //variables dependiendo del content
                    var campo, prefix = "";
                    if (ncontent == "3") {
                        campo  = "$ Gasto";
                        prefix = "gast";
                    }
                    else {
                        campo  = "$ Costo";
                        prefix = "cost";
                    }
                    //Tab Producción
                    var res = JSON.parse(resultado[1]);

                    var i, obj, param1, param2, param3, param4, param5;
                    for (i = 0; i < res.length - 1; i++) {
                        obj = res[i];
                        param1 = obj["Concepto"];
                        param2 = obj["Tipo"];
                        param3 = obj["Cantidad"];
                        param4 = obj[campo + " Unitario"];
                        param5 = obj[campo + " Total"];
                        cargar_datatable_costos(prefix + "Table", param1, param2, param3, param4, param5);
                    }
                    //Tab Ventas
                    var res2 = JSON.parse(resultado[2]);
                    for (i = 0; i < res2.length - 1; i++) {
                        obj = res2[i];
                        param1 = obj["Concepto"];
                        param2 = obj["Tipo"];
                        param3 = obj["Cantidad"];
                        param4 = obj[campo + " Unitario"];
                        param5 = obj[campo + " Total"];
                        cargar_datatable_costos(prefix + "Table2", param1, param2, param3, param4, param5);
                    }
                    //Tab Admon
                    var res3 = JSON.parse(resultado[3]);
                    for (i = 0; i < res3.length - 1; i++) {
                        obj = res3[i];
                        param1 = obj["Concepto"];
                        param2 = obj["Tipo"];
                        param3 = obj["Cantidad"];
                        param4 = obj[campo + " Unitario"];
                        param5 = obj[campo + " Total"];
                        cargar_datatable_costos(prefix + "Table3", param1, param2, param3, param4, param5);
                    }
                    //Tab Admon
                    var res4 = JSON.parse(resultado[4]);
                    for (i = 0; i < res4.length - 1; i++) {
                        obj = res4[i];
                        param1 = obj["Concepto"];
                        param2 = obj["Tipo"];
                        param3 = obj["Cantidad"];
                        param4 = obj[campo + " Unitario"];
                        param5 = obj[campo + " Total"];
                        cargar_datatable_costos(prefix + "Table4", param1, param2, param3, param4, param5);
                    }


                    $('#'+Tab+' li a').removeClass('disabled');
                    $('#'+Tab+' li:first a').tab('show');
                    $('#' + Tab + ' li:first a').addClass('active');

                    //mensaje de proyección
                    $("#warning").html("Los precios son proyectados con una inflación de <strong>" + resultado[5] + " %</strong>");


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
    }
    //funcion generica para costos y gastos
    function cargar_datatable_costos(table, camp1, camp2, camp3, camp4, camp5) {
        var t = $('#'+table+'').DataTable();
        t.row.add([
            camp1,
            camp2,
            camp3,
            camp4,
            camp5,
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([3, 'desc']).draw();
        //aplicamos lasa propiedades editable de las celdas
        $('#' + table + '').find('td:nth-child(1)').addClass('previous');
        $('#' + table + '').find('td:nth-child(2)').addClass('tipo');
        $('#' + table + '').find('td:nth-child(2)').attr("data-editable", "false");
        $('#' + table + '').find('td:nth-child(4)').addClass('cunit');
        $('#' + table + '').find('td:nth-child(5)').attr("data-editable", "false");
        $('#' + table + '').find('td:nth-child(6)').attr("data-editable", "false");


        $('#' + table + '').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");

        var selector = $('#' + table + '').parents('.tab-pane').attr("id");
        $('#' + selector).find('.total_ant').val($('#' + table + '').find('.total').text());

      
    }
    /****************************************/
    
    /*******SCRIPTS PARA CONTENT Gastos***************/
    var controller2 = "gastos.aspx";
    var completeG = false;
    $('#cnperiod_g.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        if (completeG == false)
            cargar_cont_c_g(controller2, "cnperiod_g", "myTab_g");
        else
            get_data_c_g("3", controller2, "cnperiod_g", "myTab_g");
    });

    $('#cnperiod_g.selectpicker').change();

    /****************************************/

});