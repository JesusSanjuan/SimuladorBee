function Graficar(x,y,Periodo) {

    // Chart.js scripts
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    //convertimos el array en json
    var time = JSON.parse(JSON.stringify(x));
    var repArray = JSON.parse(JSON.stringify(y));
    var PeriodoSelect = JSON.parse(JSON.stringify(Periodo));

    var prueba = repArray[repArray.length - 1];


    var pointBackgroundColor = new Array(repArray.length);    
    var pointRadius = new Array(repArray.length);
    var pointHoverRadius = new Array(repArray.length);
    var pointStyle = new Array(repArray.length);
   // var tooltipsbackgroundColor = new Array(repArray.length);

    for (var i = 0; i < repArray.length; i++) {       
        pointBackgroundColor[i] = "rgba(2,117,216,1)";   
        pointRadius[i] = 3;
        pointHoverRadius[i] = 6;
        pointStyle[i] = 'circle';
      //  tooltipsbackgroundColor[i] = 'rgba(0, 0, 0, 0.7)';
    }

    for (var i = 0; i < repArray.length; i++) {
        var tem = repArray[i];
        if (tem <= 0) {
            pointBackgroundColor[i] = "rgba(255, 87, 51,1)";
            pointRadius[i] = 8;
            pointHoverRadius[i] = 10;
            pointStyle[i] = 'rectRounded';
            //tooltipsbackgroundColor[i] ='rgba(255, 0, 0, 0.7)'
            break;
        }
        
    }

    //Mas informacion en https://www.chartjs.org/docs/latest/configuration/elements.html

    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: time,
            datasets: [{
                label: "VPN",
                lineTension: 0.2,
                backgroundColor: "rgba(2,117,216,0.2)",// Para lo de bajo o arriba de la lineas y el decimal para la intencidad
                borderColor: "rgba(2,117,216,0.9)",// El color de las lineas que unen los puntos y la intencidad
                borderWidth: 3,
                pointRadius: pointRadius, // Radio
                pointBackgroundColor: pointBackgroundColor,// Interior del boton e intensidad del interior
                pointBorderColor: "rgba(255,255,255,1)",// Color de los bordes del punto e intensidad del borde
                pointHoverRadius: pointHoverRadius,// Agrandar al pasar el raton sobre el punto
                pointHoverBackgroundColor: pointBackgroundColor,// Color del interior del punto al pasar el cursor y agrandarse
                pointHitRadius: 8,//determina la distancia a la cuál los puntos trazados comenzarán a interactuar con el ratón.
                pointBorderWidth: 2, //Distancia del punto de su borde al centro
                pointStyle: pointStyle,
                data: repArray

            }],
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: "Calculo del VPN"
            },
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: true
                    },
                    scaleLabel: {
                        display: true,
                        labelString: "TMAR en ".concat(PeriodoSelect)
                    },
                    ticks: {
                            min: time[0],
                            max: time[repArray.length - 1],
                            callback: function (value, index, values) {
                                return value + '%';
                            }
                           // maxTicksLimit: 40
                    }
                }],
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'VPN'
                    },
                    ticks: {
                        //min: repArray[repArray.length - 1],
                        //max: repArray[0],
                        callback: function (value, index, values) {
                            return '$' + value;
                        }
                        // maxTicksLimit: 40
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            tooltips: {
                xPadding: 16,
                yPadding: 10,
                backgroundColor: 'rgba(0,5,109, 0.5)',
                titleFontStyle: 'normal',
                titleMarginBottom: 15/*,
                callbacks: {
                    labelColor: function (tooltipItem, chart) {
                        console.log(tooltipItem);
                    return {
                       
                        borderColor: 'rgb(255, 0, 0)',
                        backgroundColor: 'rgb(255, 0, 0)'
                    }
                },
                labelTextColor:function(tooltipItem, chart){
                    return '#543453';
                }
            }*/
            },
            animation: {
                duration: 10, // general animation time
            },
            hover: {
                animationDuration: 10, // duration of animations when hovering an item
            },
            responsiveAnimationDuration: 10, // animation duration after a resize
            legend: {
                display: true,
                labels: {
                    fontColor: 'rgb(0, 0, 0)'// Color de los labels del titulo
                }
            }
        }
    });
   
}






