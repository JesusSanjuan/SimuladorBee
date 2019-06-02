﻿var nameNick1 = false, name1 = false, AppPatern1 = false, AppMater1 = false, Instituc1 = false, countr1 = false, password_rep1 = false, pho1 = false, emai1 = false;
var nameNick2 = false, name2 = false, AppPatern2 = false, AppMater2 = false, Instituc2 = false, countr2 = false, password_rep2 = false, pho2 = false, emai2 = false;

/*Validacion de el nickname*/
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


$('#nick_name').keyup(function (event) {
    var nameNick = $("#nick_name").val();
    if (nameNick.length === 0) {
        $("#nick_nameVal").addClass("invalid-tooltip");
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
                    if (valores.length === 0) {
                        $("#nick_name").removeClass("is-invalidado");
                        $("#nick_name").addClass("is-validado");
                        $('#nick_nameVal').hide();
                    }
                    else { 
                        $("#nick_nameVal").addClass("invalid-tooltip");
                        $("#nick_name").removeClass("is-validado");
                        $("#nick_name").addClass("is-invalidado");
                        $('#nick_nameVal').text('El nick-name ya se encuentra en uso');
                        $('#nick_nameVal').show();
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
        else {
            $("#nick_nameVal").addClass("invalid-tooltip");
            $("#nick_name").removeClass("is-validado");
            $("#nick_name").addClass("is-invalidado");
            $('#nick_nameVal').text('El nick-name de usuario es muy corto');
            $('#nick_nameVal').show();
        }
    }
});
/*Validacion de el nickname*/

/*Validacion de el nombre*/
const number2 = document.querySelector('.validacion2');
function formatNumber2(n2) { //Faltas aceptar un espacio para 2 nombres
    return n2.replace(/\W|[0-9]/g, "")
        .replace(/^[0-9]*/, "");
}
number2.addEventListener('keyup', (e) => {
    const element2 = e.target;
    const value2 = element2.value;
    element2.value = formatNumber2(value2);
});

$('#name').keyup(function (event) {
    var name = $("#name").val();
    if (name.length === 0) {
        $("#nameVal").addClass("invalid-tooltip");
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
            $("#nameVal").addClass("invalid-tooltip");
            $("#name").removeClass("is-validado");
            $("#name").addClass("is-invalidado");
            $('#nameVal').text('El nombre de usuario es muy corto');
            $('#nameVal').show();          
        }
    }
});
/*Validacion de el nombre*/

/*Validacion de el Apellido Paterno*/
const number3 = document.querySelector('.validacion3');
function formatNumber3(n2) { 
    return n2.replace(/\W|[0-9]/g, "")
        .replace(/^[0-9]*/, "");
}
number3.addEventListener('keyup', (e) => {
    const element2 = e.target;
    const value2 = element2.value;
    element2.value = formatNumber3(value2);
});

$('#AppPaterno').keyup(function (event) {
    var AppPatern = $("#AppPaterno").val();
    if (AppPatern.length === 0) {
        $("#AppPatVal").addClass("invalid-tooltip");
        $("#AppPaterno").removeClass("is-validado");
        $("#AppPaterno").addClass("is-invalidado");
        $('#AppPatVal').text('Por favor igrese su nombre');
        $('#AppPatVal').show();
    } else {
        if (AppPatern.length >= 4) {
            $("#AppPaterno").removeClass("is-invalidado");
            $("#AppPaterno").addClass("is-validado");
            $('#AppPatVal').hide();
        }
        else {
            $("#AppPatVal").addClass("invalid-tooltip");
            $("#AppPaterno").removeClass("is-validado");
            $("#AppPaterno").addClass("is-invalidado");
            $('#AppPatVal').text('El apellido es muy corto');
            $('#AppPatVal').show();
        }
    }
});
/*Validacion de el Apellido Paterno*/

