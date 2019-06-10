var Inversion = false, Inversion1 = false, VS = false, VS1 = false, TMARv = false, TMARv1 = false, Selectv = false, Selectv1 = false, N = false, N1 = false;
var DTabla = [];
var t;
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
    var valor = $("#select").val();
    var tipofecha = "Año";
    if (valor === "1") {
        tipofecha = "Mes";
    }
    $('#tipo').html(tipofecha);
    t = $('#vanManual').DataTable({
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
           paging: false,
           searching: false//,
            //createdRow: function (row, data, dataIndex) {
           // }//,
           // data: DTabla
        });
        var renglon = 1;
        for (var i = 0; i < 10; i++) {  
            t.row.add([
                renglon,
                '0',
                '0',
                '0'
            ]).draw(false);
            renglon++;
        }        
        $('#vanManual').find('td:nth-child(1)').attr("data-editable", "false");
        $('#vanManual').find('td:nth-child(2)').attr("data-editable", "true");
        $('#vanManual').find('td:nth-child(3)').attr("data-editable", "true");
        $('#vanManual').find('td:nth-child(4)').attr("data-editable", "false");
        $('#vanManual').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample();      
});

$("body").on("change", "#myTabContent table td", function (evt, newValue) {


    var t2 = $('#vanManual').DataTable();
    t2.cell(this).data(newValue).draw();
    //console.log("change: " + t2);
    var rowIdx = t2.cell(this).index().row;
    var data = t2.row(rowIdx).data();

    var table = $('#vanManual').DataTable();
    var cell = $(this), column = cell.index();
    //t33.cell(this).data(value+"u").draw();
    var rowIdx2 = table.cell(this).index().row;
    // var data = t33.row(rowIdx).data();
    var valor_mod = formatNumber33(newValue);
    if (valor_mod.length <= 2) {
        table.cell(rowIdx2, column).data("0").draw();
    } else {
        table.cell(rowIdx2, column).data(valor_mod).draw();
    }
   
    //console.log("Posicion renglon: " + rowIdx2 + " Columna: " + column);

   /* var data2 = table
        .rows()
        .data();*/
    //console.log("Valor 0,1: " + data2[0][1]);


    
    if (data[1].length !== 0 && data[2].length !== 0) {
        var v1 = data[1].replace(/,/g, '');
        var v2 = data[2].replace(/,/g, '');
        console.log("Data 1: " + data[1]+ "Data 2: " + data[2]);
        var costoTotal = (v1 - v2);
        costoTotal = costoTotal.toFixed(2); 
        var n = costoTotal.toString();
        //var costotoalsinpunto = n.replace(/./g, '');
        var xxxx = formatNumber33(n);
        t2.cell(rowIdx, 3).data(xxxx).draw();
    }


});

function formatNumber33(n) {
    return n.replace(/\D/g, "")
        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
}
