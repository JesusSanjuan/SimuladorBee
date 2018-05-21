// Call the dataTables jQuery plugin
var editor;

$(document).ready(function () {  
   
    $('#dataTable').DataTable({
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
            emptyTable: "last",
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
        }
    });

});




$(document).ready(function () {
    /*var i = 1;
    $("#MainContent_add_row").click(function () {
        $('#addr' + i).html("</td><td><input name='concepto" + i + "' type='text' placeholder='Concepto' class='form-control input-md'  /> </td><td><input  name='precio" + i + "' type='text' placeholder='$'  class='form-control input-md'></td>");

        $('#tab_logic').append('<tr id="addr' + (i + 1) + '"></tr>');
        i++;
    });
    $("#MainContent_delete_row").click(function () {
        if (i > 1) {
            $("#addr" + (i - 1)).html('');
            i--;
        }
    });*/

    $("#MainContent_add_row").click(function () {
        var concepto = $("#concepto").val();
        var precio = $("#precio").val();
        var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + concepto + "</td><td>" + precio + "</td></tr>";
        $("#tab_logic").append(markup);
        $("#concepto").val("");
        $("#precio").val("");
    });
    // Busca y remueve las filas seleccionadas
    $("#MainContent_delete_row").click(function () {
        $("#tab_logic").find('input[name="record"]').each(function () {
            if ($(this).is(":checked")) {
                $(this).parents("tr").remove();
            }
        });
    });




});