/*Validacion de el Apellido Materno*/
const number4 = document.querySelector('.validacion4');
function formatNumber4(n2) {
    return n2.replace(/\W|[0-9]/g, "")
        .replace(/^[0-9]*/, "");
}
number4.addEventListener('keyup', (e) => {
    const element2 = e.target;
    const value2 = element2.value;
    element2.value = formatNumber4(value2);
});
$('#AppMaterno').keyup(function (event) {
    var AppMater = $("#AppMaterno").val();
    if (AppMater.length === 0) {
        $("#AppMatVal").addClass("invalid-tooltip");
        $("#AppMaterno").removeClass("is-validado");
        $("#AppMaterno").addClass("is-invalidado");
        $('#AppMatVal').text('Por favor igrese su nombre');
        $('#AppMatVal').show();
    } else {
        if (AppMater.length >= 4) {
            $("#AppMaterno").removeClass("is-invalidado");
            $("#AppMaterno").addClass("is-validado");
            $('#AppMatVal').hide();
        }
        else {
            $("#AppMatVal").addClass("invalid-tooltip");
            $("#AppMaterno").removeClass("is-validado");
            $("#AppMaterno").addClass("is-invalidado");
            $('#AppMatVal').text('El apellido es muy corto');
            $('#AppMatVal').show();
        }
    }
});
/*Validacion de el Apellido Materno*/

/*Validacion de Institucion*/
$("#Institucion").change(function () {
    var Instituc = $("#Institucion").val();
    if (Instituc.length === 0) {
        $("#InstitucionVal").addClass("invalid-tooltip");
        $("#Institucion").removeClass("is-validado");
        $("#Institucion").addClass("is-invalidado");
        $('#InstitucionVal').text('Por seleccione una institucion');
        $('#InstitucionVal').show();
    }
    else {
        $("#Institucion").removeClass("is-invalidado");
        $("#Institucion").addClass("is-validado");
        $('#InstitucionVal').hide();
    }
});
/*Validacion de Institucion*/

/*Validacion de Pais*/
$("#country").change(function () {
    var countr = $("#country").val();
    if (countr.length === 0) {
        $("#countryVal").addClass("invalid-tooltip");
        $("#country").removeClass("is-validado");
        $("#country").addClass("is-invalidado");
        $('#countryVal').text('Por seleccione su pais');
        $('#countryVal').show();
    }
    else {
        $("#country").removeClass("is-invalidado");
        $("#country").addClass("is-validado");
        $('#countryVal').hide();
    }
});
/*Validacion de Pais*/

/*Validacion de Contraseña*/
$('#password').keyup(function (event) {
    var passwo = $("#password").val();
    if (passwo.length === 0) {
        $("#passwVal").addClass("invalid-tooltip");
        $("#password").removeClass("is-validado");
        $("#password").addClass("is-invalidado");
        $('#passwVal').text('Por favor igrese su contraseña');
        $('#passwVal').show();
        $("#password_repit").prop('readonly', true);
        $("#password_repit").removeClass("is-invalidado");
        $('#password_repitVal').hide();
    } else {
        if (passwo.length >= 6) {
            $("#password").removeClass("is-invalidado");
            $("#password").addClass("is-validado");
            $('#passwVal').hide();
            $("#password_repit").prop('readonly', false);
            $("#password_repitVal").addClass("invalid-tooltip");
            $("#password_repit").removeClass("is-validado");
            $("#password_repit").addClass("is-invalidado");
            $('#password_repitVal').text('Por favor repita su contraseña');
            $('#password_repitVal').show();     
            $("#password").prop('readonly', true);  
        }
        else {
            $("#passwVal").addClass("invalid-tooltip");
            $("#password").removeClass("is-validado");
            $("#password").addClass("is-invalidado");
            $('#passwVal').text('La contraseña es muy corta');
            $('#passwVal').show();
            $("#password_repit").prop('readonly', true);            
        }
    }
});


