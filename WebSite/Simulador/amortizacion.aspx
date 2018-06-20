<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="amortizacion.aspx.cs" Inherits="Simulador_Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Amortización</li>
        </ol>
    </nav>
    <div class="card align-middle">
        <div class="card-header">
            <h1><i class="fa fa-money"></i>  Amortización</h1>
            <p>
               La depreciación y la amortización, hacen referencia al desgaste o agotamiento que sufre un activo en la medida que con su utilización contribuye a generar ingresos a la empresa.  </p>
            <p>
             <a tabindex="0" class="btn btn-lg" role="button" style="float: right !important" data-toggle="popover"  data-trigger="focus" title="¿Necesitas ayuda?" data-content="Teclea el monto de cada recurso de tu empresa que a lo largo del tiempo va a perder. "><i class="fa fa-question-circle"></i></a>
        </div>

        <div class="tab-content  tab-pane" id="myTabContent2">
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">          
                    <div class="card-header">
                        <h5><i class="fa fa-table"></i>  Amortización</h5>
                    </div>      
                    <div class="table-responsive">
                        <table class="table table-bordered" id="amortTable" >
                            <thead>
                                <tr>
                                    <th >Concepto</th>
                                    <th >$ Costo</th>
                                    <th class="porcentaje">%</th>
                                    <th >Total</th>
                                    <th class="elim"></th>
                
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="previous">Terrenos</td>
                                    <td class="costo">0</td>
                                    <td class="porct">20</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Edificios</td>
                                    <td class="costo">0</td>
                                    <td class="porct">5</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Transporte</td>
                                    <td class="costo">0</td>
                                    <td class="porct">25</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Cómputo</td>
                                    <td class="costo">0</td>
                                    <td class="porct">30</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                 <tr>
                                    <td class="previous">Mobiliario</td>
                                    <td class="costo">0</td>
                                    <td class="porct">10</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                 <tr>
                                    <td class="previous">Equipo de Oficina</td>
                                    <td class="costo">0</td>
                                    <td class="porct">10</td>
                                    <td data-editable="false">0</td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th><strong>TOTAL</strong></th>
                                    <th></th>
                                    <th class="na"></th>
                                    <th id="total"></th>
                                    <th class="na"></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                 </div>  

            <div class="row">
                <div class="col">
                    <asp:Button id="add_row" 	CssClass="btn btn-primary"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                </div>
                <div class="col">
                  

                    <asp:LinkButton runat="server" ID="guardar_amort" OnClientClick="return false;" CssClass="btn btn-primary">
                        <i class='fa fa-save'></i> Guardar
                    </asp:LinkButton>
                                               
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
     <!-- plugin editable-->
        <script src="../Scripts/editable-table/mindmup-editabletable.js"></script>
        <script src="../Scripts/editable-table/numeric-input-example.js"></script>
        <script src="../Scripts/editable-table/edittable.js"></script> 
    <!-- plugin editable-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../Scripts/editable-table/jquery.tabletojson.min.js"></script>

</asp:Content>

