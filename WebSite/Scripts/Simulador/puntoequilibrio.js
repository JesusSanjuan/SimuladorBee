$(document).ready(function () {
    //verificar si la session id_proyect existe 
    var id_proyecto;
    $.ajax({
        async: false,
        cache: false,
        type: "POST",
        url: "amortizacion.aspx/buscarID_proyect",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (result) {
            if (result.d != "false") {
                var data = JSON.parse(result.d);
                id_proyecto = data[0];
                //visualizamos el mensaje de succes
                VanillaToasts.create({
                    title: 'SimuladorBee',
                    text: "Proyecto <strong>¡" + data[1] + "!</strong> cargado...",
                    type: 'success',
                    icon: '../multimedia/favicon.ico',
                    timeout: 25000
                });
            }
            else {
                toastr.warning('Le recomendamos cargar un proyecto para guardar su informacion (Dando click en este mensaje sera redirigido)', 'Cargue su proyecto', {
                    closeButton: false,
                    debug: false,
                    newestOnTop: true,
                    progressBar: true,
                    positionClass: "toast-bottom-full-width",
                    preventDuplicates: false,
                    onclick: saludo(),
                    showDuration: 1500,
                    hideDuration: 1500,
                    timeOut: "15000",
                    extendedTimeOut: "10000",
                    showEasing: "swing",
                    hideEasing: "linear",
                    showMethod: "slideDown",
                    hideMethod: "slideUp",
                    closeMethod: false,
                    closeDuration: false,
                    closeEasing: false,
                    tapToDismiss: false
                });      
                id_proyecto = "false";
            }

        },
        error: function (err) {
            console.log(err);
            console.log(err.responseText);
        }
    }).done(function (data) {
        //console.log(data);
    }).fail(function (data) {
        console.log("Error: " + data);
    });

    function saludo() {
        $(document).on('click', '.toast2', function () {
            location.href = "Index";
        });
    }

    var completeC = false;
    $('#cnperiodo.selectpicker').on('change', function () {//obtener datos cuando el periodo cambie
        if (completeC == true)
            cargar_data_amort();
    });


    /*********** SCRIPTS PARA EL CONTENT PUNTO DE EQUILIBRIO ********/
    var pathname = window.location.pathname;

    if (id_proyecto !== "false" && pathname === "/Simulador/puntoequilibrio") {

        $.ajax({
            type: "POST",
            url: "puntoequilibrio.aspx/get_costos_fijosT",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idProyecto: id_proyecto }),
            success: function (result) {
                var resultado = JSON.parse(result.d);
                var sumT = 0;
                for (var i = 0; i < resultado.length; i++) {
                    for (var j = 0; j < resultado[i].length; j++) {
                        var res = JSON.parse(resultado[i][j]);
                        for (var k = 0; k < res.length; k++) {
                            var obj = res[k];
                            if (obj["Tipo"] === "Fijo") {
                                sumT = parseFloat(sumT) + parseFloat(obj["$ Costo Total"]);
                            }
                        }
                    }
                }
                $("#costosFijos").val(sumT);
                $("#costosFijos2").val(sumT);
                $("#savePES").removeClass("invisible");

            },
            error: function (result) {
                console.log(result.responseText);
            }

        }).done(function (data) {
            //console.log(data);
        }).fail(function (data) {
            console.log("Error: " + data);
        });

        $.ajax({
            type: "POST",
            url: "puntoequilibrio.aspx/get_punto_equilibrio",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            async: false,
            data: JSON.stringify({ idProyecto: id_proyecto }),
            success: function (result) {
                var resultado = JSON.parse(result.d);

                if (resultado.length > 0) {
                    var precio_VU = resultado[0];
                    var costo_VU = resultado[1];
                    var PE_unidades = resultado[2];
                    var precio_V = resultado[3];
                    var costo_V = resultado[4];
                    var PE_pesos = resultado[5];
                    $("#precioVU").val(create_format_coin(precio_VU));
                    $("#costoVU").val(create_format_coin(costo_VU));
                    $("#PEU").val(create_format_coin(PE_unidades));
                    $("#precioV").val(create_format_coin(precio_V));
                    $("#costoV").val(create_format_coin(costo_V));
                    $("#PEP").val(create_format_coin(PE_pesos));
                }


            },
            error: function (result) {
                console.log(result.responseText);
            }

        }).done(function (data) {
            //console.log(data);
        }).fail(function (data) {
            console.log("Error: " + data);
        });


        $("#messageWarning").html("Datos del último cálculo de Punto Equilibrio registrado");
        $("#messageWarning").removeClass("d-none").addClass("d-block");

    }

    var costos_fijos0 = false, costos_fijos1 = false, precio0 = false, precio1 = false, costoV0 = false, costoV1 = false;
    /**********Validacion Costo fijo */
    const number = document.querySelector('.number');
    function formatNumber(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber(value);
    });

    $('#costosFijos').keyup(function (event) {
        var Costosfijos = $("#costosFijos").val();
        if (Costosfijos.length === 0) {
            $("#costosFijosval").addClass("invalid-feedback");
            $("#costosFijos").removeClass("is-valid");
            $("#costosFijos").addClass("is-invalid");
            $('#costosFijosval').text('Por favor ingrese el costo fijo.');
            $('#costosFijosval').show();
            costos_fijos0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (Costosfijos.match(reg)) {
                $("#costosFijos").removeClass("is-invalid");
                $("#costosFijos").addClass("is-valid");
                $('#costosFijosval').hide();
                costos_fijos0 = true;
            } else {
                $("#costosFijosval").addClass("invalid-feedback");
                $("#costosFijos").removeClass("is-valid");
                $("#costosFijos").addClass("is-invalid");
                $('#costosFijosval').text('Por favor ingrese mas digitos');
                $('#costosFijosval').show();
                costos_fijos0 = false;
            }
        }
    });
    /**********Validacion Costo fijo */
    /**********Validacion precio venta por unidad */
    const number2 = document.querySelector('.number2');
    function formatNumber2(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number2.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber2(value);
    });

    $('#precioVU').keyup(function (event) {
        var precioVU = $("#precioVU").val();
        if (precioVU.length === 0) {
            $("#precioVUval").addClass("invalid-feedback");
            $("#precioVU").removeClass("is-valid");
            $("#precioVU").addClass("is-invalid");
            $('#precioVUval').text('Por favor ingrese el precio de venta por unidad.');
            $('#precioVUval').show();
            precio0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (precioVU.match(reg)) {
                $("#precioVU").removeClass("is-invalid");
                $("#precioVU").addClass("is-valid");
                $('#precioVUsval').hide();
                precio0 = true;
            } else {
                $("#precioVUval").addClass("invalid-feedback");
                $("#precioVU").removeClass("is-valid");
                $("#precioVU").addClass("is-invalid");
                $('#precioVUval').text('Por favor ingrese mas digitos');
                $('#precioVUval').show();
                precio0 = false;
            }
        }
    });
    /**********Validacion precio venta por unidad */
    /**********Validacion del costo variale por unidad */
    const number3 = document.querySelector('.number3');
    function formatNumber3(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number3.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber3(value);
    });

    $('#costoVU').keyup(function (event) {
        var costoVU = $("#costoVU").val();
        if (costoVU.length === 0) {
            $("#costoVUval").addClass("invalid-feedback");
            $("#costoVU").removeClass("is-valid");
            $("#costoVU").addClass("is-invalid");
            $('#costoVUval').text('Por favor ingrese el costo variable por unidad.');
            $('#costoVUval').show();
            costoV0 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (costoVU.match(reg)) {
                $("#costoVU").removeClass("is-invalid");
                $("#costoVU").addClass("is-valid");
                $('#costoVval').hide();
                costoV0 = true;
            } else {
                $("#costoVUval").addClass("invalid-feedback");
                $("#costoVU").removeClass("is-valid");
                $("#costoVU").addClass("is-invalid");
                $('#costoVUval').text('Por favor ingrese mas digitos');
                $('#costoVUval').show();
                costoV0 = false;
            }
        }
    });
    /**********Validacion del costo variale por unidad */
    $("#calc_PEU").on('click', function () {

        var costos_fijos = $("#costosFijos").val();
        var precio = $("#precioVU").val();
        var costoV = $("#costoVU").val();

        /**********Validacion Costo fijo */
        if (costos_fijos.length === 0) {
            $("#costosFijosval").addClass("invalid-feedback");
            $("#costosFijos").removeClass("is-valid");
            $("#costosFijos").addClass("is-invalid");
            $('#costosFijosval').text('Por favor ingrese el costo fijo.');
            $('#costosFijosval').show();
            costos_fijos1 = false;
        } else {
            costos_fijos1 = true;
        }
        /**********Validacion Costo fijo */
        /**********Validacion precio de venta por unidad */
        if (precio.length === 0) {
            $("#precioVUval").addClass("invalid-feedback");
            $("#precioVU").removeClass("is-valid");
            $("#precioVU").addClass("is-invalid");
            $('#precioVUval').text('Por favor ingrese el precio de venta por unidad.');
            $('#precioVUval').show();
            precio1 = false;
        } else {
            precio1 = true;
        }
        /**********Validacion precio de venta por unidad */
        /**********Validacion Costo variable por unidad */
        if (costoV.length === 0) {
            $("#costoVUval").addClass("invalid-feedback");
            $("#costoVU").removeClass("is-valid");
            $("#costoVU").addClass("is-invalid");
            $('#costoVUval').text('Por favor ingrese el costo varible por unidad.');
            $('#costoVUval').show();
            costoV1 = false;
        } else {
            costoV1 = true;
        }
        /**********Validacion Costo variable por unidad */
        /********Calculo**********/
        if (costos_fijos0 === true && costos_fijos1 === true && precio0 === true && precio1 === true && costoV0 === true && costoV1 === true) {
            costos_fijos = remove_format_coin(costos_fijos);
            precio = remove_format_coin(precio);
            costoV = remove_format_coin(costoV);

            var punto_equilibrio = parseFloat(costos_fijos) / (parseFloat(precio) - parseFloat(costoV));
            $('#PEU').val(create_format_coin(punto_equilibrio));
        }else {
            $('#PEU').val("");
        }
        /********Calculo**********/
    });


    var costoV2 = false, costoV3 = false, precio2 = false, precio3 = false, costos_fijos2 = false, costos_fijos3 = false;
    /**********Validacion del Costo fijo */
    const number4 = document.querySelector('.number4');
    function formatNumber4(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number4.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber4(value);
    });
    $('#costosFijos2').keyup(function (event) {
        var costosFijos2 = $("#costosFijos2").val();
        if (costosFijos2.length === 0) {
            $("#costosFijos2val").addClass("invalid-feedback");
            $("#costosFijos2").removeClass("is-valid");
            $("#costosFijos2").addClass("is-invalid");
            $('#costosFijos2val').text('Por favor ingrese el costo fijo.');
            $('#costosFijos2val').show();
            costos_fijos2 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (costosFijos2.match(reg)) {
                $("#costosFijos2").removeClass("is-invalid");
                $("#costosFijos2").addClass("is-valid");
                $('#costosFijos2val').hide();
                costos_fijos2 = true;
            } else {
                $("#costosFijos2val").addClass("invalid-feedback");
                $("#costosFijos2").removeClass("is-valid");
                $("#costosFijos2").addClass("is-invalid");
                $('#costosFijos2val').text('Por favor ingrese mas digitos');
                $('#costosFijos2val').show();
                costos_fijos2 = false;
            }
        }
    });
    /**********Validacion del Costo fijo */

    /**********Validacion del precio de venta */
    const number5 = document.querySelector('.number5a');
    function formatNumber5a(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number5.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber5a(value);
    });
    $('#precioV').keyup(function (event) {
        var precioV = $("#precioV").val();
        if (precioV.length === 0) {
            $("#precioVval").addClass("invalid-feedback");
            $("#precioV").removeClass("is-valid");
            $("#precioV").addClass("is-invalid");
            $('#precioVval').text('Por favor ingrese el precio de venta.');
            $('#precioVval').show();
            precio2 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (precioV.match(reg)) {
                $("#precioV").removeClass("is-invalid");
                $("#precioV").addClass("is-valid");
                $('#precioVval').hide();
                precio2 = true;
            } else {
                $("#precioVval").addClass("invalid-feedback");
                $("#precioV").removeClass("is-valid");
                $("#precioV").addClass("is-invalid");
                $('#precioVval').text('Por favor ingrese mas digitos');
                $('#precioVval').show();
                precio2 = false;
            }
        }
    });
    /**********Validacion del precio de venta */

    /**********Validacion del costo de venta */
    const number6 = document.querySelector('.number6');
    function formatNumber6(n) {
        return n.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
    }
    number6.addEventListener('keyup', (e) => {
        const element = e.target;
        const value = element.value;
        element.value = formatNumber6(value);
    });
    $('#costoV').keyup(function (event) {
        var costoV = $("#costoV").val();
        if (costoV.length === 0) {
            $("#costoVval").addClass("invalid-feedback");
            $("#costoV").removeClass("is-valid");
            $("#costoV").addClass("is-invalid");
            $('#costoVval').text('Por favor ingrese el costo de venta.');
            $('#costoVval').show();
            costoV2 = false;
        } else {
            var reg = /^(\d|,)*\.\d{1,2}$/g;
            if (costoV.match(reg)) {
                $("#costoV").removeClass("is-invalid");
                $("#costoV").addClass("is-valid");
                $('#costoVval').hide();
                costoV2 = true;
            } else {
                $("#costoVval").addClass("invalid-feedback");
                $("#costoV").removeClass("is-valid");
                $("#costoV").addClass("is-invalid");
                $('#costoVval').text('Por favor ingrese mas digitos.');
                $('#costoVval').show();
                costoV2 = false;
            }
        }
    });
    /**********Validacion del costo de venta */

    $("#calc_PEP").on('click', function () {
        var costos_fijos = $("#costosFijos2").val();
        var precio = $("#precioV").val();
        var costoV = $("#costoV").val();

        if (costos_fijos.length === 0) {
            $("costosFijos2val").addClass("invalid-feedback");
            $("#costosFijos2").removeClass("is-valid");
            $("#costosFijos2").addClass("is-invalid");
            $('#costosFijos2val').text('Por favor ingrese el costo fijo.');
            $('#costosFijos2val').show();
            costos_fijos3 = false;
        } else {
            costos_fijos3 = true;
        }

        if (precio.length === 0) {
            $("#precioVval").addClass("invalid-feedback");
            $("#precioV").removeClass("is-valid");
            $("#precioV").addClass("is-invalid");
            $('#precioVval').text('Por favor ingrese el precio de venta.');
            $('#precioVval').show();
            precio3 = false;
        } else {
            precio3 = true;
        }

        if (costoV.length === 0) {
            $("#costoVval").addClass("invalid-feedback");
            $("#costoV").removeClass("is-valid");
            $("#costoV").addClass("is-invalid");
            $('#costoVval').text('Por favor ingrese el costo varible por unidad.');
            $('#costoVval').show();
            costoV3 = false;
        } else {
            costoV3 = true;
        }

        if (costoV2 === true && costoV3 === true && precio2 === true && precio3 === true && costos_fijos2 === true && costos_fijos3 === true) {
            costos_fijos = remove_format_coin(costos_fijos);
            precio = remove_format_coin(precio);
            costoV = remove_format_coin(costoV);

            var punto_equilibrio = parseFloat(costos_fijos) / (parseFloat(precio) - parseFloat(costoV));
            $('#PEP').val(create_format_coin(punto_equilibrio));
        }else {
            $('#PEP').val("");
        }

    });

    $("#savePES").on('click', function () {
        var PE_unidades = $("#PEU").val();
        var PE_pesos = $("#PEP").val();
        if (PE_unidades != "" && PE_pesos != "") {

            var costos_fijos = remove_format_coin($("#costosFijos").val());
            var precio_venta_unidad = remove_format_coin($("#precioVU").val());
            var costo_variable_unidad = remove_format_coin($("#costoVU").val());
            PE_unidades = remove_format_coin(PE_unidades);
            var precio_venta = remove_format_coin($("#precioV").val());
            var costo_venta = remove_format_coin($("#costoV").val());
            PE_pesos = remove_format_coin(PE_pesos);

            $.ajax({
                type: "POST",
                url: "puntoequilibrio.aspx/guardar_PE",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                data: JSON.stringify({
                    idProyecto: id_proyecto,
                    costosFijos: costos_fijos,
                    precio_VU: precio_venta_unidad,
                    costo_variable_unidad: costo_variable_unidad,
                    punto_equilibrio_U: PE_unidades,
                    precio_V: precio_venta,
                    costo_V: costo_venta,
                    punto_equilibrio_P: PE_pesos
                }),
                success: function (result) {
                    var resultado = (result.d);
                    if (resultado === "OK") {
                        $("#project").html($("#message").find("strong").html());
                        $('#succesModal').modal('show');
                    }

                },
                error: function (result) {
                    console.log(result.responseText);
                }

            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });

        }

    });
    $('#succesModal').on('hidden.bs.modal', function () {
        location.reload();
    });

    /*********** SCRIPTS PARA EL CONTENT PUNTO DE EQUILIBRIO ********/

    $("body").on('keyup', ".moneda", function (event) {
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });

    });
    function remove_format_coin(cifra) {
        return parseFloat(cifra.replace(',', ""));
    }
    function create_format_coin(cifra) {
        var c = parseFloat(cifra);
        return c.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }

});