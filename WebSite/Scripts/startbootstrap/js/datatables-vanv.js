var DTabla;

function InicializarTabla(Datos) {
    DTabla = JSON.parse(JSON.stringify(Datos));     
    $(document).ready(function () {
        $('#dataTableVANC').editableTableWidget();
        $("#CapturaVAN").css("display", "block");
});

}


$(document).ready(function () {
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

        createdRow: function (row, data, dataIndex) {
            // Set the data-status attribute, and add a class
            $(row).find('td:eq(0)').attr("data-editable", "false");
            $(row).find('td:eq(1)').attr("data-editable", "false");
            $(row).find('td:eq(5)').attr("data-editable", "false");
            $(row).find('td:eq(6)').attr("data-editable", "false");

            $(row).find("td:eq( 2 )").css("color", "red");
        },

        data: DTabla
    });

    $(row).find('td:eq(2)').attr("data-editable", "false");
    $(row).find('td:eq(3)').attr("data-editable", "false");
    $(row).find('td:eq(4)').attr("data-editable", "false");


    $("#dataTableVANC").find('td:last').attr("data-editable", "false");
    $("#dataTableVANC").find('td').eq(3).attr("data-editable", "false");
    $("#dataTableVANC").find('td:last').prev().attr("data-editable", "false"); 
    
});


