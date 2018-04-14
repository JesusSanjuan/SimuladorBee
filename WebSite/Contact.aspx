<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Su pagina de contacto.</h3>
    <address>
        Av. Universidad, Col. Yacatitas, Yuriria, Gto.<br />
        <abbr title="Phone">P:</abbr>
        445.458.9040
    </address>

    <address>
        <strong>Soporte:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>
</asp:Content>
