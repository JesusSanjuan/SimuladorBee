var Inversion = false, Inversion1 = false, VS = false, VS1 = false, TMARv = false, TMARv1 = false, Selectv = false, Selectv1 = false, N = false, N1 = false;
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
$("#select").change(function () { 
    var valor = $("#select").val();
    if (t) {//Limpieza y oculta si cambia el periodo
        $("#PreCalculoVAN").css("display", "none");
        $("#ResultadosVAN").css("display", "none");
    }
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
    if (t) {//Limpieza y oculta si cambia el periodo
        $("#PreCalculoVAN").css("display", "none"); 
        $("#ResultadosVAN").css("display", "none");
    }
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

var contaclickbien = 0;
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

    if (Inversion === true && Inversion1 === true && VS === true && VS1 === true && TMARv === true && TMARv1 === true && Selectv === true && Selectv1 === true && N === true && N1 === true) {   
        Inversion1 = false; VS1 = false; TMARv1 = false; Selectv1 = false; N1 = false;
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
        $('#tipo3').html(tipofecha);
        $('#tipo4').html(tipofecha);
        t = $('#vanManual').DataTable({
            columnDefs: [
                { "width": "4%", "targets": 0 },
                { "width": "32%", "targets": 1 },
                { "width": "32%", "targets": 2 },
                { "width": "32%", "targets": 3 }
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
            paging: false,
            searching: true,
            pageLength: 10//,
            //createdRow: function (row, data, dataIndex) {
            // }//,
            // data: DTabla
        });

        var renglon = 1;
        for (var i = 0; i < n; i++) {
            t.row.add([
                renglon,
                '0.00',
                '0.00',
                '0.00'
            ]).draw(true);
            renglon++;
        }
        $('#vanManual').find('td:nth-child(1)').attr("data-editable", "false");
        $('#vanManual').find('td:nth-child(2)').attr("data-editable", "true");
        $('#vanManual').find('td:nth-child(3)').attr("data-editable", "true");
        $('#vanManual').find('td:nth-child(4)').attr("data-editable", "true");
        $('#vanManual').editableTableWidget({ editor: $('<textarea>') });

       // t.columns.adjust().draw(); 
        $("#PreCalculoVAN").css("display", "block");
        $('#PreCalculoVAN').addClass("pulse animated");
        $("#PreCalculoVAN").css({
            "animation-duration": "2s",
            "animation-delay": "0s"
        });
       // const element = document.querySelector('#PreCalculoVAN');
       /* element.addEventListener('animationend', function () {           
            en espera de terminar efecto visual
            }
        });*/
    }
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
        toastr.warning('<div class="form-row">Es necesario ingresar&nbsp;<strong>solo digitos</strong>,<div class="pulse animated infinite"> &nbsp;&nbsp;longitud minima de <strong>3</strong>.</div></div>', '<strong>Atencion!!!</strong>', {
            closeButton: false,
            debug: false,
            newestOnTop: true,
            progressBar: true,
            positionClass: "toast-bottom-center",
            preventDuplicates: false,
            showDuration: 1500,
            hideDuration: 1500,
            timeOut: 5000,
            fadeOut: 3000,
            extendedTimeOut: 5000,
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "slideDown",
            hideMethod: "slideUp",
            closeMethod: false,
            closeDuration: false,
            closeEasing: false,
            tapToDismiss: false
        });
    } else {
        table.cell(rowIdx2, column).data(valor_mod).draw();
    }  

    var column1 = table.column(1); 
    var column2 = table.column(2);    
    var column3 = table.column(3);

    var column1Data = column1.data(); 
    var column2Data = column2.data(); 
    var column3Data = column3.data(); 

    /*Para sumar columna 2*/
    var sumacolumn1 = 0;
    for (var x0 = 0; x0 < column1Data.length; x0++) {
        var aT = column1Data[x0].toString();
        aT = aT.replace(/,/g, '');
        var a = parseFloat(aT);
        sumacolumn1 = sumacolumn1 + a; 
    }
    sumacolumn1 = sumacolumn1.toFixed(2); 
    var temSum1 = sumacolumn1.toString();
    $(column1.footer()).html(FormatoNumero(temSum1));
    /*Para sumar columna 3*/
    var sumacolumn2 = 0;
    for (var x1 = 0; x1 < column2Data.length; x1++) {
        var aT1 = column2Data[x1].toString();
        aT1 = aT1.replace(/,/g, '');
        var a1 = parseFloat(aT1);
        sumacolumn2 = sumacolumn2 + a1;
    }
    sumacolumn2 = sumacolumn2.toFixed(2);
    var temSum2 = sumacolumn2.toString();
    $(column2.footer()).html(FormatoNumero(temSum2));
    /*Para sumar columna 4*/
    var sumacolumn3 = 0;
    for (var x2 = 0; x2 < column3Data.length; x2++) {
        var aT2 = column3Data[x2].toString();
        aT2 = aT2.replace(/,/g, '');
        var a2 = parseFloat(aT2);
        sumacolumn3 = sumacolumn3 + a2;
    }
    sumacolumn3 = sumacolumn3.toFixed(2);
    var temSum3 = sumacolumn3.toString();
    $(column3.footer()).html(FormatoNumero(temSum3));
   
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

    if (Inversion === true && Inversion1 === true && VS === true && VS1 === true && TMARv === true && TMARv1 === true && Selectv === true && Selectv1 === true && N === true && N1 === true) {
        /*Para Obtener vector de FNE FINAL*/
            var Costoss = [];
            var Ingresoss = [];
            var FNEs = [];
            var Anios = [];
            var table = $('#vanManual').DataTable();
            var column0 = table.column(0);
            var column1 = table.column(1);
            var column2 = table.column(2);
            var column3 = table.column(3);
            var Anio = column0.data();
            var Costos = column1.data();
            var Ingresos = column2.data();
            var FNE = column3.data();    
            for (var x = 0; x < FNE.length; x++) {
                Costoss[x] = Costos[x].replace(/,/g, '');
                Ingresoss[x] = Ingresos[x].replace(/,/g, '');
                FNEs[x] = FNE[x].replace(/,/g, '');
                Anios[x] = Anio[x];
            }
            //console.log(Anios);
            //console.log(FNEs);
            inversion = inversion.replace(/,/g, '');
            VdS = VdS.replace(/,/g, '');
            TMAR = TMAR.replace(/,/g, '');

            $.ajax({
                beforeSend: function () {
                    $("#Cargando_Modal").css({ 'position': 'fixed', 'top': '40%' });
                    $("#Cargando_Modal_Dialog").css({ 'margin': '3.75rem auto' });
                    $('#Cargando_Modal').modal({ backdrop: 'static', keyboard: false });
                    $('#Cargando_Modal').modal('show');
                },
                cache: false,
                type: "POST",
                url: "vanM.aspx/MiCalculo",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                data: JSON.stringify({ inversion: inversion, FNE: FNEs, Anio:Anios, VdS: VdS, TMAR: TMAR, Select: Select, n: n }),
                success: function (data) {
                    var valores = JSON.parse(data.d);
                    $('#Cargando_Modal').modal('hide');
                    Modal(valores[0]);
                    $("#VAN").text(valores[1]);
                    $("#TIR").text(valores[2]);
                    Graficar(valores[3], valores[4], valores[5], valores[6]);            
                },
                error: function (err) {
                    console.log(err);
                    console.log(err.responseText);
                }
            }).done(function (data) {
                $('#content').html('');
                $.ajax({
                    type: "POST",
                    url: "vanM.aspx/CreacionTabla",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ inversion: inversion, Costos: Costoss, Ingresos: Ingresoss, FNE: FNEs, AnioV: Anios, VdS: VdS, TMAR: TMAR, Select: Select, n: n }),
                    success: function (data) {
                        $('#Cargando_Modal').modal('hide');
                        var valores = JSON.parse(data.d);
                        RellenarTabla(valores[0]);
                        $("#PeridoRec").text(valores[1]);
                        $("#PeridoRec2").text(valores[2]);
                        $("#BenCosto").text(valores[3]);
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
                    //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            }).always(function () {
            }).then(function (data) {
            });
    }
});

function FormatoNumero(n) {
    return n.replace(/\D/g, "")
        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
}

/* Funcion de modal de resultados de van*/
function Modal(Resultado) {
    $('#Cargando_Modal').modal('hide');
    ResultadoVPN = JSON.parse(JSON.stringify(Resultado));
    $(document).ready(function () {
        var Texto, TextoEfecto, Textovelocidad, TextoRepticiones, Imagen, audio, audioP;
        if (ResultadoVPN > 0) {
            Texto = "<strong style='vertical - align: middle;'>Se recomienda aceptar la inversion</strong>";
            TextoEfecto = "pulse animated"; Textovelocidad = '2s'; TextoRepticiones = '5';
            Imagen = '<img src="../multimedia/correcto.gif" class="img-fluid tada animated infinite" width="100" height="100" alt="Responsive image"/>';
            audio = '<source type = "audio/mp3" src = "../multimedia/Aplausos.mp3" >';
        }
        else {
            Texto = "<strong style='vertical - align: middle;'>Se recomienda rechazar la inversion</strong>";
            TextoEfecto = "tada animated"; Textovelocidad = '4s'; TextoRepticiones = 'infinite';
            Imagen = '<img src="../multimedia/alerta.gif" class="img-fluid bounce animated infinite" width="100" height="100" alt="Responsive image"/>';
            audio = '<source type = "audio/mp3" src = "../multimedia/error.mp3" >';
        }
        $('#myModal').modal({ show: true });
        $("#modalheader").css({
            "-webkit-animation-delay": "1s"
        });
        $('#imgmodal').html(Imagen);
        $('#texmodal').html(Texto);
        $('#texmodal').addClass(TextoEfecto); //otra manera de aplicar efectos
        $("#texmodal").css({
            "-webkit-animation-duration": Textovelocidad, //velocidad de efecto
            "-webkit-animation-delay": "2s", // Tiempo a esperar antes de empezar a  ejecutar animacion
            "-webkit-animation-iteration-count": TextoRepticiones,// Veces de repeticion de efecto
            "animation-iteration-count": TextoRepticiones//, // Veces de repeticion de efecto
            // "-webkit-animation": "mymove 1s; ", //Velocidad de la animacion
            // "animation": "mymove 1s;"//Velocidad de la animacion
        });
        $('#audio').html(audio);
        audioP = document.getElementById("audio");
        audioP.play();

        $('#cerrar').click(function () {
            audioP.pause();
            audioP.currentTime = 0;

            $("#ResultadosVAN").css("display", "block");
            $('#ResultadosVAN').addClass("bounceInLeft animated");
            $("#ResultadosVAN").css({
                "-webkit-animation-delay": ".5s"
            });
            //$("#ResultadosVAN").load(" #ResultadosVAN");
            location.href = "#ResultadosFinales";
        });
        $("#myModal").on('hide.bs.modal', function () {
            audioP.pause();
            audioP.currentTime = 0;
            $("#ResultadosVAN").css("display", "block");
            $('#ResultadosVAN').addClass("bounceInLeft animated");
            $("#ResultadosVAN").css({
                "-webkit-animation-delay": ".5s"
            });
            //$("#ResultadosVAN").load(" #ResultadosVAN");
            location.href = "#ResultadosFinales";
        });

    });
}
/* Funcion de modal de resultados de van*/

/* Funcion de graficacion de resultados de van*/
var myLineChart;
function Graficar(x, y, Periodo, posRojo) {

    // Chart.js scripts
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    //convertimos el array en json
    var time = JSON.parse(JSON.stringify(x));
    var repArray = JSON.parse(JSON.stringify(y));
    var PeriodoSelect = JSON.parse(JSON.stringify(Periodo));
    var posRojo1 = JSON.parse(JSON.stringify(posRojo));

    var pointBackgroundColor = new Array(repArray.length);
    var pointRadius = new Array(repArray.length);
    var pointHoverRadius = new Array(repArray.length);
    var pointStyle = new Array(repArray.length);
    // var tooltipsbackgroundColor = new Array(repArray.length);

    for (var i = 0; i < repArray.length; i++) {
        pointBackgroundColor[i] = "rgba(2,117,216,1)";
        pointRadius[i] = 3;
        pointHoverRadius[i] = 6;
        pointStyle[i] = 'circle';
        //  tooltipsbackgroundColor[i] = 'rgba(0, 0, 0, 0.7)';
    }

    pointBackgroundColor[posRojo1] = "rgba(255, 87, 51,1)";
    pointRadius[posRojo1] = 8;
    pointHoverRadius[posRojo1] = 10;
    pointStyle[posRojo1] = 'rectRounded';

    var ctx = document.getElementById("myAreaChart");
    myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: time,
            datasets: [{
                label: "VPN",
                lineTension: 0.2,
                backgroundColor: "rgba(2,117,216,0.2)",// Para lo de bajo o arriba de la lineas y el decimal para la intencidad
                borderColor: "rgba(2,117,216,0.9)",// El color de las lineas que unen los puntos y la intencidad
                borderWidth: 3,
                pointRadius: pointRadius, // Radio
                pointBackgroundColor: pointBackgroundColor,// Interior del boton e intensidad del interior
                pointBorderColor: "rgba(255,255,255,1)",// Color de los bordes del punto e intensidad del borde
                pointHoverRadius: pointHoverRadius,// Agrandar al pasar el raton sobre el punto
                pointHoverBackgroundColor: pointBackgroundColor,// Color del interior del punto al pasar el cursor y agrandarse
                pointHitRadius: 4,//determina la distancia a la cuál los puntos trazados comenzarán a interactuar con el ratón.
                pointBorderWidth: 2, //Distancia del punto de su borde al centro
                pointStyle: pointStyle,
                data: repArray

            }]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: "Calculo del VPN"
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: true
                    },
                    scaleLabel: {
                        display: true,
                        labelString: "TMAR en ".concat(PeriodoSelect)
                    },
                    ticks: {
                        min: time[0],
                        max: time[repArray.length - 1],
                        callback: function (value, index, values) {
                            return value + '%';
                        }
                        // maxTicksLimit: 40
                    }
                }],
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'VPN'
                    },
                    ticks: {
                        //min: repArray[repArray.length - 1],
                        //max: repArray[0],
                        callback: function (value, index, values) {
                            return '$' + value;
                        }
                        // maxTicksLimit: 40
                    },
                    gridLines: {
                        display: true
                    }
                }]
            },
            tooltips: {
                xPadding: 16,
                yPadding: 10,
                backgroundColor: 'rgba(0,5,109, 0.5)',
                titleFontStyle: 'normal',
                titleMarginBottom: 15/*,
                callbacks: {
                    labelColor: function (tooltipItem, chart) {
                        console.log(tooltipItem);
                    return {
                       
                        borderColor: 'rgb(255, 0, 0)',
                        backgroundColor: 'rgb(255, 0, 0)'
                    }
                },
                labelTextColor:function(tooltipItem, chart){
                    return '#543453';
                }
            }*/
            },
            animation: {
                duration: 10 // general animation time
            },
            hover: {
                animationDuration: 10 // duration of animations when hovering an item
            },
            responsiveAnimationDuration: 10, // animation duration after a resize
            legend: {
                display: true,
                labels: {
                    fontColor: 'rgb(0, 0, 0)'// Color de los labels del titulo
                }
            }
        }
    });
}
/* Funcion de graficacion de resultados de van*/

