
$(document).ready(function () {
   
    //$('#myTabContent').find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();   
    //$(".na").html("");


    $('#myTabContent').find('table').DataTable();
    


   /* $(".add_row").click(function () {
       
        var selector = $(this).parents('.tab-pane').attr("id");
        $('#' + selector).find('table').append('<tr><td class="previous"></td><td>0</td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');

        //$('#costTable').append('<tr><td class="previous"></td><td>0</td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');
        //$('#costTable').DataTable();
        /* $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();*/
       /* $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();       
        $(".na").html("");
    });*/

    $('.add_row').on('click', function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable();

        t.row.add([
           '',
           '0',
           '<i  class="fa fa-times fa-3 remove" aria-hidden="true"></i>'
        ]).draw();

        $('#' + selector).find('table').find('td:last').prev().prev().addClass('previous');

        $('#' + selector).find('table').find('td:last').attr("data-editable", "false");


        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    });

    // Automatically add a first row of data

    $("body").on("click", ".save_data", function () {
        var selector = $(this).parents('.tab-pane').attr("id");
        var table = $('#' + selector).find('table').DataTable();
        

        var data = table.rows().data().toArray();

        var array = [];

        for (var i = 0; i < data.length; i++) {
            var obj = data[i];
            array[i] = [];

            for (var key = 0; key < obj.length-1; key++) {
                var value = obj[key];
                array[i][key] = value;
                
            }
        }

        var myJsonString = JSON.stringify(array);
        
        console.log('The table has ' + myJsonString + ' records');

       
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
        var selector = $(this).parents('.tab-pane').attr("id");
        var table = $('#' + selector).find('table').DataTable();
    });

});

