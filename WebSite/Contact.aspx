<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 20px;">
            <h2><%: Title %>.</h2>
            <h3>Contáctenos.</h3>
            <hr />
        <div class="card">
            <div class="card-header">
                Direccion
            </div>
            <div class="card-body">
                <address>
                    Av. Universidad, Col. Yacatitas, Yuriria, Gto.<br />
                    <abbr title="Phone">P:</abbr>
                    445.458.9040
                </address>
                <hr />
                <address>
                <strong>Soporte:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
                <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
                </address>
            </div>
             <div class="card-footer text-muted">
                Actualizado el  <%: DateTime.Today %>
             </div>            
         </div>
    </div>
</asp:Content>
