

function obetnerFNE() {
    $(document).ready(function () {
        alert("obetnerFNE");

        var datos = [];
        $('#flujosM tbody tr').each(function (index) {
            console.log("date--->" + $(this).find('td:eq(1)').text());
            datos.push($(this).find('td:eq(1)').text());
        });
        console.log(datos);
        alert(datos);
    });
}
