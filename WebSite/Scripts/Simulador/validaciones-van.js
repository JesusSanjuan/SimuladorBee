/*Validacion de todos los campos cambio a colores y mostrar textos*/
// Example starter JavaScript for disabling form submissions if there are invalid fields
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
/* Validacion del campo TMAR*/

/* Validacion del campo PLAZO*/


/*
$('#n').keyup(function (event) {
    valorN = $('#n').val().replace(new RegExp(',', 'g'), "");
    $('#select').prop('disabled', false).change;
    if (valorN >= 13) {
        $("#select").val("2").change();
        $('#select option[value="1"]').attr("disabled", true);
    }
    else {
        $('#select option[value="1"]').attr("disabled", false);
        $("#select").val("").change();
    }
});*/

var validacion;
var ExpReg;
$('#n').keyup(function (event) {
    valorN = $('#n').val().replace(new RegExp(',', 'g'), "");
   
    var valor = $("#select").val();
        switch (valor)
        {
            case "1":
                validacion = /^([6-9]{4,})$/;//Corregir exprecion para que acepte de 601 en adelante
                    $('#errorplazo').append('<p>Test</p>');
                break;
            case "2":
                validacion = /^([0-9]{3,})$/;
                    $('#errorplazo').append('<p>Test2</p>');
                break;
            default:
                break;
        }

});



const number5 = document.querySelector('.number5');


function formatNumber5(n) {
    return n.replace(/\D/g, "")    
        .replace(validacion, "");
    
}
number5.addEventListener('keyup', (e5) => {
    const element5 = e5.target;
    const value5 = element5.value;
    element5.value = formatNumber5(value5);
});

$('[data-toggle="popover"]').popover();// Hacer que aparesca el popover al pasar el cursor

$("#select").change(function () {

    
    
    var valor = $(this).val();
    switch (valor)
    {        
        case "1":
            $("#n").removeAttr('disabled');
            $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
            $("#n").val('');
            $("#popover").popover("show");// Muestra 
            break;
        case "2":
            $("#n").removeAttr('disabled');
            $("#n").attr("placeholder", "Ingrese el plazo del proyecto");
            $("#n").val('');
            $("#popover").popover('hide');
            break;
        default:
            $("#n").attr('disabled', 'disabled');
            $("#n").attr("placeholder", "Seleccione primero el tipo de plazo");
            $("#n").val('');
            break;
    }
});
/* Validacion del campo PLAZO*/


