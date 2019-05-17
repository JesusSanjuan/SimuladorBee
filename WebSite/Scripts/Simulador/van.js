/*Validacion de todos los campos cambio a colores y mostrar textos de la fusion*/
    (function () {
        'use strict';
    window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
            //form.classList.add('was-feedback');
        }, false);
    });
}, false);
})();
/*Validacion de todos los campos cambio a colores y mostrar textos*/
   
/* Validacion del campo Inversion */
const number = document.querySelector('.number');
function formatNumber (n) {
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
    if (inversion .length === 0) {
        $("#Inversionval").addClass("invalid-feedback");
        $("#Inversion").removeClass("is-valid");
        $("#Inversion").addClass("is-invalid");
        $('#Inversionval').text('Por favor ingrese la inversion.');
        $('#Inversionval').show();
    } else {
        $("#Inversion").removeClass("is-invalid");
        $("#Inversion").addClass("is-valid");
        $('#Inversionval').hide();

        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (inversion.match(reg)) {
            $("#Inversion").removeClass("is-invalid");
            $("#Inversion").addClass("is-valid");
            $('#Inversionval').hide();
        } else {           
            $("#Inversionval").addClass("invalid-feedback");
            $("#Inversion").removeClass("is-valid");
            $("#Inversion").addClass("is-invalid");
            $('#Inversionval').text('Por favor ingrese mas digitos');
            $('#Inversionval').show();
        }
    }
});
/* Validacion del campo Inversion */

/* Validacion del campo Flujo Neto de Efectivo */
const number2 = document.querySelector('.number2');

function formatNumber2 (n) {
	return n.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
}
number2.addEventListener('keyup', (e2) => {
	const element2 = e2.target;
	const value2 = element2.value;
  element2.value = formatNumber2(value2);
});

$('#FNE').keyup(function (event) {
    var FNE = $("#FNE").val();
    if (FNE.length === 0) {
        $("#FNEval").addClass("invalid-feedback");
        $("#FNE").removeClass("is-valid");
        $("#FNE").addClass("is-invalid");
        $('#FNEval').text('Por favor ingrese el FNE.');
        $('#FNEval').show();
    } else {
        $("#FNE").removeClass("is-invalid");
        $("#FNE").addClass("is-valid");
        $('#FNEval').hide();

        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (FNE.match(reg)) {
            $("#FNE").removeClass("is-invalid");
            $("#FNE").addClass("is-valid");
            $('#FNEval').hide();
        } else {
            $("#FNEval").addClass("invalid-feedback");
            $("#FNE").removeClass("is-valid");
            $("#FNE").addClass("is-invalid");
            $('#FNEval').text('Por favor ingrese mas digitos');
            $('#FNEval').show();
        }
    }
});
/* Validacion del campo Flujo Neto de Efectivo */

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
    } else {
        $("#VdS").removeClass("is-invalid");
        $("#VdS").addClass("is-valid");
        $('#VdSval').hide();

        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (VdS.match(reg)) {
            $("#VdS").removeClass("is-invalid");
            $("#VdS").addClass("is-valid");
            $('#VdSval').hide();
        } else {
            $("#VdSval").addClass("invalid-feedback");
            $("#VdS").removeClass("is-valid");
            $("#VdS").addClass("is-invalid");
            $('#VdSval').text('Por favor ingrese mas digitos');
            $('#VdSval').show();
        }
    }
});
/* Validacion del campo Valor de Salvamento*/

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
    } else {
        $("#TMAR").removeClass("is-invalid");
        $("#TMAR").addClass("is-valid");
        $('#TMARval').hide();

        var reg = /^(\d|,)*\.\d{1,2}$/g;
        if (TMAR.match(reg)) {
            $("#TMAR").removeClass("is-invalid");
            $("#TMAR").addClass("is-valid");
            $('#TMARval').hide();
        } else {
            $("#TMARval").addClass("invalid-feedback");
            $("#TMAR").removeClass("is-valid");
            $("#TMAR").addClass("is-invalid");
            $('#TMARval').text('Por favor ingrese mas digitos');
            $('#TMARval').show();
        }
    }
});

/* Validacion del campo TMAR*/

/* Validacion del campo PLAZO*/

$("#select").change(function () {  //Estrar datos y del campo de texto y luego aplicar  validacion y mostrar popper en caso de errror
    var valor = $(this).val();
    switch (valor) {
        case "1":
            $("#n").removeAttr('disabled');
            $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
            $("#n").val('');
            $('#popover').attr('data-original-title', "Toma en cuenta!");
            $('#popover').attr('data-content', "Solo se permitira ingresar la cantidad de 1 a 600 meses");
            $("#popover").popover('update');
            $("#popover").popover("show");
            break;
        case "2":
            $("#n").removeAttr('disabled');
            $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
            $("#n").val('');
            $('#popover').attr('data-original-title', "Toma en cuenta!");
            $('#popover').attr('data-content', "Solo se permitira ingresar la cantidad  de 1 a 99 años");
            $("#popover").popover('update');
            $("#popover").popover("show");
            break;
        default:
            $("#popover").popover("hide");
            $("#n").attr('disabled', 'disabled');
            $("#n").attr("placeholder", "Seleccione primero el tipo de plazo");
            $("#n").val('');            
            $('#nval').hide();
            break;
    }
    $("#n").removeClass("is-invalid");
    $("#n").removeClass("is-valid");
});

var validacion;
$('#n').keyup(function (event) {
    var valor = $("#select").val();
    var n = $("#n").val();  

    if (n.length === 0) {
        $("#nval").addClass("invalid-feedback");
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
        $("#n").removeClass("is-valid");
        $("#n").addClass("is-invalid");
        $('#nval').text('Por favor ingrese el plazo en '+ tipo);
        $('#nval').show();
    } else {
        $("#n").removeClass("is-invalid");
        $("#n").addClass("is-valid");
        $('#nval').hide();
    }
        switch (valor)
        {
            case "1":
                if (n < 601) {
                    $('#popover').attr('data-original-title', "De meses años");
                    var anios = n / 12;
                    $('#popover').attr('data-content', "Los meses ingresados son equivalentes en años a: " + anios);
                    $("#popover").popover('update');
                    $("#popover").popover("show");
                }
                else {
                    $('#popover').attr('data-original-title', "Verifique..");
                    $('#popover').attr('data-content', "Unicamente se puede ingresar la cantidad de 1 a 600 meses (50 años)");
                    $("#popover").popover('update');
                    $("#popover").popover("show");
                    $("#n").removeClass("is-valid");
                    $("#n").addClass("is-invalid");


                    $("#n").val("");
                }
                break;
            case "2":
                validacion = /^([0-9]{3,})$/;
                $("#n").val(formatNumber5(n));
                if (validacion.test(n) === true) {                    
                    $('#popover').attr('data-original-title', "Verifique..");
                    $('#popover').attr('data-content', "Unicamente se puede ingresar la cantidad de 1 a 99 años");
                    $("#popover").popover('update');
                    $("#n").removeClass("is-valid");
                    $("#n").addClass("is-invalid");



                    $("#popover").popover("show");                     
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
/* Validacion del campo PLAZO*/

//$('[data-toggle="popover"]').popover();// Hacer que aparesca el popover al pasar el cursor

$("#calcular").click(function () {
    
});


