<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewSwitcher.ascx.cs" Inherits="ViewSwitcher" %>
<div id="viewSwitcher">
    <%: CurrentView %> Ver| <a href="<%: SwitchUrl %>" data-ajax="false">Ver en <%: AlternateView %></a>
</div>
