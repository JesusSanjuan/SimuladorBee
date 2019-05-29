<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">   
 
    
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
 <div style="margin-top: 20px;">
            <h2><%: Title %></h2>

            <div class="row">
                <div class="col-md-8">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <h4>Utilice su cuenta para iniciar sesión.</h4>
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <div class="input-group" style="cursor:default">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <input type="text"   class="form-control number2" id="NombreUsuario" placeholder="Ingrese el Flujo Neto de Efectivo" autocomplete="off" style="cursor:pointer" required="required">
                                    <div id="Nombval" class="invalid-feedback">
                                        Por favor ingrese su Usuario.
                                    </div>
                                    <div class="valid-feedback">                       
                                    </div>
                                </div>  
                                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-6 control-label">Nombre de usuario</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group" style="cursor:default">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">$</span>
                                    </div>
                                    <input type="Password"   class="form-control number2" id="Contrasena" placeholder="Ingrese el Flujo Neto de Efectivo" autocomplete="off" style="cursor:pointer" required="required">
                                    <div id="ContrVal" class="invalid-feedback">
                                        Por favor ingrese su contraseña.
                                    </div>
                                    <div class="valid-feedback">                       
                                    </div>
                                </div>


                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-6 control-label">Contraseña</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <div class="checkbox">
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <asp:Label runat="server" AssociatedControlID="RememberMe">¿Recordar cuenta?</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Iniciar sesión" CssClass="btn btn-primary btn-lg" />
                                </div>
                            </div>
                        </div>
                        <p>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Registrarse</asp:HyperLink>
                            si no tiene una cuenta.
                        </p>
                    </section>
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
    
</asp:Content>

