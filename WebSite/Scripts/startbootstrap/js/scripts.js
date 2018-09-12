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


    $("#MainContent_nperiodo").val("1");
    /**Inicialización rangeslider.js**/
    $('input[type="range"]').rangeslider({
        polyfill: false,
        onInit: function () {
            this.output = $('<div class="range-output" />').insertAfter(this.$range).html(this.$element.val());
        },
        onSlide: function (position, value) {
            this.output.html(value);
            $("#MainContent_nperiodo").val(value);
        }
    });

    /**Inicialización selectpicker.js**/
    $('.selectpicker').selectpicker
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
        $("#amortTable").find('td:last').prev().prev().prev().prev().addClass('previous');
        $("#amortTable").find('td').eq(0).addClass('previous');
        $("#amortTable").find('td:last').prev().prev().prev().addClass('costo');
        $("#amortTable").find('td').eq(1).addClass('costo');
        $("#amortTable").find('td:last').prev().prev().addClass('porct');
        $("#amortTable").find('td').eq(2).addClass('porct');
        $("#amortTable").find('td:last').attr("data-editable", "false");
        $("#amortTable").find('td').eq(3).attr("data-editable", "false");
        $("#amortTable").find('td:last').prev().attr("data-editable", "false");
        $("#amortTable").editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    

    }
     /****************************************/
    /*******SCRIPTS PARA CONTENT COSTOS***************/
    var complete = false;
    $('#cnperiod_c.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        if (complete == false)
            cargar_cont_costos();
        else
            cargar_data_costo();
    });

    $('#cnperiod_c.selectpicker').change();

    function cargar_cont_costos() {
        if (id_proyecto !== "false") {
            $.ajax({
                type: "POST",
                url: "costos.aspx/getPeriodo",
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
                        complete = true;
                        $(".continuar").hide();
                        $(".actualizar").show();
                        $('#cnperiod_c').html(options);
                        $('#cnperiod_c').selectpicker('refresh');
                        $('#cnperiod_c.selectpicker').change();
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
                            $('#myTab li a:eq(' + resultado[1][resultado[1].length - 1] + ')').removeClass('disabled');
                            $('#myTab li a:eq(' + resultado[1][resultado[1].length - 1] + ')').tab('show');
                            $('#myTab li a:eq(' + resultado[1][resultado[1].length - 1] + ')').addClass('active');
                        }
                        
                        else {
                            $('#myTab li a:first').removeClass('disabled');
                            $('#myTab li a:first').tab('show');
                            $('#myTab li a:first').addClass('active');
                        }
                        $('#cnperiod_c').html(options);
                        $('#cnperiod_c').selectpicker('refresh');
                    }
                    //cargamos y refrescamos el select
                    
                    //llaamos una funcion para crear la session de id_costo
                    crear_session_costo();

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

    function crear_session_costo() {

        var periodo_select = $("#cnperiod_c").val();
        $.ajax({
            type: "POST",
            url: "costos.aspx/crear_session_costo",
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

    function cargar_data_costo() {
        if (id_proyecto !== "false") {
            var periodo_select = $("#cnperiod_c").val();
            $.ajax({
                type: "POST",
                url: "costos.aspx/get_data_costos",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ idproyecto: id_proyecto, periodSelect: periodo_select }),
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var table = $('#myTabContent').find('table').DataTable();
                    table.clear().draw();
                    //Tab Producción
                    var res = JSON.parse(resultado[1]);
                    var i, obj, param1, param2;
                    for (i = 0; i < res.length - 1; i++) {
                        obj = res[i];
                        param1 = obj["Concepto"];
                        param2 = obj["$ Costo"];
                        cargar_datatable_costos("costTable", param1, param2);
                    }
                    //Tab Ventas
                    var res2 = JSON.parse(resultado[2]);
                    for (i = 0; i < res2.length - 1; i++) {
                        obj = res2[i];
                        param1 = obj["Concepto"];
                        param2 = obj["$ Costo"];
                        cargar_datatable_costos("costTable2", param1, param2);
                    }
                    //Tab Admon
                    var res3 = JSON.parse(resultado[3]);
                    for (i = 0; i < res3.length - 1; i++) {
                        obj = res3[i];
                        param1 = obj["Concepto"];
                        param2 = obj["$ Costo"];
                        cargar_datatable_costos("costTable3", param1, param2);
                    }
                    //Tab Admon
                    var res4 = JSON.parse(resultado[4]);
                    for (i = 0; i < res4.length - 1; i++) {
                        obj = res4[i];
                        param1 = obj["Concepto"];
                        param2 = obj["$ Costo"];
                        cargar_datatable_costos("costTable4", param1, param2);
                    }


                    $('#myTab li a').removeClass('disabled');
                    $('#myTab li:first a').tab('show');
                    $("#myTab li:first a").addClass('active');
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

    function cargar_datatable_costos(table, camp1, camp2) {
        var t = $('#'+table+'').DataTable();
        t.row.add([
            camp1,
            camp2,
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([1, 'desc']).draw();
        //aplicamos lasa propiedades editable de las celdas
        $('#' + table + '').find('td:last').prev().prev().addClass('previous');
        $('#' + table + '').find('td:last').attr("data-editable", "false");
        $('#' + table + '').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");

    }
    /****************************************/
    
    

});