$('#password').click(function (event) {
    var password_rep = $("#password_repit").val();
    if (password_rep > 0) {
        $('#passwValMod').text('Para modificar borre completamente la repeticion de contraseña');
        $('#passwValMod').show();
    }
});
$('#password_repit').keyup(function (event) {
    var passwo = $("#password").val();
    var password_rep = $("#password_repit").val();
    if (password_rep.length === 0) {
        $("#password_repitVal").addClass("invalid-tooltip");
        $("#password_repit").removeClass("is-validado");
        $("#password_repit").addClass("is-invalidado");
        $('#password_repitVal').text('Por favor igrese su contraseña de nuevo');
        $('#password_repitVal').show();
        $("#password").prop('readonly', false);  
        $('#passwValMod').hide();
    } else {
        if (password_rep.length >= 6) {
            if (passwo === password_rep) {
                $("#password_repit").removeClass("is-invalidado");
                $("#password_repit").addClass("is-validado");
                $('#password_repitVal').hide();
            }
            else {
                $("#password_repit").removeClass("is-validado");
                $("#password_repit").addClass("is-invalidado");
                $('#password_repitVal').text('Las contraseña no coinciden');
                $('#password_repitVal').show();
            }           
        }
        else {
            $("#password_repitVal").addClass("invalid-tooltip");
            $("#password_repit").removeClass("is-validado");
            $("#password_repit").addClass("is-invalidado");
            $('#password_repitVal').text('La contraseña es muy corta');
            $('#password_repitVal').show();
        }
    }
});
/*Validacion de Contraseña*/

/*Validacion de telefono*/
const number5 = document.querySelector('.validacion5');
function formatNumber5(n2) {
    return n2.replace(/\D/g, "");
}
number5.addEventListener('keyup', (e) => {
    const element2 = e.target;
    const value2 = element2.value;
    element2.value = formatNumber5(value2);
});
$('#phone').keyup(function (event) {
    var pho = $("#phone").val();
    if (pho.length === 0) {
        $("#phoneVal").addClass("invalid-tooltip");
        $("#phone").removeClass("is-validado");
        $("#phone").addClass("is-invalidado");
        $('#phoneVal').text('Por favor igrese su numero telefonico');
        $('#phoneVal').show();
    } else {
        if (pho.length >= 10 && pho.length <= 10 ) {
            $("#phone").removeClass("is-invalidado");
            $("#phone").addClass("is-validado");
            $('#phoneVal').hide();
        }
        else {
            $("#phoneVal").addClass("invalid-tooltip");
            $("#phone").removeClass("is-validado");
            $("#phone").addClass("is-invalidado");
            $('#phoneVal').text('Longitud incorrecta');
            $('#phoneVal').show();
        }
    }
});
/*Validacion de telefono*/

/*Validacion de correo*/
var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
$('#email').keyup(function (event) {
    var emai = $("#email").val();
    if (emai.length === 0) {
        $("#emailVal").addClass("invalid-tooltip");
        $("#email").removeClass("is-validado");
        $("#email").addClass("is-invalidado");
        $('#emailVal').text('Por favor igrese su correo');
        $('#emailVal').show();
    } else {
        if (regex.test($('#email').val().trim())) {
            $("#email").removeClass("is-invalidado");
            $("#email").addClass("is-validado");
            $('#emailVal').hide();
        } else {
            $("#emailVal").addClass("invalid-tooltip");
            $("#email").removeClass("is-validado");
            $("#email").addClass("is-invalidado");
            $('#emailVal').text('Correo Incorrecto');
            $('#emailVal').show();
        }
    }
});
/*Validacion de correo*/

/*Accion de boton*/
$("#registro").click(function () {
    var nameNick = $("#nick_name").val();
    var name = $("#name").val();
    var AppPatern = $("#AppPaterno").val();
    var AppMater = $("#AppMaterno").val();
    var Instituc = $("#Institucion").val();
    var countr = $("#country").val();
    var password_rep = $("#password_repit").val();
    var pho = $("#phone").val();
    var emai = $("#email").val();
});
/*Accion de boton*/