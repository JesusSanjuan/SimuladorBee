<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="puntoequilibrio.aspx.cs" Inherits="Simulador_PE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />
    
 
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
    <div >
        <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">  
                    <a href="Index">Inicio</a>
                </li>
                <li class="breadcrumb-item active">Calculadora del Punto de Equilibrio</li>
            </ol>            
        </nav>  
    </div>

    <div style="padding-bottom:1rem;">
        <div class="card align-middle" id="CalculadoraPE" > 
            <div class="card align-middle" style="border-style: none;">  
                <div class="card-header">
                    <h1><i class="fas fa-calculator"></i> Punto Equilibrio</h1>
                    <h6>Nos permite determinar el nivel de ventas necesario para cubrir los costes totales o, en otras palabras, el nivel de ingresos que cubre los costes fijos y los costes variables </h6>
                </div>
            </div>
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">  
                <div id="message" class="alert d-none" role="alert">
                </div>
                <div class="preborder">
                    <div class="card-header text-info" >
                        <center>  <h4> Cálculo del Punto de Equilibrio</h4>  </center> 
                    </div>
                    <div class="card-body " style="padding: 0px 15px !important;">
                        <div class="row" style="padding-top:10px;" >
                            <div class="col" style="text-align: center;"> <h4>Punto de Equilibrio en Unidades </h4></div> 
                        </div> 
                        <div class="row" style="padding-top:10px;" >
                            <div class="col" style="text-align: center;"> <h5>P.E. en Unidades = Costos Fijos totales /(Precio de venta por unidad - Costo variable por unidad) </h5></div> 
                        </div> 
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticCF" class="col-sm-3 col-form-label">Costos Fijos</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control" id="costosFijos" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticPrecioVU" class="col-sm-3 col-form-label">Precio de venta por unidad</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control" id="precioVU" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticcostoVU" class="col-sm-3 col-form-label">Costo variable por Unidad</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control" id="costoVU">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="static" class="col-sm-3 col-form-label">Punto de Equilibrio en Unidades</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control" id="PEU">
                                </div>
                            </div>
                        </div>
                    
                        <br />
                        <br />

                        <div class="row" style="padding-top:10px;" >
                            <div class="col" style="text-align: center;"> <h4>Punto de Equilibrio en Dinero </h4></div> 
                        </div> 
                        <div class="row" style="padding-top:10px;" >
                            <div class="col" style="text-align: center;"> <h5>P.E. en Pesos = Costos Fijos totales /(Precio de venta - Costo de venta) </h5></div> 
                        </div> 
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticCF" class="col-sm-3 col-form-label">Costos Fijos</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control" id="costosFijos2" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticPrecioVU" class="col-sm-3 col-form-label">Precio de venta </label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control" id="precioV" >
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="staticcostoVU" class="col-sm-3 col-form-label">Costo de venta</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control" id="costoV">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <label for="static" class="col-sm-3 col-form-label">Punto de Equilibrio en Pesos</label>
                            <div class="col-sm-3">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control" id="PEP">
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
    <!-- plugin dataTable-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <!-- plugin selectpicker-->
        <script src="../Scripts/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->
    <!-- SCRIPT DE LOS CONTENIDOS -->
     <script src="../Scripts/Simulador/scripts.js"></script>
    <!-- SCRIPT DE LOS CONTENIDOS -->
     
    
</asp:Content>

