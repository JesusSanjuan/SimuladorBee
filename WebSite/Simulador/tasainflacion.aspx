<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="tasainflacion.aspx.cs" Inherits="Simulador_tasainflacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <link href="../Scripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
    <div >
                <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Valor Actual Neto</li>
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
                                                                 <div>
                                                                     <div style="padding-top:15px;padding-bottom:15px; font: cursive;">
                                                                                Ingreso los datos obtenidos por la calculadora en los campos de la parte inferior.
                                                                     </div>

                                                                        <div class="alert alert-warning alert-dismissible fade show" id="warning" role="alert">
                                                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <strong>¡Copie los resultados de la calculadora!</strong>
                                                                        </div>

                                                                                <div class="form-row" >
                                                                                    <div class="col-sm">
                                                                                        <label class="sr-only" for="inlineFormInputGroup">Username</label>
                                                                                        <div class="input-group mb-2">                                                                                            
                                                                                            <input type="text" class="form-control" id="inflacion" placeholder="Inflación">
                                                                                            <div class="input-group-prepend">
                                                                                                <div class="input-group-text">%</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm">
                                                                                        <label class="sr-only" for="inlineFormInputGroup">Username</label>
                                                                                        <div class="input-group mb-2">                                                                                           
                                                                                            <input type="text" class="form-control" id="TPMI" placeholder="Tasa Promedio Mensual">
                                                                                             <div class="input-group-prepend">
                                                                                                <div class="input-group-text">%</div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                </div>
                                                                <div class="embed-responsive embed-responsive-21by9">
                                                                    <iframe width="560" height="315"style="padding-top:15px;padding-bottom:15px" src="http://www.inegi.org.mx/sistemas/indiceprecios/CalculadoraInflacion.aspx" frameborder="0" allowfullscreen></iframe>
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
                                                                                     <div class="col" style="text-align: center;"><h5> Indice General </h5></div> 
                                                                               </div>
                                                                               <div class="row" style="padding-top:10px;">
                                                                                  <div class="col-6" style="text-align: center;"><h6>Período: Enero 1969 - Julio 2018<h6></div>
                                                                                  <div class="col-6" style="text-align: center;"> <h6>Índice base segunda quincena de diciembre 2010 = 100 <h6></div>
                                                                               </div>  
                                                                               <div class="row" style="padding-top:10px;">
                                                                                    <div class="col" style="text-align: center;"> <h5> Inflación en un período determinado</h5> </div>
                                                                               </div>
                                                                               <div class="row"  style="padding-top:10px;">
                                                                                  <div class="col" style="text-align: center;">Seleccione el período de interés y oprima el botón de calcular. </div> 
                                                                               </div>

                                                                               <div class="row" style="padding-top:10px;">
                                                                                        <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                        <div class="col-8 preborder" style="padding-bottom:10px;" > 
                                                                                                <div class="row" style="text-align: center; " >
                                                                                                    <div  class="col"  style=" border-bottom-style: solid; border-width: 1px;border-color: rgba(0, 0, 0, 0.25); padding-top:10px;padding-bottom:10px;" >
                                                                                                       <strong>DE</strong>    
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="row" style="text-align: center;  ">
                                                                                                        <div  class="col" style="padding-bottom:10px; padding-top:10px;" >                                                                                                            
                                                                                                             <div class="input-group"> 
                                                                                                                 <div  style="padding-bottom:5px; padding-top:5px;" >  
                                                                                                                    Mes: 
                                                                                                                 </div>
                                                                                                                 <select  id="select" class="selectpicker show-tick" runat="server"  required="required">
                                                                                                                                <option value="" class="dropdown-item"  selected>Seleccione</option>
                                                                                                                                <option value="1" class="dropdown-item" >Mes</option>
                                                                                                                                <option value="2" class="dropdown-item" >Año</option>
                                                                                                                </select>
                                                                                                             </div>
                                                                                                        </div>
                                                                                                        <div class="col" style="padding-bottom:10px;  padding-top:10px;">
                                                                                                             <div class="input-group"> 
                                                                                                                <div  style="padding-bottom:5px; padding-top:5px;" > 
                                                                                                                     Año:
                                                                                                                </div>
                                                                                                                <select  id="select1" class="selectpicker show-tick" runat="server"  required="required">
                                                                                                                            <option value="" class="dropdown-item" selected>Seleccione</option>
                                                                                                                            <option value="1" class="dropdown-item">Mes</option>
                                                                                                                            <option value="2" class="dropdown-item">Año</option>
                                                                                                                </select>
                                                                                                             </div>
                                                                                                        </div>
                                                                                                </div>
                                                                                        </div>    
                                                                                        <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                   </div>
                                                                                   <div class="row" style="padding-top:10px;padding-bottom:25px;"> 
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
                                                                                                                    Mes: 
                                                                                                                 </div>
                                                                                                                 <select  id="select2" class="selectpicker show-tick" runat="server"  required="required">
                                                                                                                                <option value="" class="dropdown-item"  selected>Seleccione</option>
                                                                                                                                <option value="1" class="dropdown-item" >Mes</option>
                                                                                                                                <option value="2" class="dropdown-item" >Año</option>
                                                                                                                </select>
                                                                                                             </div>
                                                                                                   </div>
                                                                                                   <div  class="col" style="padding-bottom:10px;  padding-top:10px;">
                                                                                                          <div class="input-group"> 
                                                                                                                <div  style="padding-bottom:5px; padding-top:5px;" > 
                                                                                                                     Año:
                                                                                                                </div>
                                                                                                                <select  id="select3" class="selectpicker show-tick" runat="server"  required="required">
                                                                                                                            <option value="" class="dropdown-item" selected>Seleccione</option>
                                                                                                                            <option value="1" class="dropdown-item">Mes</option>
                                                                                                                            <option value="2" class="dropdown-item">Año</option>
                                                                                                                </select>
                                                                                                          </div>
                                                                                                   </div>
                                                                                            </div>
                                                                                       </div>
                                                                                       <div class="col-2" style="padding-bottom:10px;"></div>
                                                                                   </div>
                                                                
                                                              
                                                                               <div class="row" style="padding-top:10px;padding-bottom:10px;">
                                                                                   <div class="col-2" style="text-align: center;"></div>
                                                                                   <div class="col" style="text-align: center;"> </div>
                                                                                   <div class="col-.8" style="text-align: center;">
                                                                                        <asp:Button id="Calculartasainfla" 	CssClass="btn btn-primary"  onclick="Btn_ClickInflacion" autopostback="false" Text="Calcular"  runat="server"/>
                                                                                   </div>                                                                   
                                                                                   <div class="col" style="text-align: center;"> </div>
                                                                                   <div class="col-2" style="text-align: center;"></div>
                                                                              </div>
                                                                                <div id="Resultados"  runat="server">
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
                                                                                                    <div class="col">
                                                                                                            <h6>Periodo:&nbsp;<strong>Diciembre 2017 a Julio 2018 </strong> </h6>
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
                                                                                                    <div class="col">
                                                                                                            <h6>Periodo:&nbsp;<strong>Diciembre 2017 a Julio 2018 </strong> </h6>
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
                                                                                                        <asp:Button id="Guardarinflacion" 	CssClass="btn btn-primary" Text="Guardar"  runat="server"/>
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
                    <div class="card-footer small text-muted"> Actualizado el  <%: DateTime.Today %></div>   
            </div>
    </div>
































   
    

     

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
   <script>
       
       $(document).ready(function () {  

           console.log("inflacion--"+ $("#inflacionValor").text());
         
           $("body").on("click", "#wuc_Calculadora1_BtnCalcular", function () {

               console.log("inflacion--"+ $("#inflacionValor").html());
            });

        
       });


    </script>
     <!-- plugin selectpicker-->
        <script type="text/javascript" src="../Scripts/bootstrap-select/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->
</asp:Content>

