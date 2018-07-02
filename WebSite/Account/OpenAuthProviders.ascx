<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpenAuthProviders.ascx.cs" Inherits="OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>¿QUÉ ES UN SIMULADOR?</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Inicie sesión con su <%#: Item %> cuenta.">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>Un simulador de negocios es una herramienta de aprendizaje, que pretende la reproducción de un sistema económico, financiero y/o empresarial.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>