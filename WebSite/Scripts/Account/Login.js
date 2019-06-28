var User = false, User1 = false, Contra = false, Contra1 = false;

/*Validacion de el nombre de usuario*/
const number = document.querySelector('.validacion');
function formatNumber(n) {
        return n.replace(/^[0-9]*/, "")
            .replace(/^[A-Za-z][A-Za-z][0-9]/, "")
            .replace(/\s\w*/g, "")
            .replace(/\W/g, "");    
    }
    number.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber(value);
    });


$('#NombreUsuario').keyup(function (event) {
    var user = $("#NombreUsuario").val();
    if (user.length === 0) {
        $("#Nombval").addClass("invalid-feedback");
        $("#NombreUsuario").removeClass("is-valid");
        $("#NombreUsuario").addClass("is-invalid");
        $('#Nombval').text('Por favor igrese su usuario');
        $('#Nombval').show();
        User = false;
    }
    else {
        if (user.length >= 4) {
            $("#NombreUsuario").removeClass("is-invalid");
            $("#NombreUsuario").addClass("is-valid");
            $('#Nombval').hide();
            User = true;
        }
        else {
            $("#Nombval").addClass("invalid-feedback");
            $("#NombreUsuario").removeClass("is-valid");
            $("#NombreUsuario").addClass("is-invalid");
            $('#Nombval').text('El nombre de usuario es muy corto');
            $('#Nombval').show();
            User = false;
        }
    }
});
/*Validacion de el nombre de usuario*/

/*Validacion de el nombre de la contraseña*/
$('#Contrasena').keyup(function (event) {
    var password = $("#Contrasena").val();
    if (password.length === 0) {
        $("#ContrVal").addClass("invalid-feedback");
        $("#Contrasena").removeClass("is-valid");
        $("#Contrasena").addClass("is-invalid");
        $('#ContrVal').text('Por favor igrese su contraseña.');
        $('#ContrVal').show();
        Contra = false;
    } else {
        if (password.length >= 6) {
            $("#Contrasena").removeClass("is-invalid");
            $("#Contrasena").addClass("is-valid");
            $('#ContrVal').hide();
            Contra = true;
        }
        else {
            $("#ContrVal").addClass("invalid-feedback");
            $("#Contrasena").removeClass("is-valid");
            $("#Contrasena").addClass("is-invalid");
            $('#ContrVal').text('La contraseña es muy corta');
            $('#ContrVal').show();
            Contra = false;
        }
    }
});
/*Validacion de el nombre de la contraseña*/
var userValor;
var password;
checado = new Boolean(false);
/*Accion de boton*/
$("#login").click(function () {
    userValor = $("#NombreUsuario").val();
    password = $("#Contrasena").val();
    if (userValor.length === 0) {
        $("#Nombval").addClass("invalid-feedback");
        $("#NombreUsuario").removeClass("is-valid");
        $("#NombreUsuario").addClass("is-invalid");
        $('#Nombval').text('Por favor igrese su usuario');
        $('#Nombval').show();
        User1 = false;
    }
    else {
        if (userValor.length >= 4) {
            $("#NombreUsuario").removeClass("is-invalid");
            $("#NombreUsuario").addClass("is-valid");
            $('#Nombval').hide();
            User1 = true;
        }
        else {
            $("#Nombval").addClass("invalid-feedback");
            $("#NombreUsuario").removeClass("is-valid");
            $("#NombreUsuario").addClass("is-invalid");
            $('#Nombval').text('El nombre de usuario es muy corto');
            $('#Nombval').show();
            User1 = false;
        }
    }

    if (password.length === 0) {
        $("#ContrVal").addClass("invalid-feedback");
        $("#Contrasena").removeClass("is-valid");
        $("#Contrasena").addClass("is-invalid");
        $('#ContrVal').text('Por favor igrese su contraseña.');
        $('#ContrVal').show();
        Contra1 = false;
    } else {
        if (password.length >= 6) {
            $("#Contrasena").removeClass("is-invalid");
            $("#Contrasena").addClass("is-valid");
            $('#ContrVal').hide();
            Contra1 = true;
        }
        else {
            $("#ContrVal").addClass("invalid-feedback");
            $("#Contrasena").removeClass("is-valid");
            $("#Contrasena").addClass("is-invalid");
            $('#ContrVal').text('La contraseña es muy corta');
            $('#ContrVal').show();
            Contra1 = false;
        }
    }
    
    if (User === true && User1 === true && Contra === true && Contra1 === true) {
            
        if ($('#Remember').prop('checked')) {
            checado = true;
        }

        $.ajax({
            type: "POST",
            url: "Login.aspx/Iniciosecion",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: true,
            data: JSON.stringify({ UserName: userValor, Password: password, Checked: checado }),
            success: function (data) {
                var valores = JSON.parse(data.d);   
                if (valores[0] === "NO") {
                    $('#modalLogin').modal({ show: true });
                } else { 
                    alert("Exepcion de: "+valores[2]);
                    if (valores[1] === null) {
                        location.href = "../";
                    }
                    else {
                        valores[1] = valores[1].replace(".aspx", "");
                        location.href = ".." + valores[1];
                    }
                }
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

    }    
});
/*Accion de boton*/