function Graficar(x,y,Periodo) {

    // Chart.js scripts
    // -- Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';
    // -- Area Chart Example

    //convertimos el array en json

    var time = JSON.parse(JSON.stringify(x));
    var repArray = JSON.parse(JSON.stringify(y));
    var PeriodoSelect = JSON.parse(JSON.stringify(Periodo));

    var ctx = document.getElementById("myAreaChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: time,
            datasets: [{
                label: "Mi VPN",
                lineTension: 0.2,                
                backgroundColor: "rgba(2,117,216,0.2)",
                borderColor: "rgba(2,117,216,1)",
                pointRadius: 1,
                pointBackgroundColor: "rgba(2,117,216,1)",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 3,
                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                pointHitRadius: 7,
                pointBorderWidth: 2,
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






