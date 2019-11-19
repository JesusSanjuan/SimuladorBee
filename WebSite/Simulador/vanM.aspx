<%@ Page  Title="" Async="true" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="vanM.aspx.cs" Inherits="User_vanM" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">        
        <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
        <link href="../Content/bootstrap-select.css" rel="stylesheet" />
        <link href="../Content/Precarga/load-van.css" rel="stylesheet" />
        <!-- Diseños visuales-- https://coreui.io CoreUIFree-->
        <link href="../Content/CoreUIFree/coreuiswitch.css" rel="stylesheet" />
         <!-- Diseños visuales-- https://coreui.io  CoreUIFree-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"  >    
    
     <div >
                <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Valor Actual Neto</li>
                          </ol>            
                 </nav>  
                 <div class="card align-middle">  
                      <div class="card-header">
                            <h1><i class="fas fa-chart-line"></i> Calculadora de VAN y TIR</h1>
                             El uso de estos criterios de evaluacion financiera le permitira saber si se acepta o rechazo un proyecto de inversión.         
                      </div>
                </div>
    </div>
    <div style="padding-top:1rem;">
        <div class="row">
                <div class="col-12" style="padding-bottom:1rem;">  A continuación, usted podrá calcular el Valor Actual Neto (VAN)</div>
        </div>                        
        <div class="form-row" >
            <div class="col-md-4 mb-2">
                <label for="validationCustom01">Inversión</label>
                    <div class="input-group" style="cursor:default" >
                            <div class="input-group-append"  >
                                    <span class="input-group-text" id="inputGroupPrepend0">$</span>
                                    <span class="input-group-text">0.00</span>                                                            
                            </div>
                                <input type="text"   class="form-control number" id="Inversion" placeholder="Ingrese la inversion"  autocomplete="off"  style="cursor:pointer" required="required">
                            <div class="input-group-append">                                                             
                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Es aquel gasto monetario realizado para la compra de los activos fijos y diferidos necesarios para comenzar el proyecto, pero que no incluyen el capital de trabajo." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                            </div>
                            <div id="Inversionval" class="invalid-tooltip"> 
                                Por favor ingrese la inversion.
                            </div>                 
                        </div> 
            </div>
            <div class="col-md-4 mb-2">
            <label for="validationCustom04">Rentabilidad requerida (TMAR)</label>
                <div class="input-group" style="cursor:default">                    
                        <input type="text"   class="form-control number4" id="TMAR" placeholder="Ingrese el valor de TMAR" autocomplete="off" style="cursor:pointer" required="required">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend3">%</span>
                            <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content=" TMAR (Tasa Mínima Aceptable de Rendimiento): es la tasa de ganancia anual que solicita ganar el inversionista para llevar a cabo la instalación y operación de la empresa." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                        </div>
                        <div  id="TMARval"class="invalid-tooltip">
                            Por favor ingrese el valor de TMAR
                        </div>
                </div> 
            </div>  
            <div class="col-md-4 mb-2">
                <label for="validationCustom03">Valor de Salvamento</label>
                  <div class="input-group" style="cursor:default">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend2">$</span>
                                    <span class="input-group-text">0.00</span>
                            </div>
                                <input type="text"   class="form-control number3" id="VdS" placeholder="Ingrese el valor de salvamento" autocomplete="off" style="cursor:pointer" required="required">
                            <div class="input-group-append">                                                             
                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="El valor de rescate o salvamento se calcula restando la depreciación acumulada hasta ese periodo al valor de adquisición." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                            </div> 
                            <div id="VdSval"class="invalid-tooltip">
                                Por favor ingrese el valor de salvamento
                            </div>
                </div>
            </div>
        </div>
        <div class="form-row">     
                        <div class="col-md-8 mb-2 preborder" >
                            <div class="form-row"> 
                                <div class="col-md-12 mb-2">
                                    <label for="validationCustom05">Plazo (n)</label>    
                                </div>
                            </div>
                            <div class="form-row"> 
                                <div class="col-md-6 mb-2">  
                                    <div class="input-group">
                                        <select  id="select" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" >
                                                                        <option value="" class="dropdown-item" selected>Seleccione</option>
                                                                        <option value="1" class="dropdown-item">Mes</option>
                                                                        <option value="2" class="dropdown-item">Año</option>
                                        </select>                                             
                                        <div class="input-group-append ">
                                                        <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover"  data-trigger="hover" title="¿Necesitas ayuda?" data-content="Selecciona el períodos de tiempo que se adecue mas a tu proyecto." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                        </div>                                                       
                                    </div>
                                    <div id="selectval" class="invalid-tooltip">                                                               
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2"> 
                                        <div class="input-group" style="cursor:default">                                                            
                                                <input type="text"   class="form-control" id="n" data-toggle="popover" data-placement="bottom" placeholder="Ingrese el periodo" autocomplete="off" disabled="disabled"  style="cursor:default" required="required">                                                         
                                            <div class="input-group-append" >
                                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important" data-toggle="popover"  data-trigger="hover" title="¿Necesitas ayuda?" data-content="1,2...n: Numero de periodos de vida util del proyecto." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                            </div>                                                         
                                        </div>
                                        <div id="nval" class="invalid-tooltip">                                                               
                                        </div>
                                </div>
                               </div>
                            </div>     
                            <div class="col-md-3.9 mb-2 preborder" style="margin-left:5px">     
                                    <div class="form-row"> 
                                        <div class="col-md-12 mb-2" >  
                                            <label style="display: flex;justify-content: center;align-items: center;">Desea optimizar los Flujos Netos de Efectivo?</label>    
                                        </div>
                                    </div>
                                    <div class="form-row">  
                                        <div class="col-md-5 mb-2">
                                                      
                                        </div>
                                        <div class="col-md-2 mb-2">    
                                            <label class="switch switch-label switch-dark">                                           
                                                            <input type="checkbox"  id="optimizacion"  class="switch-input" value="1">
                                                            <span class="switch-slider" data-checked="&#x2713;" data-unchecked="&#x2715;" ></span>
                                                </label>
                                        </div>
                                        <div class="col-md-5 mb-2"> 
                                        </div>  
                                    </div>
                            </div>
        </div>
        <div class="form-row">  
            <div class="col-md-4 mb-2">
            </div>  
            <div class="col-md-4 mb-2">
                <button id="continuar" class="btn btn-primary btn-lg btn-block" type="button">Continuar</button>
            </div>   
            <div class="col-md-4 mb-2">
            </div>   
        </div>  
   </div>
    <div id="PreCalculoVAN" style="display:none;">
        <div style="padding-bottom:1rem;">
                  <div class="card align-middle"> 
                        <div class="card-header">
                          <h4><i class="fas fa-pencil-alt"></i> Ingreso de costos, ingresos y flujos netos de efectivo</h4>
                        </div>              
                        <div class="tab-content" id="myTabContent">
                                <div class="table-responsive" style="margin-top: 15px; padding-bottom:0px;">
                                    <Table class="table table-striped" style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;"   id="vanManual"   >
                                            <thead>
                                                <tr>
                                                    <th id="tipo"></th>
                                                    <th>Costos</th>  
                                                    <th>Ingresos</th>
                                                    <th>Flujo Neto de Efectivo</th>                                                
                                                </tr>
                                            </thead>
                                            <tbody  id="dataTable">                                                                                                                                                                           
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th id="tipo2"></th>
                                                    <th id="thcobros">Costos</th> 
                                                    <th id="thpagos">Ingresos</th>
                                                    <th id="thFNE">Flujo Neto de Efectivo</th>                                                
                                                </tr>
                                            </tfoot>                                                                                                     
                                    </Table>
                                </div>                                           
                            </div>
                  </div>
        </div>
        <div class="form-row" style="margin-top: 15px; padding-bottom:0px;">  
                <div class="col-md-4 mb-2">
                </div>  
                <div class="col-md-4 mb-2">
                    <button id="calcular" class="btn btn-primary btn-lg btn-block" type="button">Calcular</button>
                </div>  
                <div class="col-md-4 mb-2">
                </div>   
        </div>
            <div style="padding-bottom:1rem;">
                  <div class="card align-middle" id="ResultadosVAN" style="display:none;">    
                        <div class="card-header">
                          <h4> <i class="fas fa-chart-pie"></i> Resultados del cálculo del Valor Actual Neto (VAN)</h4>
                        </div>
                           <ul class="nav nav-tabs">
        		                <li class="nav-item">
        			                <a href="#Resultado" onclick="location.href='#ResultadosFinales'" class="nav-link active" role="tab" data-toggle="tab">VAN</a>
        		                </li>
        		                <li class="nav-item">
        			                <a href="#Resultado2" onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">TIR</a>
        		                </li>
                                <li class="nav-item">
        			                <a href="#Resultado3" onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">Periodo de Recuperación</a>
        		                </li>
                                <li class="nav-item">
        			                <a href="#Resultado4" onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">Beneficio/Costo</a>
        		                </li>
        		                <li class="nav-item">
        			                <a href="#Tabla"  onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">Tabla</a>
        		                </li>
        		                <li class="nav-item">
        			                <a href="#Grafica" onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">Gráfica</a>
        		                </li>
                                <li class="nav-item" id="OptimizacionArea" style="display:none;">
        			                <a href="#Optimizacion" data-anijs=" if: mouseover, do: pulse animated" onclick="location.href='#ResultadosFinales'" class="nav-link pulse animated infinite" role="tab" data-toggle="tab">Optimizacion</a>
        		                </li>
				                <li class="nav-item">
        			                <a href="#Descargas" onclick="location.href='#ResultadosFinales'" class="nav-link" role="tab" data-toggle="tab">Descargas</a>
        		                </li>
        	                </ul>
                            <div class="tab-content" id="ResultadosFinales">
                                    <div role="tabpanel" class="tab-pane fade show active" id="Resultado">
                                            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                                                 <div class="preborder">
                                                        <div class="card-header" >
                                                                <h5><i class="fas fa-dollar-sign"></i>  Resultado VAN</h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">
                                                                    <h3><label id="VAN" class="card-text"></label></h3>
                                                            </div>
                                                        </div>
                                                 </div>
                                                <div class="preborder" style="margin-top: 15px">
                                                        <div class="card-header" >
                                                                <h5><i class="fas fa-dollar-sign"></i> Que es el VAN, VNA o VPN?</h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">                                                               
                                                                    El Valor Actual Neto, Valor Neto Actual o Valor Presente Neto es un procedimiento que permite calcular el valor presente de un determinado número de flujos de caja futuros, originados por una inversión. <br/>
                                                                    La inversión se considera aceptable cuando su VAN es mayor que cero. Si el VAN es menor que cero la inversión es rechazada. Además, se da preferencia a aquellas inversiones cuyo VAN sea más elevado. <br/>
                                                                    Con esta aplicación podemos calcular el Valor Actual Neto de una inversión conociendo la rentabilidad requerida para la misma, su duración, el desembolso inicial de capital y los flujos de caja esperados.  <br/><br/>
                                                                    <i><b>Ejemplo: </b></i>
                                                                    Una inversión supone un desembolso inicial de 8,000 MXN, unos cobros anuales de 4,000 MXN y unos pagos de 2,000 MXN, durante 5 años lo cual resulta a flujos constantes de 2,000 MXN.<br/>
                                                                    Además, le exigimos a la inversión una rentabilidad mínima del 6,4%. <br/>  <br/>                                                              
                                                                     <i> <b>Resultado: </b></i>
                                                                     Obteniendo como resultado el VAN de $333.84 y siendo una inverion Aceptable.
                                                            </div>
                                                        </div>
                                                 </div>
                                            </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Resultado2">
                                            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">  
                                                <div class="preborder">
                                                        <div class="card-header" >
                                                                <h5> <i class="fa fa-percent"></i> Tasa Interna de Rendimiento</h5>
                                                        </div>
                                                        <div class="fondoresultados" >
                                                            <div class="card-body text-info">
                                                            <h3><label id="TIR" class="card-text"></label></h3>
                                                            </div>
                                                        </div>
                                                </div>  
                                                <div class="preborder" style="margin-top: 15px">
                                                    <div class="card-header" >
                                                            <h5> <i class="fa fa-dollar-sign"></i> TMAR de la TIR</h5>
                                                    </div>
                                                    <div class="fondoresultados" >
                                                        <div class="card-body text-info">
                                                        <h3><label id="TMARTIR" class="card-text"></label></h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="preborder" style="margin-top: 15px">
                                                        <div class="card-header" >
                                                                <h5><i class="fas fa-dollar-sign"></i> Que es la TIR o TMAR?</h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">         
                                                                La Tasa Interna de Rentabilidad de una inversión es el tipo de interés con el cual el Valor Actual Neto de esa inversión es igual a cero (ver apartado VAN).<br/>
                                                                La TIR  es la<i><b> i </b></i>que hace el VPN = <i><b>0</b></i><br/>
                                                                El calculo de una TIR en la evaluacion ecomica de culaquier proyecto de inversion, en realidad implica la obtencion de una o varias raices reales positivas en un polinomio de grado n, la cual se rige por la regla de los signos de descartes que dice: <br/><br/>

                                                                    &nbsp;&nbsp;&nbsp;&nbsp;<i> Un polinomio de grado n puede tener tantas raices como cambios de signos tenga el polinomio.</i><br/><br/>

                                                                Tambien la TIR se puede definir como la tasa de interés o rentabilidad que ofrece una inversión. Es decir, es el porcentaje de beneficio o pérdida que tendrá una inversión para las cantidades que no se han retirado del proyecto.<br/>
                                                                
                                                                La Tasa Minima Aceptable de Rendimiento (TMAR) de igual manera es un porcentaje que por lo regular determina una persona que va invertir en un proyecto.<br/><br/>                                                                
                                                                Se utiliza para decidir sobre la aceptación o rechazo de un proyecto de inversión. Para ello, la TIR se compara con un tipo mínimo. Si el tipo TIR supera al tipo mínimo, se acepta la inversión; en caso contrario, se rechaza. Además, se da preferencia a aquellas inversiones cuyo TIR sea más elevado.<br/>
                                                                Con esta aplicación podemos calcular la TIR de una inversión, es decir la rentabilidad efectiva anual que obtendríamos. Para calcular la TIR de una operación de inversión tenemos que introducir la duración, el desembolso inicial y los cobros y pagos de la operación. <br/><br/>
                                                                <i> <b>Ejemplo: </b></i>
                                                                Una inversión supone un desembolso inicial de 8,000 MXN, unos cobros anuales de 4,000 MXN y unos pagos de 2,000 MXN, durante 5 años lo cual resulta a flujos constantes de 2,000 MXN.<br/><br/>
                                                                <i> <b>Resultado: </b></i>
                                                                 7.93 %. Aceptaremos el proyecto de inversión siempre que la rentabilidad sea inferior a ese 7.93% 
                                                            </div>
                                                        </div>
                                                 </div>
                                            </div>
                                    </div>
                                   <div role="tabpanel" class="tab-pane fade" id="Resultado3">
                                            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">    
                                                <div class="preborder">
                                                        <div class="card-header" >
                                                                <h5> <i class="fa fa-percent"></i> Periodo de Recuperación</h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">
                                                            <h3>  <label id="PeridoRec" class="card-text"></label></h3>
                                                            </div>
                                                        </div>
                                                 </div>
                                            </div>
                                            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">  
                                                <div class="preborder">
                                                        <div class="card-header" >
                                                                <h5> <i class="fa fa-percent"></i> Periodo de Recuperación en funcion del ingreso actualizado </h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">
                                                            <h3> <label id="PeridoRec2" class="card-text"></label> </h3>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Resultado4">
                                            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">   
                                                <div class="preborder">
                                                        <div class="card-header" >
                                                                <h5> <i class="fa fa-percent"></i> Beneficio/Costo </h5>
                                                        </div>
                                                        <div class="fondoresultados">
                                                            <div class="card-body text-info">
                                                            <h3>  <label id="BenCosto" class="card-text"></label> </h3>
                                                            </div>
                                                        </div>
                                                 </div>
                                            </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Tabla">
                                        <div  class="container-fluid card-body">
                                                            <div class="preborder">
                                                                     <div class="card-header">
                                                                        <h5><i class="fa fa-table"></i>  Tabla</h5>
                                                                     </div>
                                                                                               <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                                                                                     <Table class="table table-striped"  style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;"  id="dataTableVAN"  >
                                                                                                          <thead>
                                                                                                            <tr>
                                                                                                              <th></th>
                                                                                                              <th id="tipo3"></th>
                                                                                                              <th>Costos</th>                                                                                            
                                                                                                              <th>Ingresos</th>
                                                                                                              <th>Flujo Neto de Efectivo</th>
                                                                                                              <th>Ingreso Actualizado</th>
                                                                                                              <th>Periodo de Recuperación</th>
                                                                                                              <th>Periodo de Recuperación en funcion del ingreso actualizado</th>
                                                                                                            </tr>
                                                                                                          </thead>
                                                                                                          <tbody  id="dataTableVANBody">                                                                                                                                                                           
                                                                                                          </tbody>
                                                                                                          <tfoot>
                                                                                                            <tr>
                                                                                                              <th></th>
                                                                                                              <th id="tipo4"></th>
                                                                                                              <th>Costos</th>                                                                                            
                                                                                                              <th>Ingresos</th>
                                                                                                              <th>Flujo Neto de Efectivo</th>
                                                                                                              <th>Ingreso Actualizado</th>
                                                                                                              <th>Periodo de Recuperación</th>
                                                                                                              <th>Periodo de Recuperación en funcion del ingreso actualizad</th>
                                                                                                            </tr>
                                                                                                          </tfoot>                                                                                                     
                                                                                                    </Table>
                                                                                              </div>
                                                          </div>
                                            </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Grafica">
                                            <div  class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                                                <div class="preborder">
                                                        <div class="card-header">
                                                            <h5><i class="far fa-chart-bar"></i>  Gráfica</h5>
                                                        </div>
                                                        <div class="card-body fondoresultados">
                                                          <canvas id="myAreaChart" width="100" height="50"></canvas>
                                                        </div>
                                                 </div>
                                            </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Optimizacion">
                                        <div  class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                                                <div class="preborder">
                                                    <div class="card-header">
                                                        <h5><i class="fa fa-table"></i>  Tabla de Flujos Netos Optimizados</h5>
                                                    </div>
                                                                <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                                                        <Table class="table table-striped"  style="width:100%; border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6; border-bottom: 1px solid #dee2e6;"  id="dataTableFNEOpti"  >
                                                                            <thead>
                                                                            <tr>
                                                                                <th></th>                                                                            
                                                                                <th>Flujo Neto de Efectivo</th>
                                                                                <th>Flujo Neto de Efectivo Optimizado</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody  id="dataTableFNEoptimizado">                                                                                                                                                                           
                                                                            </tbody>
                                                                            <tfoot>
                                                                            <tr>
                                                                                <th></th>                                                                            
                                                                                <th>Flujo Neto de Efectivo</th>
                                                                                <th>Flujo Neto de Efectivo Optimizado</th>
                                                                            </tr>
                                                                            </tfoot>                                                                                                     
                                                                    </Table>
                                                                </div>
                                                </div>
                                            <div class="preborder" style="margin-top: 15px">
                                                <div class="card-header" >
                                                        <h5> <i class="fa fa-percent"></i> Tasa Interna de Rendimiento</h5>
                                                </div>
                                                <div class="fondoresultados" >
                                                    <div class="card-body text-info">
                                                    <h3><label id="TIRdeOpti" class="card-text"></label></h3>
                                                    </div>
                                                </div>
                                            </div> 
                                            <div class="preborder" style="margin-top: 15px">
                                                <div class="card-header" >
                                                        <h5> <i class="fas fa-dollar-sign"></i> TMAR Despues de la optimizacion</h5>
                                                </div>
                                                <div class="fondoresultados" >
                                                    <div class="card-body text-info">
                                                    <h3><label id="TMAROptimizada" class="card-text"></label></h3>
                                                    </div>
                                                </div>
                                            </div> 
                                        </div>                                    
                                   </div>
                                    <div role="tabpanel" class="tab-pane fade" id="Descargas">
                                            <div  class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                                                  <div class="preborder">
                                                          <div class="card-header">
                                                              <h5><i class="fas fa-cloud-download-alt"></i>   Descargas</h5>
                                                          </div>
                                                          <div class="fondoresultados" style="text-align:center;">
                                                              <div class="col-md-4" >
                                                                   <div class="row" >
                                                                           <h6> PDF</h6>
                                                                   </div>
                                                                   <div class="row">
                                                                        <i class="fas fa-file-pdf fa-3x hvr-pulse " ></i>    
                                                                   </div>
                                                              </div>
                                                              <div class="col-md-4">
                                                                  <div class="row" >
                                                                      <h6>Excel</h6>
                                                                  </div>
                                                                  <div class="row" >
                                                                      <i class="fas fa-file-excel fa-3x hvr-pulse" ></i>
                                                                  </div>
                                                              </div>
                                                              <div class="col-md-4">
                                                                  <div class="row">
                                                                     <h6> Word</h6>
                                                                  </div>
                                                                  <div class="row" >                                                                  
                                                                      <i class="fas fa-file-word fa-3x hvr-pulse" ></i>
                                                                  </div>
                                                              </div>
                                                          </div>
                                                   </div>
                                            </div>
                                   </div>
                             </div>
                        <div class="card-footer small text-muted"> Actualizado el  <%: DateTime.Today %></div>   
                </div>
        </div>
    </div>
