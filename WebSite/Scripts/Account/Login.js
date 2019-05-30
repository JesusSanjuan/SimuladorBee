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
        $('#Nombval').text('Por favor igrese el nombre de usuarios.');
        $('#Nombval').show();
        User = false;
    }
    else {
        if (user.length >= 6) {
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

/*Accion de boton*/
$("#login").click(function () {
    var user = $("#NombreUsuario").val();
    var password = $("#Contrasena").val();
    if (user.length === 0) {
        $("#Nombval").addClass("invalid-feedback");
        $("#NombreUsuario").removeClass("is-valid");
        $("#NombreUsuario").addClass("is-invalid");
        $('#Nombval').text('Por favor igrese el nombre de usuarios.');
        $('#Nombval').show();
        User1 = false;
    }
    else {
        User1 = true;
    }

    if (password.length === 0) {
        $("#ContrVal").addClass("invalid-feedback");
        $("#Contrasena").removeClass("is-valid");
        $("#Contrasena").addClass("is-invalid");
        $('#ContrVal').text('Por favor igrese su contraseña.');
        $('#ContrVal').show();
        Contra1 = false;
    } else {
        Contra1 = true;
    }
    if (User === true && User1 === true && Contra === true && Contra1=== true) {
        alert("Correcto");
    }    
});
/*Accion de boton*/