/* Funcion de creacion de tabla*/
function RellenarTabla(Datos) {
    var DTabla = JSON.parse(JSON.stringify(Datos));
    for (var i = 0; i < DTabla.length; i++) {
        for (var j = 2; j < DTabla[i].length; j++) {
            var Dato = DTabla[i][j];
            var resultadoFormato = number_format(Dato, 2);
            var res;
            if (Dato !== '') {
                if (Dato < 0) {
                    var str1 = "$-";
                    res = str1.concat(resultadoFormato);
                }
                else {
                    var str2 = "$";
                    res = str2.concat(resultadoFormato);
                }
                DTabla[i][j] = res;
            }
        }
    }
    var table = $('#dataTableVAN').DataTable({
        "columnDefs": [
            { "width": "3%", "targets": 0 },
            { "width": "7%", "targets": 1 },
            { "width": "15%", "targets": 2 },
            { "width": "15%", "targets": 3 },
            { "width": "15%", "targets": 4 },
            { "width": "15%", "targets": 5 },
            { "width": "15%", "targets": 6 },
            { "width": "15%", "targets": 7 }
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
        createdRow: function (row, data, dataIndex) {
            if (data[6].replace(/[\$,]/g, '') * 1 > 1) {
                $(row).find('td:eq(6)').css("color", "red");
            }
            if (data[7].replace(/[\$,]/g, '') * 1 > 1) {
                $(row).find('td:eq(7)').css("color", "red");
            }
        },
        data: DTabla
    });
    table.columns.adjust().draw();
}

function number_format(amount, decimals) {
    amount += ''; // por si pasan un numero en vez de un string
    amount = parseFloat(amount.replace(/[^0-9\.]/g, '')); // elimino cualquier cosa que no sea numero o punto

    decimals = decimals || 0; // por si la variable no fue fue pasada

    // si no es un numero o es igual a cero retorno el mismo cero
    if (isNaN(amount) || amount === 0)
        return parseFloat(0).toFixed(decimals);

    // si es mayor o menor que cero retorno el valor formateado como numero
    amount = '' + amount.toFixed(decimals);

    var amount_parts = amount.split('.'),
        regexp = /(\d+)(\d{3})/;

    while (regexp.test(amount_parts[0]))
        amount_parts[0] = amount_parts[0].replace(regexp, '$1' + ',' + '$2');

    return amount_parts.join('.');
}
/* Funcion de creacion de tabla*/