<!-- The Modal --> 
    <div class="modal fade" id="myModal" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal" >
        <div class="modal-dialog">
            <div class="modal-content">      
                <!-- Modal Header -->
                <div class="modal-header">
                        <h4 class="modal-title bounce animated" id="modalheader" > <i class="fa fa-check-square-o"></i> Diagnóstico de Inversión</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>        
                <!-- Modal body -->
                <div class="modal-body" id="modal-text-body" >    
                    <div class="row">
                            <div class="col-3" id="imgmodal"></div>
                            <div class="col-9" id="texmodal"></div>                                                                        
                    </div>
                    <audio id="audio" style="display:none" controls> </audio > 
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" id="cerrar" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div> 
<!-- The Modal -->
<div class="modal fade" id="Cargando_Modal" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal">
    <div id="Cargando_Modal_Dialog" class="modal-dialog">
        <div class="modal-content2">                    
                <centerior>
                    <svg>
                        <g>
                            <path d="M 50,100 A 1,1 0 0 1 50,0"/>
                        </g>
                        <g>
                            <path d="M 50,75 A 1,1 0 0 0 50,-25"/>
                        </g>
                        <defs>
                             <linearGradient id="gradient" x1="0%" y1="0%" x2="0%" y2="100%">
                                <stop offset="0%" style="stop-color:#FF56A1;stop-opacity:1" />
                                <stop offset="100%" style="stop-color:#FF9350;stop-opacity:1" />
                             </linearGradient>
                        </defs>
                    </svg>
                </centerior>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
<!-- plugin editable-->
    <script src="../Scripts/editable-table/mindmup-editabletable.js"></script> 
<!-- plugin editable-->
<!-- Manejo de funcion de tabla-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>  
    <script type="text/javascript" src="../Scripts/editable-table/jquery.tabletojson.min.js"></script>
<!-- Manejo de funcion de tabla-->   
<!-- plugin rangeslide-->
    <script type="text/javascript" src="../Scripts/rangeslider/rangeslider.min.js"></script>
<!-- plugin rangeslide-->
<!-- plugin selectpicker-->
    <script src="../Scripts/bootstrap-select.min.js"></script>
<!-- plugin selectpicker-->
 <!-- Libreria de graficas-->
        <script src="../Scripts/Chart.js"></script>
 <!-- Libreria de graficas-->
<!-- Para validacion de campos-->   
    <script src="../Scripts/Simulador/vanm.js"></script>  
<!-- Para validacion de campos-->
 </asp:Content>