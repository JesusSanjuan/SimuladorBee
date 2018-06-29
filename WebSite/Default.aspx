﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <!-- Efectos visuales--> 
    <link rel="stylesheet"  href="../Scripts/anijs-master/anicollection.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/csshake-master/csshake.min.css">
   <!-- Efectos visuales--> 
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin-top: 20px; " data-anijs="if: scroll, on:window, do: bounceInLeft animated, before: scrollReveal, after: removeAnim">
    <div class="jumbotron">
        <h1>Simulador de Negocios</h1>
        <p class="lead">Objetivo: Reproducir el comportamiento de una realidad o proceso que ayuda a conocer la rentabilidad económica de un proyecto de tal manera que asegure tomar una buena decisión en realizar una inversión.</p>
        <p><a href="Simulador/Index.aspx" class="btn btn-primary btn-lg"><i class="fa fa-fw fa-calculator"></i> Simulador</a></p>
    </div>


    <div class="row">
        <div class="col-md-4">
            <h2>¿Qué es un proyecto?</h2>
            <p>
                El proyecto de inversión se puede describir como un plan que, si se le asigna determinado monto de capital y se le proporcionan insumos de varios tipos, podrá producir un bien o un servicio, útil a la sociedad en general.</p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Aprende mas »</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>¿Por qué se invierte y por qué son necesarios los proyectos?</h2>
            <p>
                Una inversión inteligente requiere una base que la justiﬁque. Es precisamente un proyecto bien estructurado y evaluado que indique la pauta que debe seguirse. De ahí se deriva la necesidad de usar un simulador.</p>
           
        </div>
        <div class="col-md-4">
            <h2>Decisión sobre un proyecto</h2>
            <p>
                El hecho de realizar un análisis que se considere lo más completo posible, no implica que, al invertir, el dinero estará exento de riesgo. El futuro siempre es incierto y por esta razón el dinero siempre se arriesgará.</p>
         
            
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
            <!-- Efectos visuales--> 
                <!-- Archivo principal de AniJS --> 
                <script  src="../Scripts/anijs-master/anijs.js" > </script>
                <!-- ScrollReveal Helper -->
                <script  src="../Scripts/anijs-master/helpers/scrollreveal/anijs-helper-scrollreveal.js" > </script>
            <!-- Efectos visuales--> 
 </asp:Content>
