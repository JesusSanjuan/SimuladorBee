<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="amortizacion.aspx.cs" Inherits="Simulador_Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="../Scripts/rangeslider/rangeslider.css" rel="stylesheet" />
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Amortización</li>
        </ol>
    </nav>
    <div style="padding-bottom:1rem;">
             <div class="card align-middle">
        <div class="card-header" >
            <h1><i class="fa fa-money"></i> Depreciación y Amortización</h1>
            <div class="row">
                <div class="col col-10">
                   La depreciación y la amortización, hacen referencia al desgaste o agotamiento que sufre un activo en la medida que con su utilización contribuye a generar ingresos a la empresa.  
                </div>
                <div class="col col-2">
                    <a tabindex="0" class="btn btn-lg" role="button" style="float: right !important" data-toggle="popover"  data-trigger="focus" title="¿Necesitas ayuda?" data-content="Teclea el costo de cada equipo y automaticamente genereza su depreciación o amortización."><i class="fa fa-question-circle"></i></a>
                </div>
            </div>
        </div>

        <div class="tab-content  tab-pane" id="myTabContent2">
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">   
                        <div class="alert alert-warning alert-dismissible fade show" id="warning" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>¡Antes de comenzar!</strong> Selecciona el período a cacular.
                        </div>  
                        <div class="form-group text-center">
                        <label for="selecciona" class="col-form-label"><strong id="lapso">Selecciona el período: </strong></label>
                            <select class="selectpicker show-tick" id="cnperiodo">
                            </select>
                        </div> 
                        <input type="hidden" id="lapse" />
                        <div class="preborder">   
                                <div class="card-header">
                                    <h5><i class="fa fa-table"></i>  Amortización</h5>
                                </div>      
                                <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;" >
                                    <table class="table table-striped table-bordered" id="amortTable" >
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
                                                <th ></th>
                                                <th class="na"></th>
                                                <th id="total"></th>
                                                <th class="na"></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                    </div>
            </div>  
            <div class="form-row" style="margin-top:5px;  padding-bottom:20px;">
                <div class="col text-center">
                    <asp:Button id="add_row" 	CssClass="btn btn-primary"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                </div>
                <div class="col text-center">
                    <asp:LinkButton runat="server" ID="guardar_amort" OnClientClick="return false;" CssClass="btn btn-primary">
                        <i class='fa fa-save'></i> Guardar
                    </asp:LinkButton>
                </div>
            </div>

        </div>

    </div>
    </div>

    <!-- modal de succes -->
    <div class="modal fade bd-example-modal-sm" id="successA" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!--- input hidden-->
                <!--<input type="hidden" name="selector" id="selector" value=""/>-->
                <!-- Modal Header -->
                <div class="modal-header">
                        <h4 class="modal-title"> <i class="fa fa-check-square-o"></i> Mensaje</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>        
                <!-- Modal body -->
                <div class="modal-body" id="modal-text-body">
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
                        <div class="modal-body" id="modal-text-body2">
                            Desea Guardar y Continuar con el ingreso de Datos?
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button  id="costo_cancel" type="button" class="btn btn-danger " data-dismiss="modal">Cancelar</button>
                            <button  id="costo_continuar" type="button" class="btn btn-primary" data-dismiss="modal">Continuar</button>
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
    <script>
       
/*Solamente efecto visual aun no se que que js guardarlo*/
 $(document).ready(function () {             
        
        $('#warning').addClass("pulse animated"); //otra manera de aplicar efectos   https://api.jquery.com/hover/
         $("#warning").css({
                    "-webkit-animation-play-state": "paused",//mantiene efecto pausado
                    "-webkit-animation-duration": "3s", //velocidad de efecto
                    "-webkit-animation-delay": "2s", // Tiempo a esperar antes de empezar a  ejecutar animacion
                    "-webkit-animation-iteration-count": "2"
                    //"-webkit-animation-timing-function" :'ease',//La opción por defecto es ease. La animación comienza lento, después rápido y por último termina otra vez lento.
                   // "-webkit-animation": "mymove 5s; ", //Velocidad de la animacion
                   //  "animation": "mymove 5s;"//Velocidad de la animacion
                }); 

     $("#warning").hover(function () { //Ejecuta efecto hasta que pasa sobre el elemento
         $( this ).addClass( "hover" );
         $(this).css({
                     "-webkit-animation-play-state": "running",
                     "animation-play-state": "running"// Ejecuta efecto
                }); 

     }, function() {
                $( this ).removeClass( "hover" );
        }
     );
 });

/*Solamente efecto visual aun no se que que js guardarlo*/

    </script>

</asp:Content>

