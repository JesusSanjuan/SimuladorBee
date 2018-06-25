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
    $('#dataTableVAN').DataTable({
        language: {
            url: '//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json'
        },
        data: DTabla
    });
});

function Modal(Texto) {
    TTexto = JSON.parse(JSON.stringify(Texto));
    $(document).ready(function () {
        $('#modal-text-body').text(TTexto);
        $('#myModal').modal({ show: true });
        $('#cerrar').click(function () {
            location.href = "#ResultadosFinales";
        });
    });
}