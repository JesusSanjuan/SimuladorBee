$(document).ready(function () {

/*******SCRIPTS PARA CONTENT INDEX***********************/
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
            var registros = JSON.parse(data.d);
            $('#nproyect').text(registros.length);
            $('#tableProyect').DataTable({
                columnDefs: [
                    { "width": "50%", "targets": 0 },
                    { "width": "47%", "targets": 1 },
                    { "width": "1%", "targets": 2 },
                    { "width": "1%", "targets": 3 },
                    { "width": "1%", "targets": 4 }
                ],
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
                if (typeof ID_Proyecto !== 'undefined') {
                    //console.log("existee session --->" + ID_Proyecto);
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

    /****Eliminar proyecto****/
    $("body").on("click", ".eliminar", function () {
        //obtenemos los datas
        var id = $(this).attr("data-id");
        var name = $(this).attr("data-name");
        $.ajax({
            type: "POST",
            url: "Index.aspx/Borrarproyecto",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ id_proyect: id, nam_proyect: name }),
            success: function (data) {
                $('#eliminarproyecto').modal({ show: true });
                if (data.d === "succes") {
                    $('#imgmodal').html('<img src="../multimedia/correcto.gif" class="img-fluid" width="100" height="100" alt="Responsive image"/>');
                    $('#txtmodatitle').html("<strong style='vertical - align: middle;'> Borrado exitoso</strong>");
                    $('#texmodal').html("<strong style='vertical - align: middle;'> El proyecto se borro exitosamente (Aun no realiza)</strong>");
                } else {
                    $('#imgmodal').html('<img src="../multimedia/alerta.gif" class="img-fluid" width="100" height="100" alt="Responsive image"/>');
                    $('#txtmodatitle').html("<strong style='vertical - align: middle;'>Error al borrar </strong>");
                    $('#texmodal').html("<strong style='vertical - align: middle;'> El proyecto no se pudo borrar, intente nuevamente </strong>");
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

    $("body").on('blur', "#Nombre_Proyecto", function () {
        if ($(this).val() === "") {
            $("#valid1").show();
        }
        else {
            $("#valid1").hide();
        }
    });

    var Nombre = false, Nombre1 = false, N = false, N1 = false, Selectv = false, Selectv1 = false;
/*Primer campo*/
    $('#Nombre_Proyecto').keyup(function (event) {
        var NAME = $("#Nombre_Proyecto").val();
        var reg = /^[A-Za-z0-9\s]+$/g;
        if (NAME.match(reg)) {
            if (NAME.length <= 4) {
                $("#valid1").addClass("invalid-feedback");
                $("#Nombre_Proyecto").removeClass("is-valid");
                $("#Nombre_Proyecto").addClass("is-invalid");
                $('#valid1').text('Debe asignarle un nombre al proyecto de mas de 4 caracteres.');
                $('#valid1').show();
                Nombre = false;
            } else {
          
                    $("#Nombre_Proyecto").removeClass("is-invalid");
                    $("#Nombre_Proyecto").addClass("is-valid");
                    $('#valid1').hide();
                    Nombre = true;            
            }
        } else {
            $("#valid1").addClass("invalid-feedback");
            $("#Nombre_Proyecto").removeClass("is-valid");
            $("#Nombre_Proyecto").addClass("is-invalid");
            $('#valid1').text('Por favor ingrese un formato valido para el nombre del proyecto');
            $('#valid1').show();
            $("#Nombre_Proyecto").val("");
            Nombre = false;
        }
    });
/*Primer campo*/
/*Segundo y Tercer campo*/
    $("#select").change(function () {
        var valor = $("#select").val();
        switch (valor) {
            case "1":
                $("#n").css("cursor", "pointer");
                $("#n").removeAttr('disabled');
                $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
                $("#n").val('');
                $('#n').attr('data-original-title', "Toma en cuenta!");
                $('#n').attr('data-content', "Solo se permitira ingresar la cantidad de 1 a 600 meses");
                $("#n").popover('update');
                $("#n").popover("show");
                $('#selectval').hide();
                $("#select").addClass("is-invalid");
                $("#select").removeClass("is-valid");
                Selectv = true;
                break;
            case "2":
                $("#n").css("cursor", "pointer");
                $("#n").removeAttr('disabled');
                $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
                $("#n").val('');
                $('#n').attr('data-original-title', "Toma en cuenta!");
                $('#n').attr('data-content', "Solo se permitira ingresar la cantidad  de 1 a 99 años");
                $("#n").popover('update');
                $("#n").popover("show");
                $('#selectval').hide();
                $("#select").addClass("is-invalid");
                $("#select").removeClass("is-valid");
                Selectv = true;
                break;
            default:
                $("#n").css("cursor", "default");
                $("#n").popover("hide");
                $("#n").attr('disabled', 'disabled');
                $("#n").attr("placeholder", "Seleccione primero el tipo de plazo");
                $("#n").val('');
                $("#selectval").addClass("invalid-feedback");
                $("#select").removeClass("is-valid");
                $("#select").addClass("is-invalid");
                $('#selectval').text('Por favor seleccione un tipo de plazo');
                $('#selectval').show();
                Selectv = false;
                break;
        }
        $('#nval').hide();
        $("#n").focus();
        $("#n").removeClass("is-invalid");
        $("#n").removeClass("is-valid");
    });

    var validacion;
    $('#n').keyup(function (event) {       
        N = false;
        var valor = $("#select").val();
        var n = $("#n").val();
        var tipo;

        switch (valor) {
            case "1":
                tipo = "meses";
                break;
            case "2":
                tipo = "años";
                break;
            default:
                break;
        }
        if (n.length === 0) {
            $("#nval").addClass("invalid-feedback");
            $("#n").removeClass("is-valid");
            $("#n").addClass("is-invalid");
            $('#nval').text('Por favor ingrese el plazo en ' + tipo);
            $('#nval').show();
        } else {
            $("#n").removeClass("is-invalid");
            $("#n").addClass("is-valid");
            $('#nval').hide();
            N = true;
        }
        switch (valor) {
            case "1":
                if (n.length === 0) {
                    $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
                    $('#n').attr('data-original-title', "Toma en cuenta!");
                    $('#n').attr('data-content', "Solo se permitira ingresar la cantidad de 1 a 600 meses");
                    $("#n").popover('update');
                    $("#n").popover("show");
                } else {
                    if (n < 601) {
                        $('#n').attr('data-original-title', "De meses años");
                        var anios = n / 12;
                        $('#n').attr('data-content', "Los meses ingresados son equivalentes en años a: " + anios);
                        $("#n").popover('update');
                        $("#n").popover("show");
                    }
                    else {
                        $('#n').attr('data-original-title', "Verifique..");
                        $('#n').attr('data-content', "Unicamente se puede ingresar la cantidad de 1 a 600 meses (50 años)");
                        $("#n").popover('update');
                        $("#n").popover("show");
                        $("#n").removeClass("is-valid");
                        $("#n").addClass("is-invalid");
                        $('#nval').text('Por favor ingrese el plazo ' + tipo);
                        $('#nval').show();
                        $("#n").val("");
                    }
                }
                break;
            case "2":
                validacion = /^([0-9]{3,})$/;
                $("#n").val(formatNumber5(n));
                if (validacion.test(n) === true) {
                    $('#n').attr('data-original-title', "Verifique..");
                    $('#n').attr('data-content', "Unicamente se puede ingresar la cantidad de 1 a 99 años");
                    $("#n").popover('update');
                    $("#n").removeClass("is-valid");
                    $("#n").addClass("is-invalid");
                    $('#nval').text('Por favor ingrese el plazo ' + tipo);
                    $('#nval').show();
                    $("#n").popover("show");
                }
                break;
            default:
                break;
        }
    });
    function formatNumber5(n) {
        return n.replace(/\D/g, "")
            .replace(validacion, "");
    }
    $("#n").blur(function () {
        $("#n").popover("hide");
    });
/*Segundo y Tercer campo*/
    $("#Guardar_Proyecto").on('click', function () {
        var nproyecto = $("#Nombre_Proyecto").val();
        var lapso = $("#select").val();
        var nperiodo = $("#n").val();
        if (nproyecto.length === 0) {
            $("#valid1").addClass("invalid-feedback");
            $("#Nombre_Proyecto").removeClass("is-valid");
            $("#Nombre_Proyecto").addClass("is-invalid");
            $('#valid1').text('Debe asignarle un nombre al proyecto de mas de 4 caracteres.');
            $('#valid1').show();
            Nombre1 = false;
        } else {
            Nombre1 = true;
        }

        if (lapso === "") {
            $("#selectval").addClass("invalid-feedback");
            $("#select").removeClass("is-valid");
            $("#select").addClass("is-invalid");
            $('#selectval').text('Por favor seleccione un tipo de plazo');
            $('#selectval').show();
            Selectv1 = false;
        } else {
            Selectv1 = true;
        }

        if (nperiodo.length === 0) {
            $("#nval").addClass("invalid-feedback");
            $("#n").removeClass("is-valid");
            $("#n").addClass("is-invalid");
            $('#nval').text('Por favor ingrese el plazo');
            $('#nval').show();
            N1 = false;
        } else {
            N1 = true;
        } 
        if (Nombre === true && Nombre1 === true && N === true && N1 === true && Selectv === true && Selectv1 === true) {
            if (lapso === "1") {
                lapso = "Meses";
            }
            else {
                lapso = "Años";
            }
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
    });
    /*******SCRIPTS PARA CONTENT INDEX***********************/


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
                var res_period = resultado[0][(resultado[0].length - 1)];
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

                            if (i === resultado[0][j]) {
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

    function cargar_datatable_amort(camp1, camp2, camp3, camp4) {
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
        if (complete === false)
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
                        if (Tab === "myTab")
                            complete = true;
                        else
                            completeG = true;
                        $(".continuar").hide();
                        $(".actualizar").show();
                        $('#' + select + '').html(options);
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
                            if (ban === 1) {
                                option = "<option value=" + i + " disabled>" + i + "</option>";
                            }
                            else {
                                option = "<option value=" + i + ">" + i + "</option>";
                            }

                            options.push(option);
                        }
                        if (resultado[1].length > 0) {
                            $('#' + Tab + ' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').removeClass('disabled');
                            $('#' + Tab + ' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').tab('show');
                            $('#' + Tab + ' li a:eq(' + resultado[1][resultado[1].length - 1] + ')').addClass('active');
                        }

                        else {
                            $('#' + Tab + ' li a:first').removeClass('disabled');
                            $('#' + Tab + ' li a:first').tab('show');
                            $('#' + Tab + ' li a:first').addClass('active');
                        }
                        $('#' + select + '').html(options);
                        $('#' + select + '').selectpicker('refresh');
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
            url: controller + "/crear_session",
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
            var periodo_select = $("#" + select + "").val();
            $.ajax({
                type: "POST",
                url: controller + "/get_data",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({ idproyecto: id_proyecto, periodSelect: periodo_select }),
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var table = $('#myTabContent' + ncontent + '').find('table').DataTable();
                    table.clear().draw();
                    //variables dependiendo del content
                    var campo, prefix = "";
                    if (ncontent === "3") {
                        campo = "$ Gasto";
                        prefix = "gast";
                    }
                    else {
                        campo = "$ Costo";
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


                    $('#' + Tab + ' li a').removeClass('disabled');
                    $('#' + Tab + ' li:first a').tab('show');
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
        var t = $('#' + table + '').DataTable();
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
        if (completeG === false)
            cargar_cont_c_g(controller2, "cnperiod_g", "myTab_g");
        else
            get_data_c_g("3", controller2, "cnperiod_g", "myTab_g");
    });

    $('#cnperiod_g.selectpicker').change();

    /****************************************/

    /*********** SCRIPTS PARA EL CONTENT PUNTO DE EQUILIBRIO ********/
    var pathname = window.location.pathname;

    if (id_proyecto !== "false" && pathname ==="/Simulador/puntoequilibrio") {
        
        $.ajax({
            type: "POST",
            url: "puntoequilibrio.aspx/get_costos_fijosT",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idProyecto: id_proyecto }),
            success: function (result) {
                var resultado = JSON.parse(result.d);
                var sumT = 0;
                for (var i = 0; i < resultado.length; i++) {
                    for (var j = 0; j < resultado[i].length; j++) {
                        var res = JSON.parse(resultado[i][j]);
                        for (var k = 0; k < res.length; k++) {
                            var obj = res[k];
                            if (obj["Tipo"] === "Fijo") {
                                sumT = parseFloat(sumT) + parseFloat(obj["$ Costo Total"]);
                            }
                        }
                    }
                }
                $("#costosFijos").val(sumT);
                $("#costosFijos2").val(sumT);
                $("#savePES").removeClass("invisible");

            },
            error: function (result) {
                console.log(result.responseText);
            }

        }).done(function (data) {
            //console.log(data);
        }).fail(function (data) {
            console.log("Error: " + data);
            });

        $.ajax({
            type: "POST",
            url: "puntoequilibrio.aspx/get_punto_equilibrio",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idProyecto: id_proyecto }),
            success: function (result) {
                var resultado = JSON.parse(result.d);

                if (resultado.length > 0)
                {
                    var precio_VU = resultado[0];
                    var costo_VU = resultado[1];
                    var PE_unidades = resultado[2];
                    var precio_V = resultado[3];
                    var costo_V = resultado[4];
                    var PE_pesos = resultado[5];
                    $("#precioVU").val(create_format_coin(precio_VU));
                    $("#costoVU").val(create_format_coin(costo_VU));
                    $("#PEU").val(create_format_coin(PE_unidades));
                    $("#precioV").val(create_format_coin(precio_V));
                    $("#costoV").val(create_format_coin(costo_V));
                    $("#PEP").val(create_format_coin(PE_pesos));
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


        $("#messageWarning").html("Datos del último cálculo de Punto Equilibrio registrado");
        $("#messageWarning").removeClass("d-none").addClass("d-block");
        
    }

    var costos_fijos0 = false, costos_fijos1 = false, precio0 = false, precio1 = false, costoV0 = false,costoV1 = false;
/**********Validacion Costo fijo */
    const number = document.querySelector('.number');
    function formatNumber(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber(value);
    });

    $('#costosFijos').keyup(function (event) {
        var Costosfijos = $("#costosFijos").val();
        if (Costosfijos.length === 0) {            
            $("#costosFijosval").addClass("invalid-feedback");
            $("#costosFijos").removeClass("is-valid");
            $("#costosFijos").addClass("is-invalid");
            $('#costosFijosval').text('Por favor ingrese el costo fijo.');
            $('#costosFijosval').show();
            costos_fijos0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (Costosfijos.match(reg)) {
                $("#costosFijos").removeClass("is-invalid");
                $("#costosFijos").addClass("is-valid");
                $('#costosFijosval').hide();
                costos_fijos0 = true;
            } else {
                $("#costosFijosval").addClass("invalid-feedback");
                $("#costosFijos").removeClass("is-valid");
                $("#costosFijos").addClass("is-invalid");
                $('#costosFijosval').text('Por favor ingrese mas digitos');
                $('#costosFijosval').show();
                costos_fijos0 = false;
            }           
        }
    });
/**********Validacion Costo fijo */
/**********Validacion precio venta por unidad */
    const number2 = document.querySelector('.number2');
    function formatNumber2(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number2.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber2(value);
    });

    $('#precioVU').keyup(function (event) {
        var precioVU = $("#precioVU").val();
        if (precioVU.length === 0) {
            $("#precioVUval").addClass("invalid-feedback");
            $("#precioVU").removeClass("is-valid");
            $("#precioVU").addClass("is-invalid");
            $('#precioVUval').text('Por favor ingrese el precio de venta por unidad.');
            $('#precioVUval').show();
            precio0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (precioVU.match(reg)) {
                $("#precioVU").removeClass("is-invalid");
                $("#precioVU").addClass("is-valid");
                $('#precioVUsval').hide();
                precio0 = true;
            } else {
                $("#precioVUval").addClass("invalid-feedback");
                $("#precioVU").removeClass("is-valid");
                $("#precioVU").addClass("is-invalid");
                $('#precioVUval').text('Por favor ingrese mas digitos');
                $('#precioVUval').show();
                precio0 = false;
            }  
        }
    });
/**********Validacion precio venta por unidad */
/**********Validacion del costo variale por unidad */
    const number3 = document.querySelector('.number3');
    function formatNumber3(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number3.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber3(value);
    });

    $('#costoVU').keyup(function (event) {
        var costoVU = $("#costoVU").val();
        if (costoVU.length === 0) {
            $("#costoVUval").addClass("invalid-feedback");
            $("#costoVU").removeClass("is-valid");
            $("#costoVU").addClass("is-invalid");
            $('#costoVUval').text('Por favor ingrese el costo variable por unidad.');
            $('#costoVUval').show();
            costoV0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (costoVU.match(reg)) {
                $("#costoVU").removeClass("is-invalid");
                $("#costoVU").addClass("is-valid");
                $('#costoVval').hide();
                costoV0 = true;
            } else {
                $("#costoVUval").addClass("invalid-feedback");
                $("#costoVU").removeClass("is-valid");
                $("#costoVU").addClass("is-invalid");
                $('#costoVUval').text('Por favor ingrese mas digitos');
                $('#costoVUval').show();
                costoV0 = false;
            }             
        }
    });
/**********Validacion del costo variale por unidad */
    $("#calc_PEU").on('click', function () {   

        var costos_fijos = $("#costosFijos").val();
        var precio = $("#precioVU").val();
        var costoV = $("#costoVU").val();

    /**********Validacion Costo fijo */
        if (costos_fijos.length === 0) {
            $("#costosFijosval").addClass("invalid-feedback");
            $("#costosFijos").removeClass("is-valid");
            $("#costosFijos").addClass("is-invalid");
            $('#costosFijosval').text('Por favor ingrese el costo fijo.');
            $('#costosFijosval').show();
            costos_fijos1 = false;
        } else {
            costos_fijos1 = true;
        }
    /**********Validacion Costo fijo */
    /**********Validacion precio de venta por unidad */
        if (precio.length === 0) {
            $("#precioVUval").addClass("invalid-feedback");
            $("#precioVU").removeClass("is-valid");
            $("#precioVU").addClass("is-invalid");
            $('#precioVUval').text('Por favor ingrese el precio de venta por unidad.');
            $('#precioVUval').show();
            precio1 = false;
        } else {
            precio1 = true;
        }
    /**********Validacion precio de venta por unidad */
    /**********Validacion Costo variable por unidad */
        if (costoV.length === 0) {
            $("#costoVUval").addClass("invalid-feedback");
            $("#costoVU").removeClass("is-valid");
            $("#costoVU").addClass("is-invalid");
            $('#costoVUval').text('Por favor ingrese el costo varible por unidad.');
            $('#costoVUval').show();
            costoV1 = false;
        } else {
            costoV1 = true;
        }
    /**********Validacion Costo variable por unidad */
        if (costos_fijos0 === true && costos_fijos1 === true && precio0 === true && precio1 === true && costoV0 === true && costoV1 === true) {
            costos_fijos = remove_format_coin(costos_fijos);
            precio = remove_format_coin(precio);
            costoV = remove_format_coin(costoV);

            var punto_equilibrio = parseFloat(costos_fijos) / (parseFloat(precio) - parseFloat(costoV));
            $('#PEU').val(create_format_coin(punto_equilibrio));
        }
    });
    $("#calc_PEP").on('click', function () {
        var costos_fijos = ($("#costosFijos2").val());
        var precio = $("#precioV").val();
        var costoV = $("#costoV").val();

        if (costos_fijos.length === 0) {
            $("costosFijos2val").addClass("invalid-feedback");
            $("#costosFijos2").removeClass("is-valid");
            $("#costosFijos2").addClass("is-invalid");
            $('#costosFijos2val').text('Por favor ingrese el costo fijo.');
            $('#costosFijos2val').show();
            costos_fijos3 = false;
        } else {
            costos_fijos3 = true;
        }

        if (precio.length === 0) {
            $("#precioVval").addClass("invalid-feedback");
            $("#precioV").removeClass("is-valid");
            $("#precioV").addClass("is-invalid");
            $('#precioVval').text('Por favor ingrese el precio de venta.');
            $('#precioVval').show();
            precio3 = false;
        } else {
            precio3 = true;
        }

        if (costoV.length === 0) {
            $("#costoVval").addClass("invalid-feedback");
            $("#costoV").removeClass("is-valid");
            $("#costoV").addClass("is-invalid");
            $('#costoVval').text('Por favor ingrese el costo varible por unidad.');
            $('#costoVval').show();
            costoV3 = false;
        } else {
            costoV3 = true;
        }


        if (costos_fijos != "" && precio != "" && costoV != "") {
            costos_fijos = remove_format_coin(costos_fijos);
            precio = remove_format_coin(precio);
            costoV = remove_format_coin(costoV);

            var punto_equilibrio = parseFloat(costos_fijos) / (parseFloat(precio) - parseFloat(costoV));
            $('#PEP').val(create_format_coin(punto_equilibrio));
        }

    });

    $("#savePES").on('click', function () {
        var PE_unidades = $("#PEU").val();
        var PE_pesos = $("#PEP").val();
        if (PE_unidades != "" && PE_pesos != "") {

            var costos_fijos = remove_format_coin($("#costosFijos").val());
            var precio_venta_unidad = remove_format_coin($("#precioVU").val());
            var costo_variable_unidad = remove_format_coin($("#costoVU").val());
            PE_unidades = remove_format_coin(PE_unidades);
            var precio_venta = remove_format_coin($("#precioV").val());
            var costo_venta = remove_format_coin($("#costoV").val());
            PE_pesos = remove_format_coin(PE_pesos);

            $.ajax({
                type: "POST",
                url: "puntoequilibrio.aspx/guardar_PE",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({
                    idProyecto: id_proyecto,
                    costosFijos: costos_fijos,
                    precio_VU: precio_venta_unidad,
                    costo_variable_unidad: costo_variable_unidad,
                    punto_equilibrio_U: PE_unidades,
                    precio_V: precio_venta,
                    costo_V: costo_venta,
                    punto_equilibrio_P: PE_pesos
                }),
                success: function (result) {
                    var resultado = (result.d);
                    if (resultado === "OK") {
                        $("#project").html($("#message").find("strong").html());
                        $('#succesModal').modal('show');
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
    $('#succesModal').on('hidden.bs.modal', function () {
        location.reload();
    });




    /************************/

    $("body").on('keyup', ".moneda", function (event) {
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });

    });

    function remove_format_coin(cifra) {
        return parseFloat(cifra.replace(',', ""));
    }
    function create_format_coin(cifra) {
        var c = parseFloat(cifra);
        return c.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

});