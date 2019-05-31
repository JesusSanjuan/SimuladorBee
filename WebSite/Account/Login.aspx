<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"> 
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="margin-top: 20px;">
     <h2><%: Title %></h2>
            <div class="form-row">
                <div class="col-md-8">
                        <div class="">
                            <h4>Ingrese sus datos para iniciar sesión</h4>
                            <hr />
                            <div class="form-row">  
                                <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                        <h5>Nombre de Usuario:</h5>                                 
                                        <div class="input-group" style="cursor:default">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            </div>
                                            <input type="text"   class="form-control validacion" id="NombreUsuario" placeholder="Ingrese su usuario" autocomplete="off" style="cursor:pointer" required="required">
                                            <div id="Nombval" class="invalid-feedback">
                                                Por favor ingrese su Usuario.
                                            </div>
                                            <div class="valid-feedback">                       
                                            </div>
                                        </div>  
                                       </div>
                                </div>  
                                <div class="col-md-4 mb-2">                                
                                </div>   
                                <div class="col-md-4 mb-2">
                                </div>   
                            </div> 
                            <div class="form-row">  
                                <div class="col-md-4 mb-2">
                                    <div class="form-group">
                                        <h5>Contraseña:</h5>                                 
                                        <div class="input-group" style="cursor:default">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-unlock"></i></span>
                                            </div>
                                            <input type="Password"   class="form-control" id="Contrasena" placeholder="Ingrese su contraseña" autocomplete="off" style="cursor:pointer" required="required">
                                            <div id="ContrVal" class="invalid-feedback">
                                                Por favor ingrese su contraseña.
                                            </div>
                                            <div class="valid-feedback">                       
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-md-4 mb-2">
                                </div>   
                                <div class="col-md-4 mb-2">
                                </div>   
                            </div> 
                            <div class="form-row">  
                                <div class="col-md-4 mb-2">
                                    <div class="form-group">
                                        <div class="col-md-offset-2 col-md-10">
                                            <div class="checkbox">
                                                <input type="checkbox" id="Remember" name="RememberMe" value="1"> ¿Recordar cuenta?<br>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-md-4 mb-2">
                                </div>   
                                <div class="col-md-4 mb-2">
                                </div>   
                            </div>  
                            <div class="form-row">  
                                <div class="col-md-4 mb-2">
                                    <div class="form-group">
                                        <div class="">                                    
                                            <button id="login" class="btn btn-primary btn-lg btn-block" type="button" >Iniciar sesión</button>
                                        </div>
                                    </div>
                                </div>  
                                <div class="col-md-4 mb-2">
                                </div>   
                                <div class="col-md-4 mb-2">
                                </div>   
                            </div>                             
                        </div>
                        <p>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse</asp:HyperLink>
                            si no tiene una cuenta.
                        </p>
                </div>

                <div class="col-md-4">
                    <section id="socialLoginForm">
                        <uc:openauthproviders runat="server" id="OpenAuthLogin" />
                    </section>
                </div>
            </div>
   </div>
    <!-- Logout Modal-->
    <div class="modal fade" id="modalLogin" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal" >
    <div class="modal-dialog">
        <div class="modal-content">      
            <!-- Modal Header -->
            <div class="modal-header">
                    <h4 class="modal-title bounce animated" id="modalheader" > <i class="fa fa-check-square-o"></i> Verifica tus credenciales</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>        
            <!-- Modal body -->
            <div class="modal-body" id="modal-text-body" >    
                <div class="row">
                        <div class="col-3" id="imgmodal"><img src="../multimedia/alerta.gif" class="img-fluid tada animated infinite" width="100" height="100" alt="Responsive image"/></div>
                        <div class="col-9" id="texmodal"><strong style='vertical-align: middle;'>Usuario  invalido o contraseña incorrecta.</strong></div>                                                                        
                </div>
                <audio id="audio" style="display:none" controls> </audio > 
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button class="btn btn-primary" type="button" data-dismiss="modal">Aceptar</button>   
            </div>
        </div>
        </div>
    </div> 
    <!-- Logout Modal-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">     
    <script src="../Scripts/Account/Login.js"></script>
</asp:Content>

