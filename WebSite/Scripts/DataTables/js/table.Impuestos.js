
/*
 * Editor client script for DB table Impuestos
 * Created by http://editor.datatables.net/generator
 */

(function($){

$(document).ready(function() {
	var editor = new $.fn.dataTable.Editor( {
		table: '#Impuestos',
		fields: [
			{
				"label": "Concepto:",
				"name": "concepto"
			},
			{
				"label": "Costo:",
				"name": "costo"
			}
		]
	} );

	var table = $('#Impuestos').DataTable( {
		columns: [
			{
				"data": "concepto"
			},
			{
				"data": "costo"
			}
		],
		select: true,
		lengthChange: false
	} );

	new $.fn.dataTable.Buttons( table, [
		{ extend: "create", editor: editor },
		{ extend: "edit",   editor: editor },
		{ extend: "remove", editor: editor }
	] );

	table.buttons().container()
		.appendTo( $('.col-md-6:eq(0)', table.table().container() ) );
} );

}(jQuery));

