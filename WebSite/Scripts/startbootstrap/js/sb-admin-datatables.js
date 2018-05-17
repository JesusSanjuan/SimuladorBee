// Call the dataTables jQuery plugin


/*$(document).ready(function () {
  $('#dataTable').DataTable();
});*/




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