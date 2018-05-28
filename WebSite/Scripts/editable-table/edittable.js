
$(document).ready(function () {
   
    $('#myTabContent').find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();   
    $(".na").html("");


    $(".add_row").click(function () {
       
        var selector = $(this).parents('.tab-pane').attr("id");
        $('#' + selector).find('table').append('<tr><td class="previous"></td><td>0</td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');

        //$('#costTable').append('<tr><td class="previous"></td><td>0</td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');
        //$('#costTable').DataTable();
        /* $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();*/
        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();       
        $(".na").html("");
    });

    $("#amort  #MainContent_add_row").click(function () {   
        $('#amortTable').append('<tr><td class="previous"></td><td>0</td><td></td><td data-editable="false"></td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');
        //$('#costTable').DataTable();
        /* $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();*/
        $('#amortTable').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    });


    $("body").on("click", ".remove", function () {
        $(this).closest("tr").remove();
    });

});

