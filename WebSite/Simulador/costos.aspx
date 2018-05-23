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
        			            <a href="#Costos1" class="nav-link active" role="tab" data-toggle="tab"> Costos 1</a>
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
            
  
    <div class="tab-content">
           <div role="tabpanel" class="tab-pane fade show active" id="Costos1">  
              <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                                      
                    <div class="card-header">
                        <h5><i class="fa fa-table"></i>  Tabla</h5>
                    </div>
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="costTable" >
                                                <thead>
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
                                                <asp:Button id="add_row" 	CssClass="btn btn-primary"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                                          </div>
                                          <div class="col">
                                               <asp:Button id="Continuar" 	CssClass="btn btn-primary"  Text="Continuar"   runat="server"/> <i class="fa fa-angle-right"></i>
                                          </div>
                                        </div>
                                
                    
                     
                 </div>  
          </div>
          <div role="tabpanel" class="tab-pane fade" id="Costos2">2
          </div>
          <div role="tabpanel" class="tab-pane fade" id="Costos3">3
          </div>
          <div role="tabpanel" class="tab-pane fade" id="Costos4">4
          </div>
          <div role="tabpanel" class="tab-pane fade" id="Costos5">5
          </div>
    </div>
</div>

<!-- The Modal -->
            <div class="modal fade" id="Continuacioncostos" >
            <div class="modal-dialog">
                <div class="modal-content">      
                    <!-- Modal Header -->
                    <div class="modal-header">
                            <h4 class="modal-title"> <i class="fa fa-check-square-o"></i> Continuar</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>        
                    <!-- Modal body -->
                    <div class="modal-body" id="modal-text-body">
                        Desea realmente continuar con el ingreso de costos?
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
                </div>
            </div> 
<!-- The Modal -->


</asp:Content>

