<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 20px;">
    <h1><%: Title %></h1>
        <div class="accordion" id="accordionExample">
                        <div class="card">
                             <div class="card-header" id="headingOne">                                 
                                     <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                     <h5 class="mb-0"> <i class="fa fa-desktop"></i> Acerca de este sitio web.</h5>
                                    </button>                                
                              </div>    
                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">           
                                        <p  align="justify">Nuestra herramienta virtual contribuye al fortalecimiento del aprendizaje en la evaluación de proyectos y dirigida a estudiantes universitarios, emprendedores y personas dedicadas al ámbito de los negocios </p>    
                                    </div>
                            </div>
                       </div>
                        <div class="card">
                            <div class="card-header" id="headingTwo">
                                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                       <h5 class="mb-0"> <i class="	fa fa-question"></i> ¿Por qué se llama simulador?</h5>
                                    </button>                                 
                            </div>
                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                    <div class="card-body">  
                                         <p  align="justify">Reciben el nombre de simulador debido a que intenta reproducir la realidad del mercado utilizando los mismos elementos, relaciones, variables y situaciones que se encuentran en el mundo de los negocios, brindando así la oportunidad de desarrollar las habilidades necesarias que exige el área de Administración y Dirección de Empresas.</p>
                                    </div>
                            </div>
                       </div>   
                        <div class="card">
                                 <div class="card-header" id="headingThree">               
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                             <h5 class="mb-0"> <i class="fa fa-address-book-o"></i>  Soporte Tecnico</h5>
                                        </button>
                                </div>
                               <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                     <div class="card-body"> 
                                         <p  align="justify">Envianos tus dudas técnicas del simulador de negocios al correo electrónico @ugto.mx </p>
                                     </div>
                               </div>
                        </div>
                        <div class="card">
                               <div class="card-header" id="headingFourt">                     
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFourt" aria-expanded="false" aria-controls="collapseFourt"">
                                           <h5 class="mb-0"> <i class="fa fa-book"></i>   Comentarios acerca del sitio web.</h5>
                                        </button>
                                </div>
                              <div id="collapseFourt" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body"> 
                                            <p  align="justify">opiniones de los usuarios por medio de ......</p>
                                        </div>
                               </div>
                        </div>
                        <div class="card">
                             <div class="card-header" id="headingFive">                               
                                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                           <h5 class="mb-0"> <i class="fa fa-balance-scale"> </i>   Políticas.</h5>
                                        </button>
                            </div>
                            <div id="collapseFive" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      
                                    <div class="card-body"> 
                                            <p  align="justify">La Política de Privacidad establece los términos en que el Simulador de negocios usa y protege la información que es proporcionada por sus usuarios al momento de utilizar su sitio web.</p>
                                   </div>
                                </div>
                        </div>
            </div>
    </div>
</asp:Content>
