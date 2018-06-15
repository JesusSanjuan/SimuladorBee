
var ctx = document.getElementById("dataTableVAN");


$(document).ready(function ($) {

    
    var data = [
        [
            "Tiger Nixon",
            "System Architect",
            "Edinburgh",
            "5421",
            "2011/04/25",
            "$3,120"
        ],
        [
            "Garrett Winters",
            "Director",
            "Edinburgh",
            "8422",
            "2011/07/25",
            "$5,300"
        ]
    ]

    var table = $('#dataTableVAN').DataTable({
                language: {
                    processing: "Obteniendo resultados...",
                    search: "Buscar en la tabla:",
                    lengthMenu: "Ver _MENU_ resultados",
                    info: "Visualizacion de los resultados: _START_ al _END_ de un total de _TOTAL_ resultados",
                    infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
                    infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "Cero registros",
                    emptyTable: "Ultimo",
                    paginate: {
                        first: "Primera",
                        previous: "Pagina Anterior",
                        next: "Pagina Siguiente",
                        last: "Anterior"
                    },
                    aria: {
                        sortAscending: ": Activar para ordenar la columna en orden ascendente",
                        sortDescending: ": Activar para ordenar la columna en orden descendente"
                    }
                    },
                    data: data
            });
    

});


    


/*function Ingreso_datos(ArregloDatos) {
    alert(ArregloDatos);
    var data = JSON.parse(JSON.stringify(ArregloDatos));
    $('##dataTableVAN').DataTable({
        data: data
    });
}

function formatoMoneda(number) {

    var number1 = number.toString(), result = '', estado = true;
    if (parseInt(number1) < 0) {
        estado = false;
        number1 = parseInt(number1) * -1;
        number1 = number1.toString();
    }
    if (number1.indexOf(',') == -1) {
        while (number1.length > 3) {
            result = '.' + '' + number1.substr(number1.length - 3) + '' + result;
            number1 = number1.substring(0, number1.length - 3);
        }
        result = number1 + result;
        if (estado == false) {
            result = '-' + result;
        }
    }
    else {
        var pos = number1.indexOf(',');
        var numberInt = number1.substring(0, pos);
        var numberDec = number1.substring(pos, number1.length);
        while (numberInt.length > 3) {
            result = '.' + '' + numberInt.substr(numberInt.length - 3) + '' + result;
            numberInt = numberInt.substring(0, numberInt.length - 3);
        }
        result = numberInt + result + numberDec;
        if (estado == false) {
            result = '-' + result;
        }
    }
    return result;
} */




 /*   $(function () {
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
    });*/




