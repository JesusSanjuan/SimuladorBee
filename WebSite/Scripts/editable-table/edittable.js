$(document).ready(function () {
    $('#myTabContent, #myTabContent2, #myTabContent3').find('table').DataTable({
        'columnDefs': [
            { "width": "45%", "targets" : 0 },
            { "width": "21%", "targets" : 1 },
            { "width": "2%", "targets"  : 2 },
            { "width": "15%", "targets" : 3 },
            { "width": "15%", "targets" : 4 },
            { "width": "2%", "targets"  : 5 }
        ],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        }
    });

    $('#myTabContent2a').find('table').DataTable({
        'columnDefs':  [{ "width": "65%", "targets": 0 },
                        { "width": "15%", "targets": 1 },
                        { "width": "3%", "targets": 2 },
                        { "width": "15%", "targets": 3 },
                        { "width": "2%", "targets": 4 }],
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        }
    });

    /****************TABLAS COSTOS Y GASTOS****************/
    // Automatically add a first row of data (Genérico para  las tablas que costos y gastos)
    $('.add_row').on('click', function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();
        t.row.add([
            '',
            'Fijo',
            '1',
            '0',
            '0',
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([3, 'desc']).draw();
        //refrescos libreria selectpicker
        $('.tipoSelect').selectpicker();
        //aplicamos lasa propiedades editable de las celdas
        $('#' + selector).find('table').find('td:nth-child(1)').addClass('previous');
        $('#' + selector).find('table').find('td:nth-child(2)').addClass('tipo');
        $('#' + selector).find('table').find('td:nth-child(2)').attr("data-editable", "false");
        $('#' + selector).find('table').find('td:nth-child(4)').addClass('cunit');
        $('#' + selector).find('table').find('td:nth-child(5)').attr("data-editable", "false");
        $('#' + selector).find('table').find('td:nth-child(6)').attr("data-editable", "false");

        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");

    });
    // función que ordena descendentemente los datos(costos, gastos) ingresados automaicamente
    $("body").on("change", "#myTabContent table td, #myTabContent3 table td", function (evt, newValue) {

        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();

        var clase = String($(this).attr("class"));
        $(".na").html("");
        if (clase === "tipo") {
            //$(this).html('<select class="selectpicker show-tick tipoSelect"><option>Fijo</option><option> Variable</option></select >');
        }
        else {
            t.cell(this).data(newValue).draw();
            t.order([4, 'desc']).draw();

        }

        //CALCULAMOS la multiplicacion DEL COSTO y GASTO
        var rowIdx = t.cell(this).index().row;
        var data = t.row(rowIdx).data();

        if (data[2] != "" && data[3] != "") {
            var costoTotal = (data[2] * data[3]);
            t.cell(rowIdx, 4).data(costoTotal).draw();
            t.order([4, 'desc']).draw();
        }

        var column = t.column(4);
        $(column.footer()).html(
            column.data().map(parseFloat).reduce(function (a, b) {
                return a + b;
            })
        );

    });
    /***********evento de click en td Tipo*/
    function tdClicks() {
        var x = "", y = "";
        $("body").on("click", "#myTabContent table .tipo, #myTabContent3 table .tipo", function () {
           /**Agregamos la clase tipo a todos los td(2), acciones para el edit <select>******/
            $("#myTabContent table tbody tr td:nth-child(2), #myTabContent3 table tbody tr td:nth-child(2)").addClass('tipo');
            $('.tipoSelect').change();
            /**Agregamos la clase tipo a todos los td(2), acciones para el edit <select>******/

            $(this).removeClass('tipo');
            var OriginalContent = $(this).text();
            //console.log('OriginalContent-->' + OriginalContent);
            $(this).html('<select name="selValue" class="selectpicker show-tick tipoSelect"><option value="Fijo">Fijo</option><option value="Variable"> Variable</option></select >');
            //refrescamos libreria selectpicker
            $('.tipoSelect').selectpicker();
            $('select[name=selValue]').val(OriginalContent);
            $('.tipoSelect').selectpicker('refresh');

        });
    }

    tdClicks();
    //eventos de tipoSelect
    $("body").on("change", ".selectpicker.tipoSelect", function (e) {
        //buscamos el selector tabla
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();

        var selectorTD = $(this).parents('td');
        t.cell(selectorTD).data(this.value).draw();
        selectorTD.addClass("tipo");

    });

    


    /****** desactivacion de pestañas **/
    $('#myTab li a').addClass('disabled');
    $('#myTab_g li a').addClass('disabled');

    $("#costo_update").hide();
    $("#gasto_update").hide();
    //evento para avanzar en las pestañas (navs)
    $("body").on("click", ".continuar", function () {
        /**acciones para enviar correctamente la tabla****/
        $("#myTabContent table tbody tr td:nth-child(2), #myTabContent3 table tbody tr td:nth-child(2)").addClass('tipo');
        $('.tipoSelect').change();
        /**acciones para enviar correctamente la tabla****/
        var selector = $(this).parents('.tab-pane').attr("id");
        $(".modal-content #selector").val(selector);
        $('#Continuacion').modal({ show: true });

    });

    //funcion para GUARDAR DATOS de COSTOS
    $("body").on("click", "#costo_continuar", function () {
        var nav = $('#myTab li a.active').attr('id');
        if (nav == "NCostos4") {
            //llenamos el select de inflacion
            $.ajax({
                type: "POST",
                url: "costos.aspx/getInflacion",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var row;
                    var options = [];
                    for (var i = 0; i < resultado.length; i++) {
                        row = resultado[i];
                        var option;
                        var tipo = row[2];
                        switch (tipo)
                        {
                            case "Inf_acumulada":
                                tipo = "Inflación acumulada";
                                break;
                            case "Inf_prom_mensual":
                                tipo = "Inflación mensual";
                                break;
                        }
                        var value = parseFloat((parseFloat(row[1])).toFixed(15));
                        option = "<option data-tipo='" + tipo + "' data-id=" + row[0] + " data-periodo='" + row[3] + "' value=" + value + ">" + value + "</option>";
                        options.push(option);
                    }
                    $('#select_inflacion').html(options);
                    $('#select_inflacion').selectpicker('refresh');
                    $('#select_inflacion.selectpicker').change();
                    //location.reload();
                },
                error: function (result) {
                    console.log(result.responseText);
                }

            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });

            $("#selectInflacion").modal({ show: true });
        }
        else {
            guardar_datos("cnperiod_c", "myTab", "costos.aspx", "myTabContent", 0);
        }
    });
    $("body").on("click", "#gasto_continuar", function () {
        var nav = $('#myTab_g li a.active').attr('id');
        console.log("nav" + nav);
        if (nav == "NGastos4") {
            //llenamos el select de inflacion
            $.ajax({
                type: "POST",
                url: "gastos.aspx/getInflacion",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (result) {
                    var resultado = JSON.parse(result.d);
                    var row;
                    var options = [];
                    for (var i = 0; i < resultado.length; i++) {
                        row = resultado[i];
                        var option;
                        var tipo = row[2];
                        switch (tipo) {
                            case "Inf_acumulada":
                                tipo = "Inflación acumulada";
                                break;
                            case "Inf_prom_mensual":
                                tipo = "Inflación mensual";
                                break;
                        }
                        var value = parseFloat((parseFloat(row[1])).toFixed(15));
                        option = "<option data-tipo='" + tipo + "' data-id=" + row[0] + " data-periodo='" + row[3] + "' value=" + value + ">" + value + "</option>";
                        options.push(option);
                    }
                    $('#select_inflacion').html(options);
                    $('#select_inflacion').selectpicker('refresh');
                    $('#select_inflacion.selectpicker').change();
                    //location.reload();
                },
                error: function (result) {
                    console.log(result.responseText);
                }

            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });

            $("#selectInflacion").modal({ show: true });
        }
        else {
            guardar_datos("cnperiod_g", "myTab_g", "gastos.aspx", "myTabContent3", 0);
        }
        
    });

    $("body").on("click", "#select_infla_costo", function () {
        //var id_inflacion = $('#select_inflacion').find(':selected').data('id');
        var valor_inflacion = $('#select_inflacion').val();

        guardar_datos("cnperiod_c", "myTab", "costos.aspx", "myTabContent", valor_inflacion);
    });

    $("body").on("click", "#select_infla_gasto", function () {
        var valor_inflacion = $('#select_inflacion').val();
        guardar_datos("cnperiod_g", "myTab_g", "gastos.aspx", "myTabContent3", valor_inflacion);
    });

    $('#select_inflacion.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        //$(this).find(':selected').attr('data-id')
        var periodo = $(this).find(':selected').data('periodo');
        var tipo = $(this).find(':selected').data('tipo');
        $("#span_tipo").html(tipo+":");
        $("#span_periodo").html(periodo);
    });


    function guardar_datos(select, Tab, controller, content, valInflacion) {
       
        /*OBTENIENDO DATOS DE LAS FUNCIONES DE Table To JSON*/
        var selector = $('input#selector').val();
        var data = $('#' + selector).find('table').tableToJSON();
        var nperiodo = $('#'+select+'').val();
        nperiodo = nperiodo + "" + $("#lapse").val() + "";
        var tot = $('#' + selector).find('table').find('.total').text();
        var nav = $('#' + Tab + ' li a.active').attr('id');

        console.log("valInflacion->" + valInflacion);
        
        //Validamos que no existan celdas vacias
        var table = $('#'+ content).find('#' + selector).find('table').DataTable();
        table.column(0).data().each(function (value, index) {
            console.log(value);
            if (value == "") {
                tot = 0;
                return false;
            }
        });
        if ($('#' + select +'').val() > 0) {//verifica  que haya un valor aceptable en el select
            if (tot > 0) {//verifica  que haya un valor aceptable en el total
                $.ajax({
                    type: "POST",
                    url: controller+"/sendTable",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ dataTabla: data, Nperiod: nperiodo, total: tot, pestania: nav, inflacion: valInflacion }),
                    success: function (result) {
                        console.log(result);
                        location.reload();
                    },
                    error: function (result) {
                        alert(result.responseText);
                    }

                }).done(function (data) {
                    //console.log(data);
                }).fail(function (data) {
                    console.log("Error: " + data);
                });
            }
            else {
                $('#success').find(".alert").html("Ingrese por lo menos un concepto ");
                $('#success').find(".alert").removeClass("alert-primary").addClass("alert-danger");
                $('#success').modal({ show: true });

            }
        }
        else {

            $('#success').find(".alert").html("Todos los datos de cada Período han sido Guardados");
            $('#success').modal({ show: true });

        }
        
    }

    //EVENTO PARA ACTUALIZAR DATOS COSTOS y GASTOS

    $("body").on("click", ".actualizar", function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        $(".modal-content #selector").val(selector);

        $("#Continuacion#modal-text-body ").html("¿Desea actualizar los Datos?");
        $("#costo_continuar").hide();
        $("#costo_update").show();
        $("#gasto_continuar").hide();
        $("#gasto_update").show();
        $('#Continuacion').modal({ show: true });

    });

    $("body").on("click", "#costo_update", function () {
        actualizar_datos("cnperiod_c", "myTab", "costos.aspx", "myTabContent");     
    });
    $("body").on("click", "#gasto_update", function () {
        actualizar_datos("cnperiod_g", "myTab_g", "gastos.aspx", "myTabContent3");
    });

    function actualizar_datos(select, Tab, controller, content) {
        /*OBTENIENDO DATOS DE LAS FUNCIONES DE Table To JSON*/
        var selector = $('input#selector').val();
        var data = $('#' + selector).find('table').tableToJSON();
        var nperiodo = $('#' + select + '').val();
        nperiodo = nperiodo + "" + $("#lapse").val() + "";
        var tot = $('#' + selector).find('table').find('.total').text();
        var tot_ant = $('#' + selector).find('.total_ant').val();
        var nav = $('#' + Tab + ' li a.active').attr('id');

        
        //Validamos que no existan celdas vacias
        var table = $('#' + content).find('#' + selector).find('table').DataTable();
        table.column(0).data().each(function (value, index) {
            if (value == "") {
                tot = 0;
                return false;
            }
        });

        if ($('#' + select + '').val() > 0) {//verifica  que haya un valor aceptable en el select
            if (tot > 0) {//verifica  que haya un valor aceptable en el total

                
                $.ajax({
                    type: "POST",
                    url: controller + "/updateTable",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ dataTabla: data, Nperiod: nperiodo, total: tot, total_a: tot_ant, pestania: nav }),
                    success: function (result) {
                        location.reload();
                    },
                    error: function (result) {
                        alert(result.responseText);
                    }

                }).done(function (data) {
                    //console.log(data);
                }).fail(function (data) {
                    console.log("Error: " + data);
                });


                
            }
            else {
                $('#success').find(".alert").html("Ingrese por lo menos un concepto ");
                $('#success').find(".alert").removeClass("alert-primary").addClass("alert-danger");
                $('#success').modal({ show: true });

            }
        }
        
    }


    /****************TABLA AMORTIZACION****************/
    $("#amortTable").editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
    $(".na").html("");

    $("body").on("click", "#MainContent_add_row", function () {
        var t = $("#amortTable").DataTable();
        t.row.add([
            '',
            '0',
            '',
            '0',
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([3, 'desc']).draw();

        $("#amortTable").find('td:nth-child(1)').addClass('previous');
        $("#amortTable").find('td:nth-child(2)').addClass('costo');

        $("#amortTable").find('td:nth-child(3)').addClass('porct');
        $("#amortTable").find('td:nth-child(4)').attr("data-editable", "false");    
        $("#amortTable").find('td:nth-child(5)').attr("data-editable", "false");
        $("#amortTable").editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");

    });

    $("body").on("click", "#MainContent_guardar_amort", function () {
        /*OBTENIENDO DATOS DE LAS FUNCOINES DE Table To JSON*/
        var data = $("#amortTable").tableToJSON();
        var nperiodo = $('#cnperiodo').val();
        nperiodo = nperiodo + "" + $("#lapse").val() + "";
        var tot = $('#total').text();
        //Validamos que no existan celdas vacias
        var table = $("#amortTable").DataTable();
        table.column(0).data().each(function (value, index) {
            if (value === "") {
                tot = 0;
                return false;
            }
        });
        if ($('#cnperiodo').val() > 0) {
            if (tot > 0) {
                $.ajax({
                    type: "POST",
                    url: "amortizacion.aspx/sendTableAmort",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ dataTabla: data, Nperiod: nperiodo, total: tot }),
                    success: function (result) {
                        console.log(result.d);
                        if (result.d === "succes") {
                            $('#successA').modal({ show: true });
                        }

                    },
                    error: function (result) {
                        alert(result.responseText);
                    }

                }).done(function (data) {
                    //console.log(data);
                }).fail(function (data) {
                    console.log("Error: " + data);
                });
            }
            else {
                $('#successA').find(".alert").html("Ingrese un costo mayor a 0");
                $('#successA').find(".alert").removeClass("alert-primary").addClass("alert-danger");
                $('#successA').modal({ show: true });

            }
        }
        else {
            console.log("no hay seleccion");
            $('#successA').find(".alert").html("Sin seleccion de datos");
            $('#successA').find(".alert").removeClass("alert-primary").addClass("alert-danger");
            $('#successA').modal({ show: true });
        }
    });
    //cerrar el modal
    $("#successA").on("hidden.bs.modal", function () {
        location.reload();
    });
    //Funcion al cambiar los valores de los costos en amortizacion
    $("body").on("change", " #myTabContent2 table td", function (evt, newValue) {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();
        //console.log(newValue);
        t.cell(this).data(newValue).draw();
        t.order([3, 'desc']).draw();
        var clase = $(this).attr("class");
        //CALCULAMOS EL PORCENTAJE DEL COSTO
        var rowIdx = t.cell(this).index().row;
        var data = t.row(rowIdx).data();

        if (data[1] != "" && data[2] != "") {
            var costoTotal = (data[1] * data[2]) / 100;

            t.cell(rowIdx, 3).data(costoTotal).draw();
            t.order([3, 'desc']).draw();
        }

        var column = t.column(3);

        $(column.footer()).html(
            column.data().map(parseFloat).reduce(function (a, b) {
                return a + b;
            })
        );

        $(".na").html("");

        var column2 = t.column(1); 

        $(column2.footer()).html(//Para poner el total en la ultima celda footer
            column2.data().map(parseFloat).reduce(function (a, b) {
                return a + b;
            })
        );

    });

    /********************REMOVER FILAS**************************/
    $("body").on("click", ".remove", function () {

        var selector = $(this).parents('.tab-pane').attr("id");
        var table = $('#' + selector).find('table').DataTable();

        table.row($(this).parents('tr')).remove().draw();

        $('#' + selector).find('table').find('td:nth-child(1)').addClass('previous');
        $('#' + selector).find('table').find('td:last').attr("data-editable", "false");
        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    });
    /********************Refrescar el plugin editable**************************/
    
    //$("body").on("click", ".page-link", function () {
    $('table').on('page.dt', function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        console.log("click en siguiente pagina,selecto-->" + selector);
        $('#' + selector).find('table').find('td:last').prev().prev().addClass('previous');
       

        //$("table").editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
    });

});