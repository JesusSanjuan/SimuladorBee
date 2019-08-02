<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="gastos.aspx.cs" Inherits="Simulador_gastos" %>
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
            <li class="breadcrumb-item active">Gastos</li>
        </ol>
    </nav> 
    <div style="padding-bottom:1rem;">
        <div class="card align-middle" >  
            <div class="card-header">
                <h1><i class="fa fa-money"></i>  Evaluación de gastos</h1>
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
                    <select class="selectpicker show-tick" id="cnperiod_g">
                    </select>
                </div>
                <input type="hidden" id="lapse" />
            </div>
            <ul class="nav nav-tabs" id="myTab_g" role="tablist">
                <li class="nav-item">
                    <!--<a class="nav-link active" id="home-tab" data-toggle="tab" href="#Costos1" role="tab" aria-controls="home" aria-selected="true">Home</a>-->
                    <a href="#Gastos1" id="NGastos1" class="nav-link" role="tab" data-toggle="tab"> Gastos de Producción</a>                                   
                </li>
                <li class="nav-item">
                    <a href="#Gastos2" id="NGastos2" class="nav-link"  role="tab" data-toggle="tab">Gastos de Ventas</a>
                </li>
                <li class="nav-item">
                    <a href="#Gastos3" id="NGastos3"  class="nav-link" role="tab" data-toggle="tab">Gastos de Administración</a>
                </li>
                <li class="nav-item">
                    <a href="#Gastos4" id="NGastos4"  class="nav-link" role="tab" data-toggle="tab">Gastos de Financiamiento </a>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent3">
                <div class="tab-pane fade show active" id="Gastos1" role="tabpanel" aria-labelledby="producción">
                    <div class="container-fluid" style="padding-top:15px;padding-bottom:15px"> 
                        <div class="preborder">    
                            <div class="card-header">
                                <h5><i class="fa fa-table"></i>  Gastos de Producción</h5>                          
                                <p align="justify">
                                    Son los gastos que ...
                                </p>    
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                <table class="table table-striped table-bordered" id="gastTable" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Gasto Unitario</th>
                                            <th >$ Gasto Total</th>
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
                        </div>
                        <div class="form-row" style="margin-top: 20px;"> 
                            <div class="col text-center">
                                <asp:Button id="add_row" 	CssClass="btn btn-primary add_row "  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                            </div>                                
                            <div class="col text-center">
                                <asp:LinkButton runat="server" ID="guardar"  CssClass="btn btn-primary continuar float-right" OnClientClick="return false;"><!--onclick="setDataTable"-->
                                        Siguiente <i class='fa fa-angle-double-right'></i>
                                </asp:LinkButton>
                                <a href="#" class="btn btn-success actualizar float-right" style="display:none">
                                    Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                </a>
                                <input type="hidden" class="total_ant" />
                            </div>                    
                        </div>
                   
                </div>
                </div>
                <div class="tab-pane fade" id="Gastos2" role="tabpanel" aria-labelledby="Ventas">
                    <div class="preborder">
                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">   
                            <div class="preborder">    
                                <div class="card-header">
                                    <h5><i class="fa fa-table"></i> Gastos de Ventas</h5>
                                    <p align="justify">
                                        Son determinados por el ...
                                    </p>  
                                </div>
                                <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                    <table class="table table-striped table-bordered" id="gastTable2"  >
                                        <thead>
                                            <tr>
                                                <th >Concepto</th>
                                                <th >Tipo</th>
                                                <th >Cantidad</th>
                                                <th >$ Gasto Unitario</th>
                                                <th >$ Gasto Total</th>
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
                            </div>
                            <div class="form-row" style="margin-top: 20px;">
                                <div class="col text-center">
                                    <asp:Button id="Button1" 	CssClass="btn btn-primary add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                                </div>
                                <div class="col text-center">
                                    <asp:LinkButton runat="server" ID="LinkButton1"  CssClass="btn btn-primary continuar float-right" OnClientClick="return false;"><!--onclick="setDataTable"-->
                                        Siguiente <i class='fa fa-angle-double-right'></i>
                                    </asp:LinkButton>
                                    <a href="#" class="btn btn-success actualizar float-right" style="display:none">
                                        Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                    </a>
                                    <input type="hidden" class="total_ant" />
                                </div>
                            <!-- InvalidOperationException: Sólo se puede agregar una instancia de ScriptManager a la página-->
                            </div>
                    
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="Gastos3" role="tabpanel" aria-labelledby="Administración">
                    <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">   
                        <div class="preborder">    
                            <div class="card-header">
                                <h5><i class="fa fa-table"></i> Gastos de Administración: </h5>
                                <p align="justify">
                                    Son los gastos que ...
                                </p> 
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                <table class="table table-striped table-bordered" id="gastTable3" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Gasto Unitario</th>
                                            <th >$ Gasto Total</th>
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
                        </div>
                        <div class="form-row" style="margin-top: 20px;">
                            <div class="col text-center">
                                <asp:Button id="Button2" 	CssClass="btn btn-primary add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                            </div>
                            <div class="col text-center">
                                <asp:LinkButton runat="server" ID="LinkButton2"  CssClass="btn btn-primary continuar float-right" OnClientClick="return false;"><!--onclick="setDataTable"-->
                                    Siguiente <i class='fa fa-angle-double-right'></i>
                                </asp:LinkButton>
                                <a href="#" class="btn btn-success actualizar float-right" style="display:none">
                                    Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                </a>
                                <input type="hidden" class="total_ant" />
                            </div>
                            <!-- InvalidOperationException: Sólo se puede agregar una instancia de ScriptManager a la página-->
                        </div>                      
                    </div>
                </div>
                <div class="tab-pane fade" id="Gastos4" role="tabpanel" aria-labelledby="financiamiento: ">
                    <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">       
                        <div class="preborder">    
                            <div class="card-header">
                                <h5><i class="fa fa-table"></i> Gastos de Financiamiento </h5>
                                <p align="justify">
                                    Son los ...
                                </p> 
                            </div>
                            <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                <table class="table table-striped table-bordered" id="gastTable4" >
                                    <thead>
                                        <tr>
                                            <th >Concepto</th>
                                            <th >Tipo</th>
                                            <th >Cantidad</th>
                                            <th >$ Gasto Unitario</th>
                                            <th >$ Gasto Total</th>
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
                        </div>
                        <div class="form-row" style="margin-top: 20px;">
                            <div class="col text-center">
                                    <asp:Button id="Button3" 	CssClass="btn btn-primary add_row"  Text="Agregar"  OnClientClick="return false;" runat="server"/>
                            </div>
                            <div class="col text-center">
                                <asp:LinkButton runat="server" ID="LinkButton3"  CssClass="btn btn-primary continuar float-right" OnClientClick="return false;"><!--onclick="setDataTable"-->
                                    Siguiente <i class='fa fa-angle-double-right'></i>
                                </asp:LinkButton>
                                <a href="#" class="btn btn-success actualizar float-right" style="display:none">
                                    Actualizar <i class='fa fa-refresh' aria-hidden="true"></i>
                                </a>
                                <input type="hidden" class="total_ant" />
                            </div>
                            <!-- InvalidOperationException: Sólo se puede agregar una instancia de ScriptManager a la página-->
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
                    <button  type="button" class="btn btn-danger " data-dismiss="modal">Cancelar</button>
                    <button  id="gasto_continuar" type="button" class="btn btn-primary" data-dismiss="modal">Continuar</button>
                    <button  id="gasto_update" type="button" class="btn btn-primary" data-dismiss="modal">Actualizar</button>
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
                    Selecciona la inflación para la proyección de los gastos
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
                    <button  id="select_infla_gasto" type="button" class="btn btn-primary" data-dismiss="modal">Proyectar</button>
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

