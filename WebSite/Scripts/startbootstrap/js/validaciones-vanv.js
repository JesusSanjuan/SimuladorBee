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

$(document).ready(function () {


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



    /*******VALIDACIONES VAN MANUAL ******************/

    //Iniciación
    $("#contentTableFlujos").hide();

    var periodoM = "";

    $("#formVANM #n").on('blur', function (e) {

        if ($(this).val() != "" && periodoM != "" && $(this).val() != 0) {

            var inversionInicial = $("#formVANM #MainContent_Inversion").val();

            mostrarTablaFlujos(periodoM, $(this).val(), inversionInicial);

        }
        else {
            $("#contentTableFlujos").hide();
        }
       
    });

    function mostrarTablaFlujos(periodo, Nperiodo, inversionI) {

        if (periodo == 1) {
            $("#contentTableFlujos #periodo").html("Mes");
        }
        else {
            $("#contentTableFlujos #periodo").html("Año");
        }

        

        //Inicializamos la tabla
        var t = $('#flujosM').DataTable();

        t.clear().draw();

        //Aregamos las filas


        for (var i = 0; i <= Nperiodo; i++) {
            var valI = "";
            if (inversionI != "" && i == 0) {
                valI = inversionI;
            }
            t.row.add([
                i,
                valI
            ]).draw(false);

  
        }
        
        $('#flujosM').find('td:nth-child(1)').attr("data-editable", "false");
        $('#flujosM').editableTableWidget({ editor: $('<input class="form-control" id="flujo">') });


        $("#contentTableFlujos").show();
    }

    $('#formVANM #selectN').on('change', function () {
        periodoM = $(this).val();

        $("#formVANM #n").prop('disabled', false);

    });

    //formato moneda
    $("body").on('keyup', "#flujo , #MainContent_Inversion, #MainContent_VdS", function (event) {
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });

    });
    //Solo números
    $("body").on('keyup', "#MainContent_n", function (event) {
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                .replace(/([0-9]{3})/, "");
        });

    });

    //Solo porcentaje
    $("body").on('keyup', "#MainContent_TMAR", function (event) {
        this.value = this.value.match(/\d{0,3}(\.\d{0,2})?/)[0];


    });


    $("#formVANM #calcular").on('click', function (e) {

        console.log("cliiiiik");

    });


    //guardar arreglo de flujos
    $("body").on('blur', "#flujo" , function (event) {
        //Inicializamos la tabla
        var t = $('#flujosM').DataTable().draw();
        var elems = t.column(1).data().toArray();
        console.log(elems);
        $('#MainContent_datosFNE').val(JSON.stringify(elems));


    });



   
});