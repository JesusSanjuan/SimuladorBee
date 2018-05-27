<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="impuestos.aspx.cs" Inherits="Simulador_impuestos" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <!--Experimentando con tabla dinamica en impuestos.aspx -->
        <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
        <link href="../Scripts/DataTables/css/generator-base.css" rel="stylesheet" />     
        <link href="../Scripts/DataTables/css/editor.bootstrap4.min.css" rel="stylesheet" />  
    <!--Experimentando con tabla dinamica en impuestos.aspx -->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
			<h1>
				Tabla editable <span>Impuestos</span>
			</h1>
			
			<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="Impuestos" width="100%">
				<thead>
					<tr>
						<th>Concepto</th>
						<th>Costo</th>
					</tr>
				</thead>
			</table>
	</div>
</asp:Content>

<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
     <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/buttons.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.editor.min.js"></script>  
    <script type="text/javascript" src="../Scripts/DataTables/js/editor.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.select.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/table.Impuestos.js"></script>
</asp:Content>

