var Inversion = false, Inversion1 = false, VS = false, VS1 = false, TMARv = false, TMARv1 = false, Selectv = false, Selectv1 = false, N = false, N1 = false;
var t;
var FNEs = [];
/* Validacion del campo Inversion */
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
$('#Inversion').keyup(function (event) {
    var inversion = $("#Inversion").val();
    if (inversion.length === 0) {
        $("#Inversionval").addClass("invalid-feedback");
        $("#Inversion").removeClass("is-valid");
        $("#Inversion").addClass("is-invalid");
        $('#Inversionval').text('Por favor ingrese la inversion.');
        $('#Inversionval').show();
        Inversion = false;
    } else {
        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (inversion.match(reg)) {
            $("#Inversion").removeClass("is-invalid");
            $("#Inversion").addClass("is-valid");
            $('#Inversionval').hide();
            Inversion = true;
        } else {
            $("#Inversionval").addClass("invalid-feedback");
            $("#Inversion").removeClass("is-valid");
            $("#Inversion").addClass("is-invalid");
            $('#Inversionval').text('Por favor ingrese mas digitos');
            $('#Inversionval').show();
            Inversion = false;
        }
    }
});
/* Validacion del campo Inversion */

/* Validacion del campo TMAR*/
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
$('#TMAR').keyup(function (event) {
    var TMAR = $("#TMAR").val();
    if (TMAR.length === 0) {
        $("#TMARval").addClass("invalid-feedback");
        $("#TMAR").removeClass("is-valid");
        $("#TMAR").addClass("is-invalid");
        $('#TMARval').text('Por favor ingrese la TMAR.');
        $('#TMARval').show();
        TMARv = false;
    } else {
        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (TMAR.match(reg)) {
            if (TMAR >= 1.00 && TMAR <= 100.00) {
                $("#TMAR").removeClass("is-invalid");
                $("#TMAR").addClass("is-valid");
                $('#TMARval').hide();
                TMARv = true;
            }
            else {
                $("#TMAR").removeClass("is-valid");
                $("#TMAR").addClass("is-invalid");
                $('#TMARval').text('Por favor ingrese la TMAR mayor de 0.99 y menor 100.01');
                $('#TMARval').show();
                $("#TMAR").val("");
                TMARv = false;
            }
        } else {
            $("#TMARval").addClass("invalid-feedback");
            $("#TMAR").removeClass("is-valid");
            $("#TMAR").addClass("is-invalid");
            $('#TMARval').text('Por favor ingrese mas digitos');
            $('#TMARval').show();
            TMARv = false;
        }
    }
});
/* Validacion del campo TMAR*/

/* Validacion del campo Valor de Salvamento*/
const number3 = document.querySelector('.number3');

function formatNumber3(n) {
    return n.replace(/\D/g, "")
        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
}
number3.addEventListener('keyup', (e3) => {
    const element3 = e3.target;
    const value3 = element3.value;
    element3.value = formatNumber3(value3);
});

$('#VdS').keyup(function (event) {
    var VdS = $("#VdS").val();
    if (VdS.length === 0) {
        $("#VdSval").addClass("invalid-feedback");
        $("#VdS").removeClass("is-valid");
        $("#VdS").addClass("is-invalid");
        $('#VdSval').text('Por favor ingrese el Valor de Salvamento.');
        $('#VdSval').show();
        VS = false;
    } else {
        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (VdS.match(reg)) {
            $("#VdS").removeClass("is-invalid");
            $("#VdS").addClass("is-valid");
            $('#VdSval').hide();
            VS = true;
        } else {
            $("#VdSval").addClass("invalid-feedback");
            $("#VdS").removeClass("is-valid");
            $("#VdS").addClass("is-invalid");
            $('#VdSval').text('Por favor ingrese mas digitos');
            $('#VdSval').show();
            VS = false;
        }
    }
});
/* Validacion del campo Valor de Salvamento*/

