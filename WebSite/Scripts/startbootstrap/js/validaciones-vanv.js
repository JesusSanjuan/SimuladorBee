$(document).ready(function () {
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


    /* Validacion del campo PLAZO*/
    /*
    const number5 = document.querySelector('.number5');

    function formatNumber5(n) {
        n = String(n).replace(/\D/g, "");
        return n === '' ? n : Number(n).toLocaleString();
    }
    number5.addEventListener('keyup', (e5) => {
        const element5 = e5.target;
        const value5 = element5.value;
        element5.value = formatNumber5(value5);
    });
    */

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
    });

    /* Validacion del campo PLAZO*/

    /************************/

    //verificar si la session id_proyect existe 
    var id_proyecto;
    $.ajax({
        async: false,
        cache: false,
        type: "POST",
        url: "vanv.aspx/buscarID_proyect",
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

});