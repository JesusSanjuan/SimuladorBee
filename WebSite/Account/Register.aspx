<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div style="margin-top: 20px;">
        <h2><%: Title %></h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
            <div class="row">
                        <div class="col-md-8">
                            <h4>Cree una cuenta nueva.</h4>
                            <hr />
                            <asp:ValidationSummary runat="server" CssClass="text-danger" />
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-6 control-label">Nombre de usuario</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                        CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-6 control-label">Contraseña</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                        CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-6 control-label">Confirmar contraseña</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="El campo de confirmación de contraseña es obligatorio." />
                                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="La contraseña y la contraseña de confirmación no coinciden." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrarse" CssClass="btn btn-primary btn-lg" />
                                </div>
                            </div>
                        </div>
                     <div class="col-md-4">
                         <h4>¿Qué estás esperando?</h4>
                            <hr/>
                         <p align="justify">
                            Tu empresa no puede darse el lujo de perder tiempo y dinero en... Asi que...
                         </p>
                         <h5>Ahorra tiempo</h5>
                         <h5>Aumenta la productividad</h5>
                         <h5>Reduce los costos</h5>
                     </div>
                </div>


        </div>
</asp:Content>

