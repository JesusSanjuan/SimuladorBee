<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 20px;">
            <h1><%: Title %>.</h1>
            <h3>Contáctenos.</h3>
            <hr />
        <div class="card">
            <div class="card-header">
                <h5> Direccion </h5>
            </div>
            <div class="card-body">
                <address>
                    Av. Universidad, Col. Yacatitas, Yuriria, Gto.<br />
                    <abbr title="Phone">P:</abbr>
                    445.458.9040
                </address>
                <hr />
                <address>
                    <strong>Soporte:</strong>   <a>e.salazarmartinez@ugto.mx</a><br />
                <strong>Soporte:</strong>   <a>j.sanjuanmendez@ugto.mx</a><br />
                <strong>Soporte:</strong>   <a>r.pacheco.sanchez@ugto.mx</a><br />
                    <strong>Soporte:</strong>   <a>a.ortega@ugto.mx</a><br />
                <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                </address>
            </div>
             <div class="card-footer text-muted">
                Actualizado el  <%: DateTime.Today %>
             </div>            
         </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">     
    <script src="Scripts/Account/Enlaces.js"></script>
</asp:Content>
