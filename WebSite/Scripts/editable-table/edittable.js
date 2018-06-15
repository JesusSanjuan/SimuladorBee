
$(document).ready(function () {

     $('#myTabContent').find('table').DataTable({
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        }
    });




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

        $('#' + selector).find('table').find('td').on('change', function (evt, newValue) {
            var selector = $(this).parents('.tab-pane').attr("id");
            var t = $('#' + selector).find('table').DataTable()
            console.log(newValue);
            t.cell(this).data(newValue);

        });
        
       
    });

    /*$("body").on("change", "table td", function (evt, newValue) {
    //$('#myTabContent').find('table').find('td').on('change', function (evt, newValue) {
        var selector = $(this).parents('.tab-pane').attr("id");
        var t = $('#' + selector).find('table').DataTable()
        console.log(newValue);
        t.cell(this).data(newValue);
      
    });*/

   
    // Automatically add a first row of data

    $("body").on("click", ".save_data", function () {

        var selector = $(this).parents('.tab-pane').attr("id");
        //var table = $('#' + selector).find('table').DataTable();


        var data = $('#' + selector).find('table').tableToJSON();
   

        var myJsonString = JSON.stringify(data);

        console.log(myJsonString);
        
       // console.log('The table has ' + myJsonString + ' records');
       /* $.ajax({
            error: function (data) {
                console.log('error  ' + data);
            },
            type: "POST",
            url: "../../Simulador/costos.aspx/getTable",
            data: myJsonString,
            dataType: "json",
            contentType: 'application/json; charset=utf-8',
            success: function (Datos) {
                console.log('sucess  ');
            }
        });*/



       
    });

    $("#amort  #MainContent_add_row").click(function () {   
        $('#amortTable').append('<tr><td class="previous"></td><td>0</td><td></td><td data-editable="false"></td><td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td></tr>');
        //$('#costTable').DataTable();
        /* $('#mainTable').editableTableWidget().numericInputExample().find('td:first').focus();*/
        $('#amortTable').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    });



    $("body").on("click", ".remove", function () {

        var selector = $(this).parents('.tab-pane').attr("id");
        var table = $('#' + selector).find('table').DataTable();

        table.row($(this).parents('tr')).remove().draw();

        $('#' + selector).find('table').find('td:last').prev().prev().addClass('previous');
        $('#' + selector).find('table').find('td:last').attr("data-editable", "false");
        $('#' + selector).find('table').editableTableWidget({ editor: $('<input class="form-control">') }).numericInputExample().find('.previous').focus();
        $(".na").html("");
    });


    /*$("body").on("click", ".remove", function () {
        $(this).closest("tr").remove();
        var selector = $(this).parents('.tab-pane').attr("id");
        var table = $('#' + selector).find('table').DataTable();
    });*/


});