/* Validacion del campo PLAZO*/
$("#select").change(function () {  //Estrar datos y del campo de texto y luego aplicar  validacion y mostrar popper en caso de errror
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

/* Validacion del campo PLAZO*/
$("#continuar").click(function () {
    $("#n").popover("hide");
    var inversion = $("#Inversion").val();
    var VdS = $("#VdS").val();
    var TMAR = $("#TMAR").val();
    var Select = $("#select").val();
    var n = $("#n").val();

    if (inversion.length === 0) {
        $("#Inversionval").addClass("invalid-feedback");
        $("#Inversion").removeClass("is-valid");
        $("#Inversion").addClass("is-invalid");
        $('#Inversionval').text('Por favor ingrese la inversion.');
        $('#Inversionval').show();
        Inversion1 = false;
    } else {
        Inversion1 = true;
    }    

    if (VdS.length === 0) {
        $("#VdSval").addClass("invalid-feedback");
        $("#VdS").removeClass("is-valid");
        $("#VdS").addClass("is-invalid");
        $('#VdSval').text('Por favor ingrese el Valor de Salvamento.');
        $('#VdSval').show();
        VS1 = false;
    } else {
        VS1 = true;
    }
    if (TMAR.length === 0) {
        $("#TMARval").addClass("invalid-feedback");
        $("#TMAR").removeClass("is-valid");
        $("#TMAR").addClass("is-invalid");
        $('#TMARval').text('Por favor ingrese la TMAR.');
        $('#TMARval').show();
        TMARv1 = false;
    }
    else {
        TMARv1 = true;
    }
    if (Select === "") {
        $("#selectval").addClass("invalid-feedback");
        $("#select").removeClass("is-valid");
        $("#select").addClass("is-invalid");
        $('#selectval').text('Por favor seleccione un tipo de plazo');
        $('#selectval').show();
        Selectv1 = false;
    } else {
        Selectv1 = true;
    }

    if (n.length === 0) {
        $("#nval").addClass("invalid-feedback");
        $("#n").removeClass("is-valid");
        $("#n").addClass("is-invalid");
        $('#nval').text('Por favor ingrese el plazo');
        $('#nval').show();
        N1 = false;
    } else {
        N1 = true;
    }

    //if (Inversion === true && Inversion === true  && VS === true && VS1 === true && TMARv === true && TMARv1 === true && Selectv === true && Selectv1 === true && N === true && N1 === true) {     
    if (t) {//Limpieza tabla
        t.clear();
        t.destroy();
        $('#thcobros').html("Cobros");
        $('#thpagos').html("Pagos");
        $('#thFNE').html("Flujo Neto de Efectivo");
    }

    var valor = $("#select").val();
    var tipofecha = "Año";
    if (valor === "1") {
        tipofecha = "Mes";
    }
    $('#tipo').html(tipofecha);
    $('#tipo2').html(tipofecha);
    t = $('#vanManual').DataTable({
            "columnDefs": [
                { "width": "4%", "targets": 0 },
                { "width": "24%", "targets": 1 },
                { "width": "24%", "targets": 2 },
                { "width": "24%", "targets": 3 }
            ],
            destroy: true,
            language: {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Último",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
           },
           keys: true,
           paging: true,
           searching: true,
           pageLength: 10//,
            //createdRow: function (row, data, dataIndex) {
           // }//,
           // data: DTabla
    });
    t.columns.adjust().draw();
    var renglon = 1;
    for (var i = 0; i < n; i++) {  
        t.row.add([
            renglon,
            '0.00',
            '0.00',
            '0.00'
        ]).draw(false);
        renglon++;
    }        
    $('#vanManual').find('td:nth-child(1)').attr("data-editable", "false");
    $('#vanManual').find('td:nth-child(2)').attr("data-editable", "true");
    $('#vanManual').find('td:nth-child(3)').attr("data-editable", "true");
    $('#vanManual').find('td:nth-child(4)').attr("data-editable", "false");
    $('#vanManual').editableTableWidget({ editor: $('<textarea>') });        
});

$("body").on("change", "#myTabContent table td", function (evt, newValue) {
    var table = $('#vanManual').DataTable();
    table.cell(this).data(newValue).draw();
    var rowIdx = table.cell(this).index().row;
    var data = table.row(rowIdx).data();
    
    var cell = $(this), column = cell.index();
    var rowIdx2 = table.cell(this).index().row;
    var valor_mod = FormatoNumero(newValue);
    if (valor_mod.length <= 2) {
        table.cell(rowIdx2, column).data("0.00").draw();
        $('#Texto_alert').html("<strong>Atencion!!!</strong> Es necesario ingresar <strong>solo digitos</strong>, longitud minima de <strong>3</strong>.");
        $("#Alert").css("display", "block");
    } else {
        table.cell(rowIdx2, column).data(valor_mod).draw();
        $("#Alert").css("display", "none");
    }
   
    if (data[1].length !== 0 && data[2].length !== 0) {
        var v1 = data[1].replace(/,/g, '');
        var v2 = data[2].replace(/,/g, '');
        var costoTotal = (v1 - v2);
        costoTotal = costoTotal.toFixed(2); 
        var n = costoTotal.toString();
        var numForm = FormatoNumero(n);
        table.cell(rowIdx, 3).data(numForm).draw();
    }

    var column2 = table.column(1); 
    var column3 = table.column(2);
    var column4 = table.column(3);

    var column2Data = column2.data(); 
    var column3Data = column3.data(); 
    var column4Data = column4.data(); 

    /*Para sumar columna 2*/
    var sumacolumn2 = 0;
    for (var x0 = 0; x0 < column2Data.length; x0++) {
        var aT = column2Data[x0].toString();
        aT = aT.replace(/,/g, '');
        var a = parseFloat(aT);
        sumacolumn2 = sumacolumn2 + a; 
    }
    sumacolumn2 = sumacolumn2.toFixed(2); 
    var temSum1 = sumacolumn2.toString();
    $(column2.footer()).html(FormatoNumero(temSum1));
    /*Para sumar columna 3*/
    var sumacolumn3 = 0;
    for (var x1 = 0; x1 < column3Data.length; x1++) {
        var aT1 = column3Data[x1].toString();
        aT1 = aT1.replace(/,/g, '');
        var a1 = parseFloat(aT1);
        sumacolumn3 = sumacolumn3 + a1;
    }
    sumacolumn3 = sumacolumn3.toFixed(2);
    var temSum2 = sumacolumn3.toString();
    $(column3.footer()).html(FormatoNumero(temSum2));
    /*Para sumar columna 4*/
    var sumacolumn4 = 0;
    for (var x2 = 0; x2 < column4Data.length; x2++) {
        var aT2 = column4Data[x2].toString();
        aT2 = aT2.replace(/,/g, '');
        var a2 = parseFloat(aT2);
        sumacolumn4 = sumacolumn4 + a2;
    }
    sumacolumn4 = sumacolumn4.toFixed(2);
    var temSum3 = sumacolumn4.toString();
    $(column4.footer()).html(FormatoNumero(temSum3));
    /*Para Obtener vector de FNE FINAL*/
    var FNE = column4.data();    
    for (var x = 0; x < FNE.length; x++) {       
        FNEs[x] = FNE[x].replace(/,/g, '');
    }
    console.log(FNEs);
})/*.on('validate', "#myTabContent table td", function (evt, newValue) {
    if (newValue.length<=2) {
         return false; // mark cell as invalid 
    }
})*/;

$("#calcular").click(function () {
    var inversion = $("#Inversion").val();
    var VdS = $("#VdS").val();
    var TMAR = $("#TMAR").val();
    var Select = $("#select").val();
    var n = $("#n").val();

    inversion = inversion.replace(/,/g, '');
    VdS = VdS.replace(/,/g, '');
    TMAR = TMAR.replace(/,/g, '');

    $.ajax({
        type: "POST",
        url: "vanM.aspx/MiCalculo",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        data: JSON.stringify({ inversion: inversion, FNE: FNEs, VdS: VdS, TMAR: TMAR, Select: Select, n: n }),
        success: function (data) {
           // var valores = JSON.parse(data.d);
            
        },
        error: function (err) {
            console.log(err);
            console.log(err.responseText);
        }
    }).done(function (data) {

    }).fail(function (data) {
        console.log("Error: " + data);
    }).always(function () {
    }).then(function (data) {
    });
});

function FormatoNumero(n) {
    return n.replace(/\D/g, "")
        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
}
