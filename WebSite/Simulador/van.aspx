<%@ Page  Title="" Async="true" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="van.aspx.cs" Inherits="User_van" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
        <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />


<!-- Scrip para graficas debe estar en Head-->    
        <script src="../Scripts/Chart.js"></script>
        <script src="../Scripts/startbootstrap/js/sb-admin-charts.js"></script> 
 <!-- Scrip para graficas debe estar en Head-->    
        
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">    


                <nav aria-label="breadcrumb">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index.aspx">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Valor Actual Neto</li>
                          </ol>            
                 </nav>  
              <div class="card align-middle">  
                  <div class="card-header">
                        <h1><i class="fa fa-line-chart"></i> Valor Actual Neto (VAN)</h1>
                  </div>
              </div>

                 <div class="row">
                        <div class="col-10 "> <p> A continuación, usted podrá calcular el Valor Actual Neto (VAN)</p></div>
                        <div class="col-2 " >
                            <a tabindex="0" class="btn btn-lg" role="button" style="float: right !important" data-toggle="popover"  data-trigger="focus" title="Necesitas ayuda?" data-content="Y aquí hay un contenido increíble. Es muy atractivo. "><i class="fa fa-question-circle"></i></a>
                        </div>
                </div>
           
                          <div class="form-row">
                                        <div class="col-md-3 mb-4">
                                          <label for="validationCustom01">Inversión</label>
                                                  <div class="input-group">
                                                        <div class="input-group-append">
                                                             <span class="input-group-text" id="inputGroupPrepend0">$</span>
                                                             <span class="input-group-text">0.00</span>
                                                            
                                                        </div>
                                                            <asp:TextBox CssClass="form-control" ID="Inversion" placeholder="Ingrese la inversion" CausesValidation="True" runat="server" ToolTip="Ingrese valor ejemplo"  required="required" />
                                                        <div class="invalid-feedback">                       
                                                          Por favor ingrese la inversion.
                                                        </div>
                                                        <div class="valid-feedback">
                      
                                                        </div>                   
                                                  </div> 
                                                <asp:RegularExpressionValidator ID="RegularExpression1" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="Inversion" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                                        </div>

                                        <div class="col-md-3 mb-4">
                                          <label for="validationCustom02">Flujo Neto de Efectivo</label>
                                                 <div class="input-group">
                                                        <div class="input-group-prepend">
                                                          <span class="input-group-text" id="inputGroupPrepend1">$</span>
                                                             <span class="input-group-text">0.00</span>
                                                        </div>
                                                             <asp:TextBox CssClass="form-control" id="FNE" placeholder="Ingrese el Flujo Neto de Efectivo" CausesValidation="True" runat="server"  required="required"/>
                                                        <div class="invalid-feedback">
                                                          Por favor ingrese el FNE.
                                                        </div>
                                                        <div class="valid-feedback">
                       
                                                        </div>
                                                  </div>  
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="FNE" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                   
                                        </div>

                                        <div class="col-md-3 mb-4">
                                          <label for="validationCustom03">Valor de Salvamento</label>
                                                  <div class="input-group">
                                                        <div class="input-group-prepend">
                                                          <span class="input-group-text" id="inputGroupPrepend2">$</span>
                                                             <span class="input-group-text">0.00</span>
                                                        </div>
                                                            <asp:TextBox  CssClass="form-control" id="VdS" placeholder="Ingrese el valor de salvamento"  runat="server"   required="required"/>
                                                        <div class="invalid-feedback">
                                                          Por favor ingrese el valor de salvamento
                                                        </div>
                                                        <div class="valid-feedback">
                       
                                                        </div>
                                                  </div>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="Vds" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                                         </div>
                                          <div class="col-md-3 mb-4">
                                          <label for="validationCustom04">TMAR</label>
                                                  <div class="input-group">                    
                                                        <asp:TextBox  CssClass="form-control" id="TMAR" placeholder="Ingrese el valor de TMAR"  runat="server"  required="required"/>
                                                        <div class="input-group-prepend">
                                                          <span class="input-group-text" id="inputGroupPrepend3">%</span>
                                                        </div>
                                                        <div class="invalid-feedback">
                                                          Por favor ingrese el valor de TMAR.
                                                        </div>
                                                        <div class="valid-feedback">
                       
                                                        </div>
                                                  </div> 
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="TMAR" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                   
                                        </div> 
                          </div>
                          <div class="form-row">     
                                        <div class="col-md-4 mb-2">
                                          <label for="validationCustom05">Plazo (n)</label>
                                                  <div class="input-group">                   
                                                       <asp:TextBox  CssClass="form-control" id="n" placeholder="Ingrese el plazo del proyecto"  runat="server" required="required"/> 
                   
                                                                  <div class="input-group-append">
                                                                      <select  class="btn btn-outline-secondary " id="Select" runat="server" required="required">
                                                                                      <option value="" class="dropdown-item">Seleccione</option>
                                                                                      <option value="Mes" class="dropdown-item">Mes</option>
                                                                                      <option value="Año" class="dropdown-item">Año</option>
                                                                       </select>
                                                                 </div>
                                                        <div class="invalid-feedback">
                                                          Por favor seleccione
                                                        </div>
                                                        <div class="valid-feedback">
                                                        </div>
                                                  </div>
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="n" ValidationExpression="([0-9]*)?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                                        </div>                
                          </div>

                          <div class="form-row">  
                                <div class="col-md-5 mb-5">
                                    <div class="form-group">
                                        <div class="form-check">
                                          <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                          <label class="form-check-label" for="invalidCheck">
                                                Acepta los términos y condiciones
                                          </label>
                                          <div class="invalid-feedback">
                                             Debe aceptar los terminos antes de enviar
                                          </div>
                                        </div>
                                      </div>        
                                </div>
                          </div>
   
  <!--   <asp:GridView class="table table-bordered" id="myTable"  runat="server">  
                           
    </asp:GridView> -->


                        <div class="form-row">
                            <div class="col-md-2 mb-3">
                                <div class="form-row">   
                                        <div class="col-md-3 mb-3">
                                                <asp:Button id="Button1" 	CssClass="btn btn-primary" OnClick="GreetingBtn_Click"  v Text="Calcular"  runat="server"/>
                                        </div>                            
                                </div>
                                </div>
                        </div>   




              <div class="card align-middle" id="ResultadosVAN" runat="server" >    
                    <div class="card-header">
                      <h4> <i class="fa fa-line-chart"></i> Resultados </h4>
                    </div>
                        <ul class="nav nav-tabs">
        		            <li class="nav-item">
        			            <a href="#Resultado" class="nav-link active" role="tab" data-toggle="tab">VAN</a>
        		            </li>
        		            <li class="nav-item">
        			            <a href="#Resultado2" class="nav-link" role="tab" data-toggle="tab">TIR</a>
        		            </li>
                            <li class="nav-item">
        			            <a href="#Resultado3" class="nav-link" role="tab" data-toggle="tab">Periodo de Recuperación</a>
        		            </li>
                            <li class="nav-item">
        			            <a href="#Resultado4" class="nav-link" role="tab" data-toggle="tab">Beneficio/Costo</a>
        		            </li>
        		            <li class="nav-item">
        			            <a href="#Tabla" class="nav-link" role="tab" data-toggle="tab">Tabla</a>
        		            </li>
        		            <li class="nav-item">
        			            <a href="#Grafica" class="nav-link" role="tab" data-toggle="tab">Grafica</a>
        		            </li>
				            <li class="nav-item">
        			            <a href="#Descargas" class="nav-link" role="tab" data-toggle="tab">Descargas</a>
        		            </li>
        	            </ul>
                        <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="Resultado">
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                                                    <div class="card-header" >
                                                            <h5><i class="fa fa-dollar"></i>  Resultado VAN</h5>
                                                    </div>
                                                    <div class="breadcrumb">
                                                        <div class="card-body text-info">
                                                        <h3>    <asp:Label id="VAN" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                                                        </div>
                                                    </div>
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Resultado2">
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">                       
                                                    <div class="card-header" >
                                                            <h5> <i class="fa fa-percent"></i> Tasa Interna de Rendimiento</h5>
                                                    </div>
                                                    <div class="breadcrumb">
                                                        <div class="card-body text-info">
                                                        <h3>    <asp:Label id="TIR" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                                                        </div>
                                                    </div>
                                        </div>
                                </div>
                               <div role="tabpanel" class="tab-pane fade" id="Resultado3">
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">                       
                                                    <div class="card-header" >
                                                            <h5> <i class="fa fa-percent"></i> Periodo de Recuperación</h5>
                                                    </div>
                                                    <div class="breadcrumb">
                                                        <div class="card-body text-info">
                                                        <h3>    <asp:Label id="PeridoRec" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                                                        </div>
                                                    </div>
                                        </div>
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">                       
                                                    <div class="card-header" >
                                                            <h5> <i class="fa fa-percent"></i> Periodo de Recuperación en funcion del ingreso actualizado </h5>
                                                    </div>
                                                    <div class="breadcrumb">
                                                        <div class="card-body text-info">
                                                        <h3>    <asp:Label id="PeridoRec2" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                                                        </div>
                                                    </div>
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Resultado4">
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">                       
                                                    <div class="card-header" >
                                                            <h5> <i class="fa fa-percent"></i> Beneficio/Costo </h5>
                                                    </div>
                                                    <div class="breadcrumb">
                                                        <div class="card-body text-info">
                                                        <h3>    <asp:Label id="BenCosto" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                                                        </div>
                                                    </div>
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Tabla">
                                        <div  class="container-fluid card-body" style="padding-top:15px;padding-bottom:15px">
                                             <div class="card-header">
                                                <h5><i class="fa fa-table"></i>  Tabla</h5>
                                             </div>
                                                                               <div class="table-responsive breadcrumb">
                                                                                     <Table class="table table-bordered" id="dataTableVAN"   >
                                                                                      <thead>
                                                                                        <tr>
                                                                                          <th>Año/Mes</th>
                                                                                          <th>Costos</th>                                                                                            
                                                                                          <th>Ingresos</th>
                                                                                          <th>Flujo Neto de Efectivo</th>
                                                                                          <th>Ingreso Actualizado</th>
                                                                                          <th>Periodo de Recuperación</th>
                                                                                        </tr>
                                                                                      </thead>
                                                                                      <tfoot>
                                                                                        <tr>
                                                                                          <th>Año/Mes</th>
                                                                                          <th>Costos</th>                                                                                            
                                                                                          <th>Ingresos</th>
                                                                                          <th>Flujo Neto de Efectivo</th>
                                                                                          <th>Ingreso Actualizado</th>
                                                                                          <th>Periodo de Recuperación</th>
                                                                                        </tr>
                                                                                      </tfoot>
                                                                                      <tbody>
                                                                                        <tr>
                                                                                          <td>Año 0</td>
                                                                                          <td>$260,000</td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                          <td>Año 1</td>
                                                                                          <td>$260,000</td>
                                                                                          <td>$650,000</td>
                                                                                          <td>$350,000</td>
                                                                                          <td>$590,909.35</td>
                                                                                          <td>$-391,000</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                          <td>Año 2</td>
                                                                                          <td>$260,000</td>
                                                                                          <td>$650,000</td>
                                                                                          <td>$350,000</td>
                                                                                          <td>$537,190.08</td>
                                                                                          <td>$-41,000</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                          <td>Año 3</td>
                                                                                          <td>$260,000</td>
                                                                                          <td>$650,000</td>
                                                                                          <td>$350,000</td>
                                                                                          <td>$488,354.62</td>
                                                                                          <td>$309,000</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                           <td>Año 4</td>
                                                                                          <td>$260,000</td>
                                                                                          <td>$650,000</td>
                                                                                          <td>$350,000</td>
                                                                                          <td>$443,958.75</td>
                                                                                          <td>$403,598</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                          <td>Año 5</td>
                                                                                          <td>$260,000</td>
                                                                                          <td>$650,000</td>
                                                                                          <td>$350,000</td>
                                                                                          <td>$403,598</td>
                                                                                          <td>$1,009,000</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                         <td>Año 6</td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                          <td></td>
                                                                                          <td>$1,404,000</td>
                                                                                        </tr>                                                                                        
                                                                                      </tbody>
                                                                                </Table>
                                                                         </div>
             
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Grafica">
                                        <div  class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                                            <div class="card-header">
                                                <h5><i class="fa fa-bar-chart"></i>  Grafica</h5>
                                            </div>
                                            <div class="card-body breadcrumb">
                                              <canvas id="myAreaChart" width="100" height="30"></canvas>
                                            </div>
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="Descargas">
                                        <div  class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                                          <div class="card-header">
                                            <h5><i class="fa fa-cloud-download"></i>   Descargas</h5>
                                          </div>
                                            <div class="breadcrumb">
                                              <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
                                              <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
                                            </div>
                                        </div>
                               </div>
                         </div>
                    <div class="card-footer small text-muted"> Actualizado el  <%: DateTime.Today %></div>   
            </div>



    <!-- The Modal -->
              <div class="modal fade" id="myModal" >
                <div class="modal-dialog">
                  <div class="modal-content">      
                        <!-- Modal Header -->
                        <div class="modal-header">
                             <h4 class="modal-title"> <i class="fa fa-check-square-o"></i> Diagnóstico de Inversión</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>        
                        <!-- Modal body -->
                        <div class="modal-body" id="modal-text-body">
                        
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                           <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                  </div>
                </div> 
<!-- The Modal -->
</asp:Content>

<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
 <!-- Manejo de funcion de tabla en VAN-->
         <script src="../Scripts/startbootstrap/js/sb-admin-datatables-van.js"></script>
        <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
<!-- Manejo de funcion de tabla en VAN-->

<!-- Para validacion de campos-->
        <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
               (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                    //form.classList.add('was-feedback');
                }, false);
            });
        }, false);
    })();
        </script>
<!-- Para validacion de campos-->

 </asp:Content>