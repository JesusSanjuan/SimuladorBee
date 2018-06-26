function Graficar(x,y,Periodo) {

    // Chart.js scripts
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    //convertimos el array en json

    var time = JSON.parse(JSON.stringify(x));
    var repArray = JSON.parse(JSON.stringify(y));
    var PeriodoSelect = JSON.parse(JSON.stringify(Periodo));

    var pointBackgroundColor = new Array(repArray.length);    
    var pointRadius = new Array(repArray.length);
    var pointHoverRadius = new Array(repArray.length);
    var pointStyle = new Array(repArray.length);

    for (var i = 0; i < repArray.length; i++) {       
        pointBackgroundColor[i] = "rgba(2,117,216,1)";   
        pointRadius[i] = 3;
        pointHoverRadius[i] = 6;
        pointStyle[i] = 'circle';
    }

    for (var i = 0; i < repArray.length; i++) {
        var tem = repArray[i];
        if (tem <= 0) {
            pointBackgroundColor[i] = "rgba(255, 87, 51,1)";
            pointRadius[i] = 8;
            pointHoverRadius[i] = 10;
            pointStyle[i] = 'rectRounded';
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
                label: "Mi VPN",
                lineTension: 0.2,                
                backgroundColor: "rgba(2,117,216,0.2)",// Para lo de bajo o arriba de la lineas y el decimal para la intencidad
                borderColor: "rgba(2,117,216,0.9)",// El color de las lineas que unen los puntos y la intencidad
                borderWidth: 3,
                pointRadius: pointRadius, // Radio
                pointBackgroundColor: pointBackgroundColor,// Interior del boton e intensidad del interior
                pointBorderColor: "rgba(255,255,255,1)",// Color de los bordes del punto e intensidad del borde
                pointHoverRadius: pointHoverRadius,// Agrandar al pasar el raton sobre el punto
                pointHoverBackgroundColor: pointBackgroundColor,// Color del interior del punto al pasar el cursor y agrandarse
                pointHitRadius: 14,//determina la distancia a la cuál los puntos trazados comenzarán a interactuar con el ratón.
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
                        maxTicksLimit: 20
                    }
                }],
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'VPN'
                    },
                    ticks: {
                        //min: 0,
                       // max: 40000,
                        maxTicksLimit: 20
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: true
            }
        }
    });
   
}






