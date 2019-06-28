<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="tasainflacion.aspx.cs" Inherits="Simulador_tasainflacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <link href="../Content/bootstrap-select.css" rel="stylesheet" />
    
 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
    <div >
                <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Calculadora de Inflacion</li>
                          </ol>            
                 </nav>                   
    </div>
    <div style="padding-bottom:1rem;">
              <div class="card align-middle" id="Calculadorainflacion" > 
                  <div class="card align-middle" style="border-style: none;">  
                      <div class="card-header">
                            <h1><i class="fas fa-calculator"></i> Calculadora de inflacion</h1>
                           <h6> La calculadora de inflacion le permite conocer cual ha sido la inflacion en el periodo que usted defina. </h6>
                        A continuacion elija la calculadora que desea usar:
         
                      </div>
                </div>
                       <ul class="nav nav-tabs">
        		            <li class="nav-item">
        			            <a href="#R1"  class="nav-link active" role="tab" data-toggle="tab">INEGI</a>
        		            </li>
        		            <li class="nav-item">
        			            <a href="#R2"  class="nav-link" role="tab" data-toggle="tab">MI CALCULADORA</a>
        		            </li>
        	            </ul>

                        <div class="tab-content" id="ResultadosFinales">
                                <div role="tabpanel" class="tab-pane fade show active" id="R1">
                                          <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                                                                        <div class="alert alert-warning alert-dismissible fade show" id="warning" role="alert">
                                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            Ingrese los datos obtenidos por la calculadora en los campos de la parte inferior y despues <strong>¡Copie los resultados de la calculadora!</strong>
                                                                        </div>
                                                                        <div class="form-row"> 
                                                                            <div class="col-md-12 mb-2 preborder" >
                                                                                <div class="form-row"> 
                                                                                        <div class="col-md-3 mb-2">
                                                                                          <label for="validationCustom01">Año</label>
                                                                                                <div class="input-group" style="cursor:default" >  
                                                                                                       <select  id="anio" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" >
                                                                                                       </select>  
                                                                                                       <div class="input-group-append"  >
                                                                                                             <span class="input-group-text"><i class="fa fa-calendar" aria-hidden="true"></i></span>                                                          
                                                                                                        </div>
                                                                                                        <div class="input-group-append">                                                             
                                                                                                             <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ingrese el periodo de acuerdo al calculo que realizo con la calculadora de inflacion del INEGI." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                                                                                        </div>
                                                                                                        <div id="Anio1Val" class="invalid-tooltip">      
                                                                                                            Seleccione el año
                                                                                                        </div>                 
                                                                                                 </div> 
                                                                                        </div> 
                                                                                        <div class="col-md-3 mb-2">
                                                                                          <label for="validationCustom01">Mes</label>
                                                                                                <div class="input-group" style="cursor:default" >  
                                                                                                       <select  id="mes" name="selValue" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" disabled="disabled" >
                                                                                                            <option value="">Seleccione</option>
                                                                                                            <option value="Enero">Enero</option>
                                                                                                            <option value="Febrero">Febrero</option>
                                                                                                            <option value="Marzo">Marzo</option>
                                                                                                            <option value="Abril">Abril</option>
                                                                                                            <option value="Mayo">Mayo</option>
                                                                                                            <option value="Junio">Junio</option>
                                                                                                            <option value="Julio">Julio</option>
                                                                                                            <option value="Agosto">Agosto</option>
                                                                                                            <option value="Septiembre">Septiembre</option>
                                                                                                            <option value="Octubre">Octubre</option>
                                                                                                            <option value="Noviembre">Noviembre</option>
                                                                                                            <option value="Diciembre">Diciembre</option>
                                                                                                       </select>  
                                                                                                       <div class="input-group-append"  >
                                                                                                             <span class="input-group-text"><i class="fa fa-calendar" aria-hidden="true"></i></span>                                                          
                                                                                                        </div>
                                                                                                        <div class="input-group-append">                                                             
                                                                                                             <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ingrese el periodo de acuerdo al calculo que realizo con la calculadora de inflacion del INEGI." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                                                                                        </div>
                                                                                                        <div id="Mes1Val" class="invalid-tooltip">      
                                                                                                            Seleccione el mes
                                                                                                        </div>                 
                                                                                                  </div> 
                                                                                        </div> 
                                                                                        <div class="col-md-3 mb-2">
                                                                                          <label for="validationCustom01">Año 2</label>
                                                                                                <div class="input-group" style="cursor:default" >  
                                                                                                       <select  id="anio2" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" disabled="disabled">
                                                                                                       <option value="">Seleccione</option>
                                                                                                       </select>  
                                                                                                       <div class="input-group-append"  >
                                                                                                             <span class="input-group-text"><i class="fa fa-calendar" aria-hidden="true"></i></span>                                                          
                                                                                                        </div>
                                                                                                        <div class="input-group-append">                                                             
                                                                                                             <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ingrese el periodo de acuerdo al calculo que realizo con la calculadora de inflacion del INEGI." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                                                                                        </div>
                                                                                                        <div id="Anio2Val" class="invalid-tooltip">      
                                                                                                            Seleccione el año
                                                                                                        </div>                 
                                                                                                  </div> 
                                                                                        </div> 
                                                                                        <div class="col-md-3 mb-2">
                                                                                          <label for="validationCustom01">Mes 2</label>
                                                                                                <div class="input-group" style="cursor:default" >  
                                                                                                       <select  id="mes2" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required"  disabled="disabled">
                                                                                                       <option value="">Seleccione</option>
                                                                                                       </select>  
                                                                                                       <div class="input-group-append"  >
                                                                                                             <span class="input-group-text"><i class="fa fa-calendar" aria-hidden="true"></i></span>                                                          
                                                                                                        </div>
                                                                                                        <div class="input-group-append">                                                             
                                                                                                             <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ingrese el periodo de acuerdo al calculo que realizo con la calculadora de inflacion del INEGI." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                                                                                        </div>
                                                                                                        <div id="Mes2Val" class="invalid-tooltip">      
                                                                                                            Seleccione el mes
                                                                                                        </div>                 
                                                                                                  </div> 
                                                                                        </div> 
                                                                                    </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="form-row" >                                                                            
                                                                            <div class="col-md-4 mb-2"> 
                                                                                    <label for="validationCustom01">Proyecto</label>
                                                                                    <div class="input-group">
                                                                                        <select  id="proyectosINEGI" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" multiple>
                                                                                        <option value="">Seleccione</option>
                                                                                        </select>                                             
                                                                                        <div class="input-group-append ">
                                                                                                        <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover"  data-trigger="hover" title="¿Necesitas ayuda?" data-content="Selecciona el proyecto donde desea ingresar la inflacion calculada." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                                                                        </div>                                                       
                                                                                    </div>
                                                                                    <div id="proyectosINEGIval" class="invalid-tooltip">   
                                                                                        Selecciones un proyecto para guardar
                                                                                    </div>
                                                                             </div>
                                                                            <div class="col-md-4 mb-2">
                                                                              <label for="validationCustom04">Inflacion</label>
                                                                                  <div class="input-group" style="cursor:default">                    
                                                                                            <input type="text"   class="form-control number4" id="inflacion" placeholder="Ingrese la Inflación" autocomplete="off" style="cursor:pointer" required="required">
                                                                                           <div class="input-group-prepend">
                                                                                              <span class="input-group-text">%</span>
                                                                                              <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="" ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                                                                           </div>
                                                                                            <div  id="inflacionval"class="invalid-tooltip">
                                                                                              Por favor ingrese la inflacion
                                                                                            </div>
                                                                                  </div> 
                                                                              </div>
                                                                            <div class="col-md-4 mb-2">
                                                                              <label for="validationCustom04">Tasa de Promedio Mensual</label>
                                                                                  <div class="input-group" style="cursor:default">                    
                                                                                            <input type="text"   class="form-control number5" id="TPMI" placeholder="Tasa de Promedio Mensual" autocomplete="off" style="cursor:pointer" required="required">
                                                                                           <div class="input-group-prepend">
                                                                                              <span class="input-group-text">%</span>
                                                                                              <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="" ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                                                                           </div>
                                                                                            <div  id="TPMIval"class="invalid-tooltip">
                                                                                              Por favor ingrese la tasa de promedio mensual
                                                                                            </div>
                                                                                  </div> 
                                                                             </div>                                                                             
                                                                        </div>
                                                                     <div class="form-row" style="margin-top:30px; margin-bottom:30px">  
                                                                        <div class="col-md-4 mb-2">
                                                                        </div>  
                                                                        <div class="col-md-4 mb-2" >
                                                                            <button id="saveINEGI" class="btn btn-primary btn-lg btn-block" type="button">Guardar cambios</button>
                                                                        </div>   
                                                                        <div class="col-md-4 mb-2">
                                                                        </div>   
                                                                    </div> 
                                                                     <div class="row">
                                                                         <div class="alert alert-success" role="alert" id="alertSucces">
                                                                            <strong>Exitoso!</strong> Los datos fueron guardados correctamente.
                                                                         </div>
                                                                         <div class="alert alert-danger" role="alert" id="alertSDanger">
                                                                            <strong>Estructura incorrecta!</strong> Escriba correctamente el periodo.
                                                                         </div>
                                                                     </div>
                                                                
                                                                <div class="embed-responsive embed-responsive-21by9 preborder">
                                                                    <iframe width="560" height="315"style="padding-top:15px;padding-bottom:15px" src="https://www.inegi.org.mx/app/indicesdeprecios/CalculadoraInflacion.aspx" frameborder="0" allowfullscreen></iframe>
                                                                </div>
                                                       
                                        </div>
                                </div>
                                <div role="tabpanel" class="tab-pane fade" id="R2">
                                        <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">  
                                            <div class="preborder">
                                                    <div class="card-header text-info" >
                                                        <center>  <h4> Calculo de inflacion</h4>  </center> 

                                                    </div>
                                                    <div class="card-body " style="padding: 0px 15px !important;">
                                                                              <div class="row" style="padding-top:10px;" >
                                                                                   <div class="col" style="text-align: center;"> <h4>Indice nacional del precio al consumidor </h4></div> 
                                                                               </div>                                                                               
                                                                                <div class="row" style="padding-top:10px;">
                                                                                    <div class="col" style="text-align: center;"> <h5> Inflación en un período determinado</h5> </div>
                                                                               </div>
                                                                                <div class="row"  style="padding-top:10px;">
                                                                                  <div class="col" style="text-align: center;">Seleccione el indice base. </div> 
                                                                               </div>
                                                                               <div style="padding-bottom:15px;  padding-top:10px;">
                                                                                   <div class="row" style="padding-top:10px;">
                                                                                      <div class="col-12" style="text-align: center;"> <h6>Índice base:<h6></div>
                                                                                   </div> 
                                                                                    <div class="row" style="padding-top:10px;">
                                                                                              <div class="col-12" style="text-align: center;">                                                                                                  
                                                                                                  <select  id="select_indice_base" class="selectpicker show-tick"   required="required">  
                                                                                                  </select>                                                                                                  
                                                                                               </div>
                                                                                   </div>                                                                                   
                                                                                </div>
                                                        <div id="pre_datos" style="display: none">
                                                                                <div class="row"  style="padding-top:10px;">
                                                                                    <div class="col" style="text-align: center;">Rango de datos diponibles del indice base seleccionado. </div> 
                                                                               </div>
                                                                                <div>
                                                                                   <div class="row" style="padding-top:10px;">
                                                                                      <div class="col-12" style="text-align: center;"> <h6>Período:<h6></div>
                                                                                   </div> 
                                                                                    <div class="row" style="padding-top:10px;">
                                                                                          <div class="col-12" style="text-align: center;">
                                                                                                 <div class="col-12" style="text-align: center;" id="rango"></div>
                                                                                           </div>
                                                                                   </div>
                                                                               </div>                                                                               
                                                           <div id="pre_datos2" style="display: none">          
                                                                               <div class="row"  style="padding-top:10px;">
                                                                                  <div class="col" style="text-align: center;">Seleccione el período de interés y oprima el botón de calcular. </div> 
                                                                               </div>
                                                                               <div class="row" style="padding-top:10px;">
                                                                                        <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                        <div class="col-8 preborder" style="padding-bottom:10px;" > 
                                                                                                <div class="row" style="text-align: center; " >
                                                                                                    <div  class="col"  style=" border-bottom-style: solid; border-width: 1px;border-color: rgba(0, 0, 0, 0.25); padding-top:10px;padding-bottom:10px;" >
                                                                                                       <strong>DEL</strong>    
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="row" >
                                                                                                        <div  class="col " style="padding-bottom:10px; padding-top:10px;"  >                                                                                                            
                                                                                                             <div class="input-group " style="margin:auto;"> 
                                                                                                                         <div  style="padding-bottom:5px; padding-top:5px;" >  
                                                                                                                            Año: 
                                                                                                                         </div>
                                                                                                                         <select  id="select" class="selectpicker show-tick"  required="required">
                                                                                                                        </select>
                                                                                                             </div>
                                                                                                        </div>
                                                                                                        <div class="col" style="padding-bottom:10px;  padding-top:10px;">
                                                                                                             <div class="input-group"> 
                                                                                                                <div  style="padding-bottom:5px; padding-top:5px;" > 
                                                                                                                     Mes:
                                                                                                                </div>
                                                                                                                <select  id="select1" class="selectpicker show-tick"  required="required" disabled="disabled">
                                                                                                                <option value="">Seleccione</option>
                                                                                                                </select>
                                                                                                             </div>
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>    
                                                                                        <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                   </div>
                                                                                   <div class="row" style="padding-top:10px;"> 
                                                                                       <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                       <div class="col-8 preborder" style="padding-bottom:10px;">
                                                                                           <div class="row " style="text-align: center;">
                                                                                                <div  class="col" style=" border-bottom-style: solid; border-width: 1px;border-color: rgba(0, 0, 0, 0.25); padding-top:10px;padding-bottom:10px;">
                                                                                                    <strong>A</strong> 
                                                                                                </div>
                                                                                            </div>
                                                                                           <div class="row " >
                                                                                                   <div class="col" style="padding-bottom:10px; padding-top:10px;">
                                                                                                             <div class="input-group" > 
                                                                                                                  <div style="padding-bottom:5px; padding-top:5px;" >  
                                                                                                                    Año: 
                                                                                                                 </div>
                                                                                                                 <select  id="select2" class="selectpicker show-tick" required="required" disabled="disabled">
                                                                                                                     <option value="">Seleccione</option>
                                                                                                                </select>
                                                                                                             </div>
                                                                                                   </div>
                                                                                                   <div  class="col" style="padding-bottom:10px;  padding-top:10px;">
                                                                                                          <div class="input-group"> 
                                                                                                                <div  style="padding-bottom:5px; padding-top:5px;" > 
                                                                                                                     Mes:
                                                                                                                </div>
                                                                                                                <select  id="select3" class="selectpicker show-tick"   required="required" disabled="disabled">
                                                                                                                    <option value="">Seleccione</option>
                                                                                                                </select>
                                                                                                          </div>
                                                                                                   </div>
                                                                                            </div>
                                                                                       </div>
                                                                                       <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                   </div>
                                                                
                                                              
                                                                               <div class="row" style="padding-top:20px;padding-bottom:20px;">
                                                                                   <div class="col-2" style="text-align: center;"></div>
                                                                                   <div class="col" style="text-align: center;"> </div>
                                                                                   <div class="col-.8" style="text-align: center;">
                                                                                       <button id="Calculartasainfla" type="button" class="btn btn-primary" style="visibility:hidden;">Calcular</button>
                                                                                   </div>                                                                   
                                                                                   <div class="col" style="text-align: center;"> </div>
                                                                                   <div class="col-2" style="text-align: center;"></div>
                                                                              </div>
                                                        </div>
                                                       
                                                        <div id="Resultados" style="display: none" >
                                                                                         <div class="card-header row preborder text-info " style="padding-top:25px; border-radius: 0px;" >
                                                                                               <div class="col" style="text-align: center;"> <h4>Resultados </h4></div> 
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="col fondoresultados" style="text-align: center;">
                                                                                                <div class="row">
                                                                                                    <div class="col">
                                                                                                            <h5>Inflacion</h5>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="row">
                                                                                                    <div class="col" id="P1">                                                                                                           
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="row">
                                                                                                    <div class="col-3" style="text-align: center;"> </div>
                                                                                                    <div class="col preborderinfla " style="text-align: center;">
                                                                                                           <div class="input-group mb-2">                                                                                                                
                                                                                                                <input type="text" class="form-control" id="inf1" placeholder="Inflacion">
                                                                                                               <div class="input-group-prepend">
                                                                                                                    <div class="input-group-text">%</div>
                                                                                                                </div>
                                                                                                            </div> 
                                                                                                      </div>                                                                   
                                                                                                    <div class="col-3" style="text-align: center;"> </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="row">
                                                                                            <div class="col fondoresultados" style="text-align: center;">
                                                                                                 <div class="row">
                                                                                                    <div class="col">
                                                                                                            <h5>Tasa Promedio Mensual de Inflación</h5>
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="row">
                                                                                                    <div class="col" id="P2">                                                                                                            
                                                                                                    </div>
                                                                                                </div>
                                                                                                 <div class="row">
                                                                                                    <div class="col-3" style="text-align: center;"> </div>
                                                                                                    <div class="col preborderinfla " style="text-align: center;">
                                                                                                          <div class="input-group mb-2" style="text-align: center;">                                                                                                                
                                                                                                              <input type="text" class="form-control" id="TPMI1" placeholder="Tasa Promedio Mensual">
                                                                                                              <div class="input-group-prepend">
                                                                                                                    <div class="input-group-text">%</div>
                                                                                                                </div>
                                                                                                            </div> 
                                                                                                    </div>                                                                   
                                                                                                    <div class="col-3" style="text-align: center;"> </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                       <div class="row">
                                                                                           <div class="col fondoresultados" style="text-align: center;">
                                                                                                 <div class="row">
                                                                                                    <div class="col-3" style="text-align: center;"></div>
                                                                                                    <div class="col" style="text-align: center;">
                                                                                                         <button id="Guardarinflacion" type="button" class="btn btn-primary">Guardar</button>
                                                                                                    </div>                                                
                                                                                                    <div class="col-3" style="text-align: center;"></div>
                                                                                                   </div>
                                                                                               </div>
                                                                                       </div>                                                          
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
    <!-- Logout Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Guardar inflación</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Cancelar">
                            <span aria-hidden="true">×</span>
                        </button>
                </div>
                <div class="modal-body">
                    <h5>Seleccione los proyectos que utilizaran las inflaciones</h5>
                    <div class="row">
                        <div class="col">
                            <select class="selectpicker" id="proyectos"  title="Selecciona los proyectos" multiple>                              
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                     <button type="button" class="btn btn-primary" id="saveI">Guardar cambios</button>
                     <button class="btn btn-secondary" type="button" data-dismiss="modal">Cerrar</button>  
                </div>
            </div>
        </div>
    </div>
    <!-- Logout Modal-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <!-- plugin selectpicker-->
        <script src="../Scripts/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->
    <script src="../Scripts/Simulador/tasainflacion.js"></script>
     <!-- Deslizamiento suave
    <script src="../Scripts/smoothscroll/jquery.smoothscroll.js"></script>
    No funciona como deseo, borrar la libreria si no se usa
    <script>
        $(function () {
            $('a[href*="#"]').smoothscroll({
                duration: 1000,
                easing: 'swing',
                offset: 0,
                hash: true,
                focus: true
            });
        });
</script>-->

</asp:Content>

