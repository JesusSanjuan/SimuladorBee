<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="impuestos.aspx.cs" Inherits="Simulador_impuestos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<!--
<div id="Tabla" class="container-fluid card-body" style="padding-top:15px;padding-bottom:15px">
    <div class="card mb-3"> 
             <div class="card-header">
                <h5><i class="fa fa-table"></i>  Tabla</h5>
             </div>
                <div class="card-body">
                            <div class="table-responsive">
                                       <Table class="table table-bordered" id="dataTable"   >
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>Concepto</th>
                                                    <th>$</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th></th>
                                                <th>Concepto</th>
                                                <th>$</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                            </tfoot>
                                           <tbody>
                                               <tr>
                                                      <td></td>
                                                      <td>System Architect</td>
                                                      <td>$320,800</td>
                                                      <td></td>
                                                      <td></td>
                                                      
                                                    </tr>
                                                    <tr>
                                                      <td></td>
                                                      <td>Accountant</td>                                                        
                                                      <td>$170,750</td>
                                                      <td></td>
                                                      <td></td>
                                                    </tr>

                                           </tbody>
                                       </table>
                           </div>
                 </div>
        </div>
</div>
    -->


    <div class="container">

			<h1>
				DataTables Editor <span>Impuestos</span>
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

