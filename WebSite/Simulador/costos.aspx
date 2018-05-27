<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="costos.aspx.cs" Inherits="Simulador_costos" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
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
                 <ul class="nav nav-tabs" id="myTab" role="tablist">
        		            <li class="nav-item">
        			            <a href="#Costos1" id="NCostos1" class="nav-link active" role="tab" data-toggle="tab"> Costos 1</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos2" id="NCostos2" class="nav-link"  role="tab" data-toggle="tab">Costos 2</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos3" id="NCostos3"  class="nav-link" role="tab" data-toggle="tab">Costos 3</a>
        		            </li>

        		            <li class="nav-item">
        			            <a href="#Costos4" id="NCostos4" class="nav-link" role="tab" data-toggle="tab">Costos 4</a>
        		            </li>
				            <li class="nav-item">
        			            <a href="#Costos5"id="NCostos5"  class="nav-link" role="tab" data-toggle="tab">Costos 5</a>
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
                                <asp:Button id="add_row" 	CssClass="btn btn-primary"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                            </div>
                            


                               <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                     <ContentTemplate>
                                        <div class="col">
                                            <asp:LinkButton runat="server" ID="guardar" onclick="setDataTable" CssClass="btn btn-primary">
                                                <i class='fa fa-save'></i> Guardar
                                            </asp:LinkButton>
                                               
                                        </div>
                                        <div class="col">
                                            <asp:Button id="Continuar"  CssClass="btn btn-primary" onclick="Continuar_Click" Text="Siguiente"  runat="server"/>                                               
                                        </div>
                                      </ContentTemplate>
                                </asp:UpdatePanel>
                        </div>
                 </div>  
          </div> 
          <div role="tabpanel" class="nav-link fade" id="Costos2">2
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
                            <button  id="costo_cancel" type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
                            <button  id="costo_continuar" type="button" class="btn btn-danger" data-dismiss="modal">Continuar</button>
                        </div>
                    </div>
                 </div>
            </div> 
<!-- The Modal -->
  
                

</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
     <!-- plugin editable-->
        <script src="../Scripts/editable-table/mindmup-editabletable.js"></script>
        <script src="../Scripts/editable-table/numeric-input-example.js"></script>
        <script src="../Scripts/editable-table/edittable.js"></script> 
    <!-- plugin editable-->
</asp:Content>

