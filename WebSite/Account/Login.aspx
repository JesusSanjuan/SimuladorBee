<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">  
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
 <div style="margin-top: 20px;">
            <div class="form-row">
                <div class="col-md-8">
                        <div class="form-horizontal">
                            <h4>Ingrese sus datos para iniciar sesión.</h4>
                            <hr />
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
                            <br />
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
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <div class="checkbox">
                                        <input type="checkbox" name="RememberMe" value="1"> ¿Recordar cuenta?<br>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">                                    
                                    <button id="login" class="btn btn-primary btn-lg btn-block" type="button">Iniciar sesión</button>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">     
    <script src="../Scripts/Account/Login.js"></script>
</asp:Content>

