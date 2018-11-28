<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="TMAR.aspx.cs" Inherits="Simulador_TMAR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../Scripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    
 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
    <div >
        <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">  
                    <a href="Index">Inicio</a>
                </li>
                <li class="breadcrumb-item active">Tasa mínima aceptable de retorno (TMAR)</li>
            </ol>            
        </nav>  
    </div>

    <div style="padding-bottom:1rem;">
        <div class="card align-middle" id="CalculadoraTMAR" > 
            <div class="card align-middle" style="border-style: none;">  
                <div class="card-header">
                    <h1><i class="fas fa-calculator"></i> Calculadora de la TMAR</h1>
                    <h6> La TMAR o tasa mínima aceptable de rendimiento, o tasa de interés mínima aceptable, o tasa de rendimiento mínimo aceptable, es la tasa que representa una medida de rentabilidad, la mínima que se le exigirá añ proyecto. </h6>
                </div>
            </div>
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">  
                <div class="preborder">
                    <div class="card-header text-info" >
                        <center>  <h4> Calculo de la TMAR</h4>  </center> 
                    </div>
                    <div class="card-body " style="padding: 0px 15px !important;">
                        <div class="row" style="padding-top:10px;" >
                            <div class="col" style="text-align: center;"> <h4>Indice nacional del precio al consumidor </h4></div> 
                        </div>                                                                               
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticInflacion" class="col-sm-3 col-form-label">Tasa de inflación anual</label>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text"  class="form-control" id="tasaInflacion" >
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticRiesgo" class="col-sm-3 col-form-label">Riesgo de la inversión</label>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text"  class="form-control" id="riesgo" >
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticTMAR" class="col-sm-3 col-form-label">TMAR</label>
                            <div class="col-sm-2">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="TMAR">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">%</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <!-- plugin selectpicker-->
        <script type="text/javascript" src="../Scripts/bootstrap-select/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->
     
    
</asp:Content>

