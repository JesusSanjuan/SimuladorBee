var DTabla;

function RellenarTabla(Datos) {    
    DTabla = JSON.parse(JSON.stringify(Datos)); 

  
    for (var i = 0; i < DTabla.length; i++) {
        for (var j = 2; j < DTabla[i].length; j++) {
            var Dato = DTabla[i][j];
            var resultadoFormato = number_format(Dato, 2);
            var res;
            if (Dato != '')
            {            
                if (Dato < 0)
                {
                    var str1 = "$-";
                    res = str1.concat(resultadoFormato);
                }
                else
                {
                    var str1 = "$";
                    res = str1.concat(resultadoFormato);
                }
                DTabla[i][j] = res;
            }
        }
    }
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

$(document).ready(function () {
    var table = $('#dataTableVAN').DataTable({
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
        data: DTabla
    });
});

function Modal(Resultado) {
    ResultadoVPN = JSON.parse(JSON.stringify(Resultado));
      
    $(document).ready(function () {
        var Texto, Imagen,audio;
        if (ResultadoVPN > 0) {
            Texto = "Se recomienda aceptar la inversion";
            Imagen = '<img src="../Scripts/startbootstrap/correcto.gif" class="img-fluid" width="100" height="100" alt="Responsive image"/>';
            audio = '<source type = "audio/mp3" src = "../Scripts/startbootstrap/correcto.mp3" >';
        }
        else {
            Texto = "Se recomienda rechazar la inversion";
            Imagen = '<img src="../Scripts/startbootstrap/alerta.gif" class="img-fluid" width="100" height="100" alt="Responsive image"/>';
        }        

        $('#imgmodal').html(Imagen);
        $('#texmodal').html(Texto);
        $('#audio').html(audio);
        $('#myModal').modal({ show: true });
        var audio = document.getElementById("audio");
        audio.play();
        $('#cerrar').click(function () {
            location.href = "#ResultadosFinales";
        });
    });
}