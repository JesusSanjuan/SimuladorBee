<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="tasainflacion.aspx.cs" Inherits="Simulador_tasainflacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Inflación</li>
        </ol>
    </nav> 
    <div class="alert alert-warning alert-dismissible fade show" id="warning" role="alert">
        <strong>¡Copie los resultados de la calculadora!</strong> 
    </div> 
    <div class="form-row" >
        <div class="col-sm">
            <label class="sr-only" for="inlineFormInputGroup">Username</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">%</div>
                </div>
                <input type="text" class="form-control" id="inflacion" placeholder="Inflación">
            </div>
        </div>
        <div class="col-sm">
            <label class="sr-only" for="inlineFormInputGroup">Username</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text">%</div>
                </div>
                <input type="text" class="form-control" id="TPMI" placeholder="Tasa Promedio Mensual">
            </div>
        </div>
    </div>
    <div class="embed-responsive embed-responsive-21by9">
      <iframe class="embed-responsive-item" src="http://www.inegi.org.mx/sistemas/indiceprecios/CalculadoraInflacion.aspx"></iframe>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
   <script>
       
       $(document).ready(function () {  

           console.log("inflacion--"+ $("#inflacionValor").text());
         
           $("body").on("click", "#wuc_Calculadora1_BtnCalcular", function () {

               console.log("inflacion--"+ $("#inflacionValor").html());
            });

        
       });


    </script>
</asp:Content>

