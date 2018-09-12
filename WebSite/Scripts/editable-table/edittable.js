$(document).ready(function () {

    $('#myTabContent, #myTabContent2').find('table').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        }
    });
    /****************TABLAS COSTOS****************/
    // Automatically add a first row of data (Genérico para todas las tablas que ocupo)
    $('.add_row').on('click', function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();
        t.row.add([
            '',
            '0',
            '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw(false);
        t.order([1, 'desc']).draw();
        //aplicamos lasa propiedades editable de las celdas
        $('#' + selector).find('table').find('td:last').prev().prev().addClass('previous');
        $('#' + selector).find('table').find('td:last').attr("data-editable", "false");
        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");

    });
    // función que ordena descendentemente los datos(costos) ingresados automaicamente
    $("body").on("change", "#myTabContent table td", function (evt, newValue) {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();
        t.cell(this).data(newValue).draw();
        t.order([1, 'desc']).draw();
    });

    /****** desactivacion de pestañas **/
    $('#myTab li a').addClass('disabled');

    //evento para avanzar en las pestañas (navs)
    $("body").on("click", ".continuar", function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        $(".modal-content #selector").val(selector);
        $('#Continuacion').modal({ show: true });

    });

    //funcion para GUARDAR DATOS de COSTOS
    $("body").on("click", "#costo_continuar", function () {
        /*OBTENIENDO DATOS DE LAS FUNCIONES DE Table To JSON*/
        var selector = $('input#selector').val();
        var data = $('#' + selector).find('table').tableToJSON();

        var nperiodo = $('#cnperiod_c').val();
        nperiodo = nperiodo + "" + $("#lapse").val() + "";
        var tot = $('#' + selector).find('table').find('.total').text();
        var nav = $('#myTab li a.active').attr('id');
        console.log('total-->' + tot);
        //Validamos que no existan celdas vacias
        var table = $('#' + selector).find('table').DataTable();
        table.column(0).data().each(function (value, index) {
            if (value === "") {
                tot = 0;
                return false;
            }
        });

        if ($('#cnperiod_c').val() > 0) {//verifica  que haya un valor aceptable en el select
            if (selector !== "tab1") {
                if (tot > 0) {//verifica  que haya un valor aceptable en el total
                    $.ajax({
                        type: "POST",
                        url: "costos.aspx/sendTable",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: false,
                        data: JSON.stringify({ dataTabla: data, Nperiod: nperiodo, total: tot, pestania: nav }),
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
        }
        else {

            $('#success').find(".alert").html("Todos los costos de cada Período han sido Guardados");
            $('#success').modal({ show: true });

        }
        

    });

    //EVENTO PARA ACTUALIZAR DATOS COSTOS

    //evento para avanzar en las pestañas (navs)
    $("body").on("click", ".actualizar", function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        console.log(selector);
        //$(".modal-content #selector").val(selector);
        //$('#Continuacion').modal({ show: true });

    });


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

    });

    $("body").on("click", "#MainContent_guardar_amort", function () {
        /*OBTENIENDO DATOS DE LAS FUNCOINES DE Table To JSON*/
        var data = $("#amortTable").tableToJSON();
        var nperiodo = $('#cnperiodo').val();
        nperiodo = nperiodo + "" + $("#lapse").val() + "";
        var tot = $('#total').text();
        console.log(nperiodo);
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
        var t = $('#' + selector).find('table').DataTable()
        //console.log(newValue);
        t.cell(this).data(newValue).draw();
        t.order([3, 'desc']).draw();
        var clase = $(this).attr("class");
        //CALCULAMOS EL PORCENTAJE DEL COSTO
        var rowIdx = t.cell(this).index().row;
        var data = t.row(rowIdx).data();

        if (clase === "costo") {
            if (data[2] !== "") {
                var value = parseFloat(newValue.replace(',', ""));
                console.log(value);
                var costoFinal = (value * data[2]) / 100;
                //console.log('porcentaje--->' + data[2]);
                t.cell(rowIdx, 3).data(costoFinal).draw();
                t.order([3, 'desc']).draw();
            }

        }
        if (clase === "porct") {
            if (data[1] !== "") {
                console.log(value);
                var costoFinal_r = (data[1] * newValue) / 100;
                //console.log('porcentaje--->' + newValue);
                t.cell(rowIdx, 3).data(costoFinal_r).draw();
                t.order([3, 'desc']).draw();
            }

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

        $('#' + selector).find('table').find('td:last').prev().prev().addClass('previous');
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