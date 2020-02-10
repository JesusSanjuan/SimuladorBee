<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 20px;">
    <h1><%: Title %></h1>
                        <div class="card">
                             <div class="card-header" id="headingOne" >  
                                 <h5 class="mb-0" style="cursor: pointer;" data-anijs=" if: mouseover, do: pulse animated">
                                      <i class="fa fa-desktop"></i><a data-toggle="collapse" data-parent="#accordion" href="#c1" style="color:black;text-decoration:none;">&nbsp;&nbsp;&nbsp;Acerca de este sitio web</a>  
                                 </h5>                                
                              </div>    
                            <div id="c1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">           
                                        <p  align="justify">Nuestra herramienta virtual contribuye al fortalecimiento del aprendizaje en la evaluación de proyectos y dirigida a estudiantes universitarios, emprendedores y personas dedicadas al ámbito de los negocios </p>    
                                    </div>
                            </div>
                       </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                 <h5 class="mb-0" style="cursor: pointer" data-anijs=" if: mouseover, do: pulse animated"> 
                                    <i class="fa fa-question"></i> <a data-toggle="collapse" data-parent="#accordion" href="#c2"  style="color:black;text-decoration:none;">&nbsp;&nbsp;&nbsp;¿Por qué se llama simulador?</a>                                          
                                 </h5>                                
                            </div>
                            <div id="c2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">  
                                         <p  align="justify">Reciben el nombre de simulador debido a que intenta reproducir la realidad del mercado utilizando los mismos elementos, relaciones, variables y situaciones que se encuentran en el mundo de los negocios, brindando así la oportunidad de desarrollar las habilidades necesarias que exige el área de Administración y Dirección de Empresas.</p>
                                    </div>
                            </div>
                       </div>   
                        <div class="card">
                                 <div class="card-header" id="headingThree">      
                                      <h5 class="mb-0" style="cursor: pointer" data-anijs=" if: mouseover, do: pulse animated">
                                        <i class="far fa-address-book"></i>   <a data-toggle="collapse" data-parent="#accordion" href="#c3"  style="color:black;text-decoration:none;">&nbsp;&nbsp;&nbsp;Soporte Tecnico</a>  
                                      </h5>
                                </div>
                               <div id="c3" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                     <div class="card-body"> 
                                         <p  align="justify">Envianos tus dudas técnicas del simulador de negocios al correo electrónico @ugto.mx </p>
                                     </div>
                               </div>
                        </div>
                        <div class="card">
                               <div class="card-header" id="headingFourt">  
                                   <h5 class="mb-0" style="cursor: pointer" data-anijs=" if: mouseover, do: pulse animated">
                                            <i class="fa fa-book"></i>   <a data-toggle="collapse" data-parent="#accordion" href="#c4"  style="color:black;text-decoration:none;">&nbsp;&nbsp;&nbsp;Comentarios acerca del sitio web</a>  
                                   </h5>
                                </div>
                              <div id="c4" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body"> 
                                            <p  align="justify">opiniones de los usuarios por medio de ......</p>
                                        </div>
                               </div>
                        </div>
                        <div class="card">
                             <div class="card-header" id="headingFive">     
                                    <h5 class="mb-0" style="cursor: pointer" data-anijs=" if: mouseover, do: pulse animated">
                                        <i class="fa fa-balance-scale"> </i><a data-toggle="collapse" data-parent="#accordion" href="#c5"  style="color:black;text-decoration:none;">&nbsp;&nbsp;&nbsp;Políticas</a> 
                                     </h5>
                            </div>
                            <div id="c5" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      
                                    <div class="card-body"> 
                                            <p  align="justify">La Política de Privacidad establece los términos en que el Simulador de negocios usa y protege la información que es proporcionada por sus usuarios al momento de utilizar su sitio web.</p>
                                   </div>
                                </div>
                        </div>
            </div>
</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">  
    <script src="Scripts/Account/Enlaces.js"></script>
 </asp:Content>
