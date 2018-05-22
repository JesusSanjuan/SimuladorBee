
/*
 * Editor client script for DB table Impuestos
 * Created by http://editor.datatables.net/generator
 */

(function($){

$(document).ready(function() {
	var editor = new $.fn.dataTable.Editor( {
		//ajax: '/api/Impuestos',
		table: '#Impuestos',
		fields: [
			{
				"label": "Concepto:",
				"name": "concepto"
			},
			{
				"label": "Costos:",
				"name": "costos"
			}
		]
	} );

	var table = $('#Impuestos').DataTable( {
		//ajax: '/api/Impuestos',
		columns: [
			{
				"data": "concepto"
			},
			{
				"data": "costos"
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

