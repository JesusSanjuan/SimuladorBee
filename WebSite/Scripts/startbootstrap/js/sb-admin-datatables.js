
$(document).ready(function () {    
    var table = $('#dataTableVAN').DataTable({ 
        destroy: true,// Muestra error
        language: {
            processing: "Obteniendo resultados...",
            search: "Buscar en la tabla:",
            lengthMenu: "Ver _MENU_ resultados",
            info: "Visualizacion de los resultados: _START_ al _END_ de un total de _TOTAL_ resultados",
            infoEmpty: "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            infoFiltered: "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            infoPostFix: "",
            loadingRecords: "Cargando...",
            zeroRecords: "Cero registros",
            emptyTable: "Ultimo",
            paginate: {
                first: "Primera",
                previous: "Pagina Anterior",
                next: "Pagina Siguiente",
                last: "Anterior"
            },
            aria: {
                sortAscending: ": Activar para ordenar la columna en orden ascendente",
                sortDescending: ": Activar para ordenar la columna en orden descendente"
            }
        }
    });
});



