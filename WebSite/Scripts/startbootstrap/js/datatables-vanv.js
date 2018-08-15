var DTabla;

function InicializarTabla(Datos) {
    DTabla = JSON.parse(JSON.stringify(Datos));     
    $(document).ready(function () {
        $('#dataTableVANC').editableTableWidget();
        $("#CapturaVAN").css("display", "block");
});

}


$(document).ready(function () {
    var events = $('#events');
    var table = $('#dataTableVANC').DataTable({
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
        data: DTabla,
        createdRow: function (row, data, dataIndex) {
            // Set the data-status attribute, and add a class
            $(row).find('td:eq(0)').attr("data-editable", "false");
            $(row).find('td:eq(1)').attr("data-editable", "false");
            $(row).find('td:eq(5)').attr("data-editable", "false");
            $(row).find('td:eq(6)').attr("data-editable", "false");

            $(row).find("td:eq( 0 )").css("background-color", "#B5B7B9");
        }
    });

    table.on('change', function (evt, newValue) {
        
            var x= newValue.replace(/\D/g, "")
                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        alert(x);
        return x;
        });


});


