// Call the dataTables jQuery plugin
var editor;

$(document).ready(function () {

    $('#dataTable').on('click', 'tbody td:not(:first-child)', function (e) {
        editor.inline(this);
    })
   
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
 /* Probando para tabla editable*/

var editor; // use a global for the submit and return data rendering in the examples

$(document).ready(function () {
    editor = new $.fn.dataTable.Editor({
        ajax: "../php/staff.php",
        table: "#example",
        fields: [{
            label: "First name:",
            name: "first_name"
        }, {
            label: "Last name:",
            name: "last_name"
        }, {
            label: "Position:",
            name: "position"
        }, {
            label: "Office:",
            name: "office"
        }, {
            label: "Extension:",
            name: "extn"
        }, {
            label: "Start date:",
            name: "start_date",
            type: "datetime"
        }, {
            label: "Salary:",
            name: "salary"
        }
        ]
    });

    // Activate an inline edit on click of a table cell
    $('#example').on('click', 'tbody td:not(:first-child)', function (e) {
        editor.inline(this);
    });

    $('#example').DataTable({
        dom: "Bfrtip",
        order: [[1, 'asc']],
        columns: [
            {
                data: null,
                defaultContent: '',
                className: 'select-checkbox',
                orderable: false
            },
            { data: "first_name" },
            { data: "last_name" },
            { data: "position" },
            { data: "office" },
            { data: "start_date" },
            { data: "salary", render: $.fn.dataTable.render.number(',', '.', 0, '$') }
        ],
        select: {
            style: 'os',
            selector: 'td:first-child'
        },
        buttons: [
            { extend: "create", editor: editor },
            { extend: "edit", editor: editor },
            { extend: "remove", editor: editor }
        ]
    });
});

 /* Probando para tabla editable*/



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

