<%@ Page  Title="" Async="true" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="vanM.aspx.cs" Inherits="User_vanM" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
         <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
         <link href="../Content/bootstrap-select.css" rel="stylesheet" />
         <link href="../Content/Precarga/load-van.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server"  >    
    
     <div >
                <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Valor Actual Neto</li>
                          </ol>            
                 </nav>  
                 <div class="card align-middle">  
                      <div class="card-header">
                            <h1><i class="fas fa-chart-line"></i> Calculadora de VAN y TIR</h1>
                             El uso de estos criterios de evaluacion financiera le permitira saber si se acepta o rechazo un proyecto de inversión.         
                      </div>
                </div>
    </div>
    <div style="padding-top:1rem;">
        <div class="row">
                <div class="col-12" style="padding-bottom:1rem;">  A continuación, usted podrá calcular el Valor Actual Neto (VAN)</div>
        </div>                        
        <div class="form-row" >
            <div class="col-md-4 mb-2">
                <label for="validationCustom01">Inversión</label>
                    <div class="input-group" style="cursor:default" >
                            <div class="input-group-append"  >
                                    <span class="input-group-text" id="inputGroupPrepend0">$</span>
                                    <span class="input-group-text">0.00</span>                                                            
                            </div>
                                <input type="text"   class="form-control number" id="Inversion" placeholder="Ingrese la inversion"  autocomplete="off"  style="cursor:pointer" required="required">
                            <div class="input-group-append">                                                             
                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="Es aquel gasto monetario realizado para la compra de los activos fijos y diferidos necesarios para comenzar el proyecto, pero que no incluyen el capital de trabajo." ><i class="fa fa-question-circle" style="color:#007bff"></i></span>                                                            
                            </div>
                            <div id="Inversionval" class="invalid-tooltip"> 
                                Por favor ingrese la inversion.
                            </div>                 
                        </div> 
            </div>
            <div class="col-md-4 mb-2">
            <label for="validationCustom04">Rentabilidad requerida</label>
                <div class="input-group" style="cursor:default">                    
                        <input type="text"   class="form-control number4" id="TMAR" placeholder="Ingrese el valor de TMAR" autocomplete="off" style="cursor:pointer" required="required">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroupPrepend3">%</span>
                            <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content=" TMAR (Tasa Mínima Aceptable de Rendimiento): es la tasa de ganancia anual que solicita ganar el inversionista para llevar a cabo la instalación y operación de la empresa." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                        </div>
                        <div  id="TMARval"class="invalid-tooltip">
                            Por favor ingrese el valor de TMAR
                        </div>
                </div> 
            </div>  
            <div class="col-md-4 mb-2">
                <label for="validationCustom03">Valor de Salvamento</label>
                <div class="input-group" style="cursor:default">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend2">$</span>
                                    <span class="input-group-text">0.00</span>
                            </div>
                                <input type="text"   class="form-control number3" id="VdS" placeholder="Ingrese el valor de salvamento" autocomplete="off" style="cursor:pointer" required="required">
                            <div class="input-group-append"  >                                                             
                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover" data-trigger="hover" title="¿Necesitas ayuda?" data-content="El valor de rescate o salvamento se calcula restando la depreciación acumulada hasta ese periodo al valor de adquisición." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                            </div> 
                            <div id="VdSval"class="invalid-tooltip">
                                Por favor ingrese el valor de salvamento
                            </div>
                        </div>
            </div>
        </div>
        <div class="form-row">     
                        <div class="col-md-8 mb-2 preborder" >
                            <div class="form-row"> 
                                <div class="col-md-12 mb-2">
                                    <label for="validationCustom05">Plazo (n)</label>    
                                </div>
                            </div>
                            <div class="form-row"> 
                                <div class="col-md-6 mb-2">  
                                    <div class="input-group">
                                        <select  id="select" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" >
                                                                        <option value="" class="dropdown-item" selected>Seleccione</option>
                                                                        <option value="1" class="dropdown-item">Mes</option>
                                                                        <option value="2" class="dropdown-item">Año</option>
                                        </select>                                             
                                        <div class="input-group-append ">
                                                        <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important; cursor:pointer" data-toggle="popover"  data-trigger="hover" title="¿Necesitas ayuda?" data-content="Selecciona el períodos de tiempo que se adecue mas a tu proyecto." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                        </div>                                                       
                                    </div>
                                    <div id="selectval" class="invalid-tooltip">                                                               
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2"> 
                                        <div class="input-group" style="cursor:default">                                                            
                                                <input type="text"   class="form-control" id="n" data-toggle="popover" data-placement="bottom" placeholder="Ingrese el periodo" autocomplete="off" disabled="disabled"  style="cursor:default" required="required">                                                         
                                            <div class="input-group-append" >
                                                    <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important" data-toggle="popover"  data-trigger="hover" title="¿Necesitas ayuda?" data-content="1,2...n: Numero de periodos de vida util del proyecto." ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                            </div>                                                         
                                        </div>
                                        <div id="nval" class="invalid-tooltip">                                                               
                                        </div>
                                </div>
                            </div>
                            </div>     
                            <div class="col-md-6 mb-2">                                              
                            </div>
        </div>
        <div class="form-row">  
            <div class="col-md-4 mb-2">
            </div>  
            <div class="col-md-4 mb-2">
                <button id="continuar" class="btn btn-primary btn-lg btn-block" type="button">Continuar</button>
            </div>   
            <div class="col-md-4 mb-2">
            </div>   
        </div>  
   </div>
    <div style="padding-bottom:1rem;">
              <div class="card align-middle"> 
                    <div class="card-header">
                      <h4><i class="fas fa-pencil-alt"></i> Ingreso de flujos netos</h4>
                    </div>              
              <div class="tab-content">
                        <!--Temporal -->
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>Atencion!!!</strong> Este sitio se <strong>encuentra en construccion</strong>.
                        </div>
                        <!--Temporal -->
                            <div  class="container-fluid card-body">
                                            <div class="preborder">
                                                        <div class="card-header">
                                                        <h5><i class="fa fa-table"></i>  Tabla</h5>
                                                        </div>
                                                        <div class="table-responsive" style="margin-top: 20px; padding-bottom:20px;">
                                                                <Table class="table table-striped table-bordered" style="width:100%;"  id="dataTableVAN"  >
                                                                    <thead>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Año/Mes</th>
                                                                        <th>Cobros</th>                                                                                            
                                                                        <th>Pagos</th>
                                                                        <th>Flujo Neto de Efectivo</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody  id="dataTableVANBody">                                                                                                                                                                           
                                                                    </tbody>
                                                                    <tfoot>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>Año/Mes</th>
                                                                        <th>Cobros</th>                                                                                            
                                                                        <th>Pagos</th>
                                                                        <th>Flujo Neto de Efectivo</th>
                                                                    </tr>
                                                                    </tfoot>                                                                                                     
                                                            </Table>
                                                        </div>
                                            </div>
                            </div>

              </div>
              </div>
    </div>
</asp:Content>

<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">

<!-- Manejo de funcion de tabla en VAN-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>        
<!-- Manejo de funcion de tabla en VAN-->   
<!-- plugin selectpicker-->
    <script src="../Scripts/bootstrap-select.min.js"></script>
<!-- plugin selectpicker-->
<!-- Para validacion de campos-->   
    <script src="../Scripts/Simulador/vanm.js"></script>  
<!-- Para validacion de campos-->
<!-- plugin editable-->
    <script src="../Scripts/editable-table/mindmup-editabletable.js"></script>
    <script src="../Scripts/editable-table/numeric-input-example.js"></script>
<!-- plugin editable-->
 </asp:Content>