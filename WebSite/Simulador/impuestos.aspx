<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="impuestos.aspx.cs" Inherits="Simulador_impuestos" %>

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

