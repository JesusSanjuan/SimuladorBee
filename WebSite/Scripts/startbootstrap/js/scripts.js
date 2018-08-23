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
                        option = "<option value=" + i + ">" + i + "</option>"
                    }
                    
                    options.push(option);
                }
                $('#cnperiodo').html(options);
                $('#cnperiodo').selectpicker('refresh');

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

     /****************************************/
    /*******SCRIPTS PARA CONTENT COSTOS***************/
    $('#cnperiod_c.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        cargar_cont_costos();
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
                    console.log(result.d);
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
                    //cargamos y refrescamos el select
                    $('#cnperiod_c').html(options);
                    $('#cnperiod_c').selectpicker('refresh');
                    //llaamos una funcion para crear la session de id_costo
                    crear_session_costo();

                    if (resultado[1].length > 0) {
                        $('#myTab li a:eq(' + resultado[1][ resultado[1].length - 1 ] + ')').removeClass('disabled');
                        $('#myTab li a:eq(' + resultado[1][ resultado[1].length - 1 ] + ')').tab('show');
                        $('#myTab li a:eq(' + resultado[1][ resultado[1].length - 1 ] + ')').addClass('active');
                    }
                    else if (resultado[1].length == 4) {
                        $('#myTab li a').addClass('disabled');
                    }
                    else {
                        $('#myTab li a:first').removeClass('disabled');
                        $('#myTab li a:first').tab('show');
                        $('#myTab li a:first').addClass('active');
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
    /****************************************/
    
    

});