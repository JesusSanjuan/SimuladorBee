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
                <div id="messageWarning" class="alert alert-warning d-none" role="alert">
                      This is a warning alert—check it out!
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
                        <br />
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Costos fijos</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control number" placeholder="Ingrese los costos fijos"  autocomplete="off" style="cursor:pointer" id="costosFijos" >
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="costosFijosval" class="invalid-tooltip"> 
                                        Por favor ingrese el costo fijo.
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                    <label>Precio de venta por unidad</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control number2" placeholder="Ingrese el precio de venta por unidad"  autocomplete="off" style="cursor:pointer" id="precioVU" >
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="precioVUval" class="invalid-tooltip"> 
                                        Por favor ingrese el precio de venta por unidad.
                                    </div> 
                                </div>
                            </div>                            
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Costo variable por unidad</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control number3" placeholder="Ingrese el costo variable por unidad"  autocomplete="off" style="cursor:pointer" id="costoVU">
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="costoVUval" class="invalid-tooltip"> 
                                        Por favor ingrese el costo variable por unidad.
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex justify-content-center text-center">
                            <div class="col-md-3 mb-2">
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="col text-center">
                                <div class="input-group justify-content-center">
                                    <button type="button" class="btn btn-primary btn-lg btn-block" id="calc_PEU">Calcular</button>
                                </div>
                            </div>
                            </div>
                            <div class="col-md-3 mb-2">
                            </div>                            
                        </div>  
                        <div class="form-group row d-flex ">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Punto de Equilibrio en Unidades</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i class="fas fa-layer-group"></i></div>
                                    </div>
                                    <input type="text" class="form-control" id="PEU" readonly>
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
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
                        <br />
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Costos Fijos</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group" style="cursor:pointer">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control number4"  placeholder="Ingrese el costo fijo"  autocomplete="off" style="cursor:pointer" id="costosFijos2" >
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="costosFijos2val" class="invalid-tooltip"> 
                                        Por favor ingrese el costo fijo.
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Precio de venta </label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text"  class="form-control number5a"  placeholder="Ingrese el precio de venta"  autocomplete="off" style="cursor:pointer" id="precioV" >
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="precioVval" class="invalid-tooltip"> 
                                        Por favor ingrese el precio de venta.
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Costo de venta</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control number6"  placeholder="Ingrese el costo de venta"  autocomplete="off" style="cursor:pointer" id="costoV">
                                    <div class="input-group-append">                                                             
                                         <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Ayuda." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                                    </div>
                                    <div id="costoVval" class="invalid-tooltip"> 
                                        Por favor ingrese el costo de venta.
                                    </div>
                                </div>                                
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-3 mb-2">
                            </div>
                            <div class="col-md-6 mb-2">
                                    <div class="col text-center">
                                        <div class="input-group justify-content-center">
                                            <button type="button" class="btn btn-primary btn-lg btn-block" id="calc_PEP">Calcular</button>
                                        </div>
                                    </div>
                            </div>
                            <div class="col-md-3 mb-2">
                            </div> 
                        </div>
                        <div class="form-group row d-flex">
                            <div class="col-md-1 mb-2">
                            </div>
                            <div class="col-md-3 mb-2">
                                <label>Punto de equilibrio en pesos</label>
                            </div>
                            <div class="col-md-6 mb-2">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">$</div>
                                    </div>
                                    <input type="text" class="form-control"  id="PEP" readonly>
                                </div>
                            </div>
                            <div class="col-md-1 mb-2">
                            </div>
                        </div>
                    
                        <div class="form-group row d-flex justify-content-center text-center">
                            <div class="col-md-3 mb-2">
                            </div>
                            <div class="col-md-6 mb-2">
                                    <button type="button" class="btn btn-primary invisible" id="savePES">Guardar cambios</button>
                            </div>
                            <div class="col-md-3 mb-2">
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Succes Modal-->
    <div class="modal fade" id="succesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Guardar Punto Equilibrio</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Cancelar">
                            <span aria-hidden="true">×</span>
                        </button>
                </div>
                <div class="modal-body">
                    <h5>Los datos para el proyecto <strong id="project">X</strong> fueron guardados satisfactoriamente</h5>
                </div>
                <div class="modal-footer">
                     <button class="btn btn-secondary" type="button" data-dismiss="modal">Cerrar</button>  
                </div>
            </div>
        </div>
    </div>
    <!-- Succes Modal-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
    <!-- plugin dataTable-->
        <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <!-- plugin selectpicker-->
        <script src="../Scripts/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->
    <!-- SCRIPT DE LOS CONTENIDOS -->
        <script src="../Scripts/Simulador/puntoequilibrio.js"></script>
    <!-- SCRIPT DE LOS CONTENIDOS -->
</asp:Content>


