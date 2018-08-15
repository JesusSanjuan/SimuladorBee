<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="vanv.aspx.cs" Inherits="Simulador_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server"> 
    <!-- Manejo del Select-->
        <link href="../Scripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <!-- Manejo del Select-->
    <!-- Estilo de tabla-->
        <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
    <!-- Estilo de tabla-->         

        <script src="../Scripts/jquery-3.3.1.js"></script>  
    <!-- plugin editable-->
        <script src="../Scripts/editable-table/mindmup-editabletable.js"></script>
        <script src="../Scripts/editable-table/numeric-input-example.js"></script>        
    <!-- plugin dataTable-->
      <script src="../Scripts/startbootstrap/js/datatables-vanv.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div >
                <nav aria-label="breadcrumb" style="padding-bottom:1rem;">
                          <ol class="breadcrumb">
                            <li class="breadcrumb-item">  
                                <a href="Index.aspx">Inicio</a>
                            </li>
                            <li class="breadcrumb-item active">Valor Actual Neto</li>
                          </ol>            
                 </nav>  
                 <div class="card align-middle">  
                      <div class="card-header">
                            <h1><i class="fas fa-chart-line"></i> Valor Actual Neto (VAN)</h1>
                             Es el valor monetario que resulta de restar la suma de los ﬂujos descontados a la inversión inicial.
         
                      </div>
                </div>
    </div>
    <div style="padding-top:1rem;">
                 <div class="row">
                        <div class="col-12" style="padding-bottom:1rem;">  A continuación, usted podrá calcular el Valor Actual Neto (VAN)</div>
                </div>  
                            <div class="form-row">     
                                        <div class="col-md-4 mb-2">
                                          <label for="validationCustom05">Plazo (n)</label>
                                                  <div class="input-group"> 
                                                        <asp:TextBox id="n"  CssClass="form-control number5" placeholder="Ingrese el plazo del proyecto"  runat="server" autocomplete="off" ClientIDMode="Static"  required="required"/>   
                                                        <div class="input-group-append ">
                                                                     <asp:DropDownList id="select" class="select selectpicker show-tick"  runat="server" ClientIDMode="Static" style="width: 20%;" required="required">
                                                                          <asp:ListItem Value=""> Seleccione </asp:ListItem>
                                                                          <asp:ListItem Value="1">Mes</asp:ListItem>
                                                                          <asp:ListItem Value="2">Año</asp:ListItem>
                                                                     </asp:DropDownList>
                                                                       <span class="input-group-text btn btn-lg" role="button" tabindex="0" style="float:!important" data-toggle="popover"  data-trigger="focus" title="¿Necesitas ayuda?" data-content="Aqui hay un contenido increible ;)" ><i class="fa fa-question-circle" style="color:#007bff;"></i></span>                                                            
                                                                        <div class="invalid-feedback">
                                                                          Seleccione
                                                                        </div>
                                                                        <div class="valid-feedback">
                                                                        </div>
                                                          </div> 
                                                            <div class="invalid-feedback">
                                                                  Por favor ingrese y seleccione el plazo
                                                            </div>
                                                            <div class="valid-feedback">
                                                            </div>
                                                  </div>
                                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="n" ValidationExpression="^(\d|-)?(\d|,)*" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                                        </div>                
                          </div>
                          <div class="form-row">  
                                <div class="col-md-5 mb-3">
                                        <div class="form-check">
                                              <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                                              <label class="form-check-label" for="invalidCheck">
                                                    Acepta los términos y condiciones
                                              </label>
                                              <div class="invalid-feedback">
                                                 Debe aceptar los terminos antes de calcular
                                              </div>
                                        </div>       
                                </div>
                        </div>    
                        <div class="form-row">  
                            <div class="col-md-3 mb-2">
                                    <asp:Button id="Button1" onclick=" Btn_ClickVANC" CssClass="btn btn-primary" Text="Calcular"  runat="server"/>
                            </div>   
                        </div>
    </div>
    <div  id="CapturaVAN" style="padding-bottom:1rem; display:none" >
        




<div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         <h4> <i class="fas fa-chart-pie"></i> Captura de informacion para el cálculo del Valor Actual Neto (VAN)</h4>
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
        <div class="table-responsive" style="margin-top: 0px; padding-bottom:0px;" >
                                                                <Table class="table table-striped table-bordered" style="width:100%;"  id="dataTableVANC"  >
                                                                        <thead>
                                                                            <tr>
                                                                                <th></th>
                                                                                <th>Año/Mes</th>
                                                                                <th>Costos</th>                                                                                            
                                                                                <th>Ingresos</th>
                                                                                <th>Flujo Neto de Efectivo</th>
                                                                                <th>Ingreso Actualizado</th>
                                                                                <th>Periodo de Recuperación</th>
                                                                            </tr>
                                                                        </thead>                                                                
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th></th>
                                                                                <th>Año/Mes</th>
                                                                                <th>Costos</th>                                                                                            
                                                                                <th>Ingresos</th>
                                                                                <th>Flujo Neto de Efectivo</th>
                                                                                <th>Ingreso Actualizado</th>
                                                                                <th>Periodo de Recuperación</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </Table>
            </div>

          <div class="form-row">  
                            <div class="col-md-3 mb-2" style="padding-bottom:1rem; padding-top:1rem;">
                                    <asp:Button id="Button3"  CssClass="btn btn-primary" Text="Calcular"  runat="server"/>
                            </div>   
        </div>

      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h4> <i class="fas fa-chart-pie"></i> Resultados del cálculo del Valor Actual Neto (VAN)</h4>
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      
      
      
      </div>
    </div>
  </div>  
</div>                
             
     </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Foder" Runat="Server">
  
    <!-- Manejo de funcion de tabla en VANC-->
        <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
        <script src="../Scripts/DataTables/js/dataTables.keyTable.min.js"></script>
        <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>    
         <script type="text/javascript" src="../Scripts/editable-table/jquery.tabletojson.min.js"></script>
    <!--   Manejo de funcion de tabla en VANC-->
    <!-- Para validacion de campos-->    
        <script src="../Scripts/startbootstrap/js/validaciones-vanv.js"></script>        
    <!-- Para validacion de campos-->
    <!-- plugin selectpicker-->
        <script type="text/javascript" src="../Scripts/bootstrap-select/bootstrap-select.min.js"></script>
    <!-- plugin selectpicker-->

    
</asp:Content>

