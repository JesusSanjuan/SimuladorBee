<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">      
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">       
       
                <div style="margin-top: 20px; " data-anijs="if: load, on:window, do: fadeInLeft animated, before: scrollReveal, after: removeAnim">
                    <div class="jumbotron">
                        <h1>Simulador de Negocios</h1>
                        <p class="lead">Objetivo: Reproducir el comportamiento de una realidad que ayuda a conocer la rentabilidad económica de un proyecto.</p>
                        <p><a href="Simulador/Index" class="btn btn-primary btn-lg pulse animated infinite"><i class="fa fa-fw fa-calculator"></i> Simulador</a></p>
                    </div>


                    <div class="row">
                                    <div class="col-md-4">
                                        <h2 align="justify">¿Qué es un proyecto?</h2>
                                        <p align="justify">
                                            Un proyecto es la búsqueda de una solución inteligente al planteamiento de un problema tendente a resolver una necesidad humana.
                                        </p>
                                        <p>
                                            <a class="btn btn-default" data-anijs=" if: mouseover, do: rubberBand animated" href="https://nodo.ugto.mx/course/unidad-de-aprendizaje-administracion-de-negocios">Aprende mas »</a>
                                        </p>
                                    </div>
                                    <div class="col-md-4">
                                        <h2 align="left">¿Por qué es vital una herramienta de evaluación financiera?</h2>
                                        <p align="justify">
                                            Permite numéricamente y con precisión determinar qué tan rentable es un proyecto en relación con un parámetro ya conocido o de referencia.
                                        </p>
                                        <p>
                                            <a class="btn btn-default" data-anijs=" if: mouseover, do: rubberBand animated" href="http://localhost:52712/About">Aprende mas »</a>
                                        </p>
                                    </div>
                                    <div class="col-md-4">
                                        <h2>Decisión sobre un proyecto</h2>
                                        <p align="justify">
                                            Todo proyecto de inversión comienza como una idea sencilla.
                                        </p> 
                                        <p>
                                            <a class="btn btn-default" data-anijs=" if: mouseover, do: rubberBand animated" href="http://www.fondos.guanajuato.gob.mx/fondosgto/">Aprende mas »</a>
                                        </p>
                                    </div>
                    </div>
                </div>
</asp:Content>

<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">      
 </asp:Content>
