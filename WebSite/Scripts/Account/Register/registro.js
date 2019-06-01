$('#nick_name').keyup(function (event) {
    var nameNick = $("#nick_name").val();
    if (nameNick.length === 0) {
        $("#nick_nameVal").addClass("invalid-feedback");
        $("#nick_name").removeClass("is-validado");
        $("#nick_name").addClass("is-invalidado");
        $('#nick_nameVal').text('Por favor igrese su nick-name');
        $('#nick_nameVal').show();
    } else {
        if (nameNick.length >= 4) {

            $.ajax({
                type: "POST",
                url: "Register.aspx/Nick",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                data: JSON.stringify({ NickName: nameNick}),
                success: function (data) {
                    var valores = JSON.parse(data.d);
                   
                },
                error: function (err) {
                    console.log(err);
                    console.log(err.responseText);
                }
            }).done(function (data) {

            }).fail(function (data) {
                console.log("Error: " + data);
            }).always(function () {
            }).then(function (data) {
            });



            $("#nick_name").removeClass("is-invalidado");
            $("#nick_name").addClass("is-validado");
            $('#nick_nameVal').hide();
        }
        else {
            $("#nick_nameVal").addClass("invalid-feedback");
            $("#nick_name").removeClass("is-validado");
            $("#nick_name").addClass("is-invalidado");
            $('#nick_nameVal').text('El nick-name de usuario es muy corto');
            $('#nick_nameVal').show();
        }

    }
});

$('#name').keyup(function (event) {
    var name = $("#name").val();
    if (name.length === 0) {
        $("#nameVal").addClass("invalid-feedback");
        $("#name").removeClass("is-validado");
        $("#name").addClass("is-invalidado");
        $('#nameVal').text('Por favor igrese su nombre');
        $('#nameVal').show();
    } else {
        if (name.length >= 4) {
            $("#name").removeClass("is-invalidado");
            $("#name").addClass("is-validado");
            $('#nameVal').hide();
        }
        else {
            $("#nameVal").addClass("invalid-feedback");
            $("#name").removeClass("is-validado");
            $("#name").addClass("is-invalidado");
            $('#nameVal').text('El nombre de usuario es muy corto');
            $('#nameVal').show();          
        }

    }
});



/*Accion de boton*/
$("#registro").click(function () {
    alert();
});
/*Accion de boton*/