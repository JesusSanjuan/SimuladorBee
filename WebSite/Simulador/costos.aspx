<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="costos.aspx.cs" Inherits="Simulador_costos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
<nav aria-label="breadcrumb">
            <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Costos</li>
            </ol>
</nav>  
<div class="card align-middle">  
      <div class="card-header">
            <h1><i class="fa fa-money"></i>  Calculos de costos</h1>
      </div>
                 <ul class="nav nav-tabs">
        		            <li class="nav-item">
        			            <a href="#Costos1" class="nav-link active" role="tab" data-toggle="tab"><i class="fa fa-table"></i> Costos 1</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos2" class="nav-link" role="tab" data-toggle="tab">Costos 2</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos3" class="nav-link" role="tab" data-toggle="tab">Costos 3</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos4" class="nav-link" role="tab" data-toggle="tab">Costos 4</a>
        		            </li>
				            <li class="nav-item">
        			            <a href="#Costos5" class="nav-link" role="tab" data-toggle="tab">Costos 5</a>
        		            </li>
                  </ul>
            
    </div>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade show active" id="Costos1">                        
                                <div class="table-responsive">
                                    <table id="costTable" class="table table-bordered" >
                                        <thead class="thead-dark">
                                            <tr>
                                                <th >Concepto</th>
                                                <th >$ Costo</th>
                                                <th ></th>
                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th><strong>TOTAL</strong></th>
                                                <th></th>
                                                <th id="na"></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                           

        

                            <div class="row">
                                 <div class="col">
                                     <asp:Button id="add_row" 	CssClass="btn btn-primary mb1 bg-red"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                    
                                 </div>
                            </div>

                        
            </div>
    </div>
</asp:Content>

