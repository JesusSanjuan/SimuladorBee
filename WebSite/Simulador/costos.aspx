<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="costos.aspx.cs" Inherits="Simulador_costos" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
     <link href="../Content/bootstrap-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Costos</li>
        </ol>
    </nav> 
    <div style="padding-bottom:1rem;">
        <div class="card align-middle" >  
            <div class="card-header">
                <h1><i class="fa fa-money"></i>  Evaluación de costos</h1>
            </div>
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px"> 
                <div class="alert alert-warning alert-dismissible fade show" id="warning" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>¡Antes de comenzar!</strong> Selecciona el período a calcular.
                </div>  
                <div class="form-group text-center">
                    <label for="selecciona" class="col-form-label"><strong id="lapso">Selecciona el período: </strong></label>
                    <select class="selectpicker show-tick" id="cnperiod_c">
                    </select>
                </div>
                <input type="hidden" id="lapse" />
            </div>
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a href="#Costos1" id="NCostos1" class="nav-link" role="tab" data-toggle="tab"><i class="fa fa-table"></i> Costos de Producción</a>                                   
                </li>
                <li class="nav-item">
                    <a href="#Costos2" id="NCostos2" class="nav-link"  role="tab" data-toggle="tab"><i class="fa fa-table"></i>Costos de Ventas</a>
                </li>
                <li class="nav-item">
                    <a href="#Costos3" id="NCostos3"  class="nav-link" role="tab" data-toggle="tab"><i class="fa fa-table"></i>Costos de Administración</a>
                </li>
                <li class="nav-item">
                    <a href="#Costos4" id="NCostos4"  class="nav-link" role="tab" data-toggle="tab"><i class="fa fa-table"></i>Costos de Financiamiento </a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="Costos1" role="tabpanel" aria-labelledby="producción"> 
                            <div class="fondoresultados card-body text-info" style="border-bottom: 1px solid #dee2e6;">
                              <i><b>Los costos de produccion:</b></i> Son los costos que se generan en el proceso de transformar la materia prima en productos terminados.
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px; width:100%;">
                                <table class="table table-striped" style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;" id="costTable" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Costo Unitario</th>
                                            <th >$ Costo Total</th>
                                            <th ></th>                
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th><strong>TOTAL</strong></th>
                                            <th class="na"></th>
                                            <th></th>
                                            <th></th>
                                            <th class="total"></th>
                                            <th class="na"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        <div class="form-row" style="margin-top: 10px; border-top: 1px solid #dee2e6;"> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                    <asp:Button id="add_row" 	CssClass="btn btn-primary btn-block add_row "  Text="Agregar Fila"  OnClientClick="return false;" runat="server"/>
                                </div>
                            </div>  
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">                                  
                            </div>  
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                    <asp:LinkButton runat="server" ID="guardar"  CssClass="btn btn-primary btn-block continuar float-right" OnClientClick="return false;">
                                            Siguiente <i class='fa fa-angle-double-right'></i>
                                    </asp:LinkButton>
                                    <a href="#" class="btn btn-success actualizar btn-block float-right" style="display:none">
                                        Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                    </a>
                                    <input type="hidden" class="total_ant" />
                                </div> 
                            </div>            
                        </div>
                </div>
                <div class="tab-pane fade" id="Costos2" role="tabpanel" aria-labelledby="Ventas">
                            <div class="fondoresultados card-body text-info" style="border-bottom: 1px solid #dee2e6;">
                              <i><b>Los costos de ventas:</b></i>  Son determinados por el departamento de ventas, también llamado de mercadotecnia.
                            </div>
                                <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px; width:100%;">
                                    <table class="table table-striped" style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;" id="costTable2"  >
                                        <thead>
                                            <tr>
                                                <th >Concepto</th>
                                                <th >Tipo</th>
                                                <th >Cantidad</th>
                                                <th >$ Costo Unitario</th>
                                                <th >$ Costo Total</th>
                                                <th ></th>                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th><strong>TOTAL</strong></th>
                                                <th class="na"></th>
                                                <th></th>
                                                <th></th>
                                                <th class="total"></th>
                                                <th class="na"></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            
                            <div class="form-row"  style="margin-top: 10px; border-top: 1px solid #dee2e6;"> 
                                <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                    <div class="col text-center">
                                        <asp:Button id="Button1" 	CssClass="btn btn-primary btn-block add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                                    </div>
                                </div> 
                                <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                </div> 
                                <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                </div> 
                                <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                    <div class="col text-center">
                                        <asp:LinkButton runat="server" ID="LinkButton1"  CssClass="btn btn-primary btn-block continuar float-right" OnClientClick="return false;"><!--onclick="setDataTable"-->
                                            Siguiente <i class='fa fa-angle-double-right'></i>
                                        </asp:LinkButton>
                                        <a href="#" class="btn btn-success actualizar btn-block float-right" style="display:none">
                                            Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                        </a>
                                        <input type="hidden" class="total_ant" />
                                    </div>
                                </div> 
                            </div>
                </div>
                <div class="tab-pane fade" id="Costos3" role="tabpanel" aria-labelledby="Administración">  
                            <div class="fondoresultados card-body text-info" style="border-bottom: 1px solid #dee2e6;">
                              <i><b>Los costos de administración:</b></i> Son los costos que provienen de las áreas administrativas en la empresa.
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                <table class="table table-striped" style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;" id="costTable3" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Costo Unitario</th>
                                            <th >$ Costo Total</th>
                                            <th ></th>                
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th><strong>TOTAL</strong></th>
                                            <th class="na"></th>
                                            <th></th>
                                            <th></th>
                                            <th class="total"></th>
                                            <th class="na"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>                        
                        <div class="form-row" style="margin-top: 10px; border-top: 1px solid #dee2e6;"> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                  <asp:Button id="Button2" 	CssClass="btn btn-primary btn-block  add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                                </div>
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                    <asp:LinkButton runat="server" ID="LinkButton2"  CssClass="btn btn-primary btn-block  continuar float-right" OnClientClick="return false;">
                                        Siguiente <i class='fa fa-angle-double-right'></i>
                                    </asp:LinkButton>
                                    <a href="#" class="btn btn-success actualizar btn-block  float-right" style="display:none">
                                        Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                    </a>
                                    <input type="hidden" class="total_ant" />
                                </div> 
                            </div> 
                        </div>
                </div>
                <div class="tab-pane fade" id="Costos4" role="tabpanel" aria-labelledby="financiamiento: "> 
                            <div class="fondoresultados card-body text-info" style="border-bottom: 1px solid #dee2e6;">
                              <i><b>Los costos de financiamiento:</b></i> Son los intereses que se deben pagar conforme a los capitales obtenidos en préstamo.
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                <table class="table table-striped" style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;" id="costTable4" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Costo Unitario</th>
                                            <th >$ Costo Total</th>
                                            <th ></th>                
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th><strong>TOTAL</strong></th>
                                            <th class="na"></th>
                                            <th></th>
                                            <th></th>
                                            <th class="total"></th>
                                            <th class="na"></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        <div class="form-row" style="margin-top: 10px; border-top: 1px solid #dee2e6;"> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                    <asp:Button id="Button3" 	CssClass="btn btn-primary btn-block add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                                </div>
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                            </div> 
                            <div class="col-md-3 mb-2" style="margin-top: 10px;">
                                <div class="col text-center">
                                    <asp:LinkButton runat="server" ID="LinkButton3"  CssClass="btn btn-primary continuar btn-block float-right" OnClientClick="return false;">
                                        Siguiente <i class='fa fa-angle-double-right'></i>
                                    </asp:LinkButton>
                                    <a href="#" class="btn btn-success actualizar btn-block float-right" style="display:none">
                                        Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                    </a>
                                    <input type="hidden" class="total_ant" />
                                </div>
                            </div> 
                        </div>  
                </div>
            </div>
        </div>
    </div>
    <!-- modal de succes -->
    <div class="modal fade bd-example-modal-sm" id="success" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                        <h4 class="modal-title"> <i class="fa fa-check-square-o"></i> Mensaje</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>        
                <!-- Modal body -->
                <div class="modal-body" id="modal-text-body-suc">
                    <div class="alert alert-primary" role="alert">
                      Datos guardados satisfactoriamente!!
                    </div>
                    <button type="button" class="btn btn-secondary float-right" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>    
    <!-- The Modal -->
    <div class="modal fade" id="Continuacion" >
        <div class="modal-dialog">
            <div class="modal-content"> 
                <!--- input hidden-->
                <input type="hidden" name="selector" id="selector" value=""/>
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"> <i class="fa fa-arrow-right"></i> Continuar</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>        
                <!-- Modal body -->
                <div class="modal-body" id="modal-text-body">
                    Desea Guardar y Continuar con el ingreso de Datos?
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button  id="costo_cancel" type="button" class="btn btn-danger " data-dismiss="modal">Cancelar</button>
                    <button  id="costo_continuar" type="button" class="btn btn-primary" data-dismiss="modal">Continuar</button>
                    <button  id="costo_update" type="button" class="btn btn-primary" data-dismiss="modal">Actualizar</button>
                </div>
            </div>
        </div>
    </div> 
    <!-- The Modal -->
    <!-- The Modal -->
    <div class="modal fade" id="selectInflacion" >
        <div class="modal-dialog">
            <div class="modal-content"> 
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"> <i class="fa fa-arrow-right"></i> Proyección</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>        
                <!-- Modal body -->
                <div class="modal-body" >
                    Selecciona la inflación para la proyección de los costos
                    <div class="row">
                        <div class="col">
                            <select class="selectpicker show-tick" id="select_inflacion">
                                <option value="" >Seleccione..</option>
                            </select>
                        </div>
                        <div class="col">
                            <span id="span_tipo"></span>
                            <span id="span_periodo"></span>
                        </div>
                        
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button  type="button" class="btn btn-danger " data-dismiss="modal">Cancelar</button>
                    <button  id="select_infla_costo" type="button" class="btn btn-primary" data-dismiss="modal">Proyectar</button>
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
    <!-- plugin dataTable-->
        <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
        <script type="text/javascript" src="../Scripts/editable-table/jquery.tabletojson.min.js"></script>
    <!-- plugin rangeslide-->
        <script type="text/javascript" src="../Scripts/rangeslider/rangeslider.min.js"></script>
    <!-- plugin selectpicker-->
        <script src="../Scripts/bootstrap-select.min.js"></script>
    <!-- SCRIPT DE LOS CONTENIDOS -->
        <script src="../Scripts/Simulador/scripts.js"></script>
</asp:Content>

