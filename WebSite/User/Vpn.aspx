<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage.master" AutoEventWireup="true" CodeFile="Vpn.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item">  
                    <a href="Index.aspx">Inicio</a>
                </li>
                <li class="breadcrumb-item active">Valor Presente Neto</li>
              </ol>
     </nav>
    

<h1>Calculo de Valor Presente Neto (VPN)</h1>
<p> A continuacion usted podra calcular el valor presente neto (VPN)</p>

  <div class="form-row">
    <div class="col-md-3 mb-4">
      <label for="validationCustom01">Inversion</label>
              <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend0">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                    <asp:TextBox CssClass="form-control" id="Inversion" placeholder="Ingrese la inversion"  runat="server"  ToolTip="Ingrese valor ejemplo" /> <div class="invalid-feedback">
                      Por favor ingrese la inversion.
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>           
    </div>

    <div class="col-md-3 mb-4">
      <label for="validationCustom02">Flujos Netos de Efectivo</label>
             <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend1">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                    <asp:TextBox CssClass="form-control" id="FNE" placeholder="Ingrese los Flujos Netos de Efectivo"  runat="server" />
                    <div class="invalid-feedback">
                      Por favor ingrese el FNE.
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>       
    </div>

    <div class="col-md-3 mb-4">
      <label for="validationCustomUsername">Valor de Salvamento</label>
              <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend2">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                    <asp:TextBox  CssClass="form-control" id="VdS" placeholder="Ingrese el valor de salvamento"  runat="server" />
                    <div class="invalid-feedback">
                      Por favor ingrese el valor de salvamento
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>
    </div>
      <div class="col-md-3 mb-4">
      <label for="validationCustom01">TMAR</label>
              <div class="input-group">                    
                    <asp:TextBox  CssClass="form-control" id="TMAR" placeholder="Ingrese el valor de TMAR"  runat="server" />
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend3">%</span>
                    </div>
                    <div class="invalid-feedback">
                      Por favor ingrese el valor de i.
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>           
    </div>
     

  </div>
  <div class="form-row"> 
     <div class="col-md-3 mb-4">
      <label for="validationCustom02">Plazo (n)</label>
             <div class="input-group">
                    <asp:TextBox  CssClass="form-control" id="n" placeholder="Ingrese el valor de n"  runat="server" />
                    <div class="invalid-feedback">
                      Por favor ingrese el valor de n.
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>       
    </div>

    <div class="col-md-3 mb-4">
      <label for="validationCustomUsername">Plazo</label>
              <div class="input-group">                   
                    <select class="custom-select" id="TipodePlazo">
                      <option value="">Seleccione...</option>
                      <option value="1">Meses</option>
                      <option value="2">Años</option>
                  </select>
                    <div class="invalid-feedback">
                      Por favor ingrese el valor 
                    </div>
                    <div class="valid-feedback">
                       Correcto
                    </div>
              </div>
    </div>
      
  </div>
  <div class="form-group">
    <div class="form-check">
        <asp:CheckBox Cssclass="form-check-input"  id="invalidCheck" runat="server" />
      <label class="form-check-label" for="invalidCheck">
        Acepta los terminos y condiciones
      </label>
      <div class="invalid-feedback">
             Debe aceptar los terminos y condiciones antes de calcular.
      </div>
    </div>
  </div>  
    
  <asp:Button id="Button1" 	CssClass="btn btn-primary"  Text="Calcular"    runat="server"/>

    <div class="align-middle" id="theDiv" runat="server" >
        <div class="card-header">
          <i class="fa fa-area-chart"></i> Resultado del calculo del Valor Presente Neto (VPN)</div>
        <div class="card-body">
          <canvas id="myAreaChart" width="100" height="30"></canvas>
        </div>
        <div class="card-footer small text-muted"> Actualizado el  <%: DateTime.Today %></div>
      </div>
   

<script>
 /*  
// Example starter JavaScript for disabling form submissions if there are invalid fields
       (function() {
          'use strict';
          window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
              form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                  event.preventDefault();
                  event.stopPropagation();
                }
                form.classList.add('was-validated');
              }, false);
            });
          }, false);  
        })();*/
</script>
</asp:Content>

