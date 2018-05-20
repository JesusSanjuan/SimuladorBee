<%@ Page  Title="" Async="true" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="Vpn.aspx.cs" Inherits="User_Vpn" %>

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
                    <div class="input-group-append">
                         <span class="input-group-text" id="inputGroupPrepend0">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                        <asp:TextBox CssClass="form-control" ID="Inversion" placeholder="Ingrese la inversion"  runat="server" ToolTip="Ingrese valor ejemplo" onkeypress="formatoMoneda(this.value)" required="required" />
                    <div class="invalid-feedback">                       
                      Por favor ingrese la inversion.
                    </div>
                    <div class="valid-feedback">
                      
                    </div>                   
              </div>   
            <asp:RegularExpressionValidator ID="RegularExpression1" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="Inversion" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" CssClass="invalid-feedback"></asp:RegularExpressionValidator>
   </div>

    <div class="col-md-3 mb-4">
      <label for="validationCustom02">Flujo Neto de Efectivo</label>
             <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend1">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                         <asp:TextBox CssClass="form-control" id="FNE" placeholder="Ingrese el Flujo Neto de Efectivo"  runat="server"  required="required"/>
                    <div class="invalid-feedback">
                      Por favor ingrese el FNE.
                    </div>
                    <div class="valid-feedback">
                       
                    </div>
              </div>  
             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="FNE" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                   
    </div>

    <div class="col-md-3 mb-4">
      <label for="validationCustom03">Valor de Salvamento</label>
              <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend2">$</span>
                         <span class="input-group-text">0.00</span>
                    </div>
                        <asp:TextBox  CssClass="form-control" id="VdS" placeholder="Ingrese el valor de salvamento"  runat="server"   required="required"/>
                    <div class="invalid-feedback">
                      Por favor ingrese el valor de salvamento
                    </div>
                    <div class="valid-feedback">
                       
                    </div>
              </div>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="Vds" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
     </div>
      <div class="col-md-3 mb-4">
      <label for="validationCustom04">TMAR</label>
              <div class="input-group">                    
                    <asp:TextBox  CssClass="form-control" id="TMAR" placeholder="Ingrese el valor de TMAR"  runat="server"  required="required"/>
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="inputGroupPrepend3">%</span>
                    </div>
                    <div class="invalid-feedback">
                      Por favor ingrese el valor de TMAR.
                    </div>
                    <div class="valid-feedback">
                       
                    </div>
              </div> 
             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="TMAR" ValidationExpression="([0-9]*)(\.[0-9]{1,2})?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
                   
    </div> 
  </div>
  <div class="form-row">     
    <div class="col-md-4 mb-2">
      <label for="validationCustom06">Plazo (n)</label>
              <div class="input-group">                   
                   <asp:TextBox  CssClass="form-control" id="n" placeholder="Ingrese el plazo del proyecto"  runat="server" required="required"/> 
                   
                              <div class="input-group-append">
                                  <select  class="btn btn-outline-secondary " id="Select" runat="server" required="required">
                                                  <option value="" class="dropdown-item">Seleccione</option>
                                                  <option value="Mes" class="dropdown-item">Mes</option>
                                                  <option value="Año" class="dropdown-item">Año</option>
                                   </select>
                             </div>
                    <div class="invalid-feedback">
                      Por favor seleccione
                    </div>
                    <div class="valid-feedback">
                    </div>
              </div>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="n" ValidationExpression="([0-9]*)?" Display="Dynamic" Cssclass="invalid-feedback"></asp:RegularExpressionValidator>
    </div>  
              
  </div>

         <div class="form-row">  
                <div class="col-md-5 mb-5">
                    <div class="form-check">
                        <asp:CheckBox Cssclass="form-check-input"  id="invalidCheck" runat="server"   Text="   Acepta los terminos y condiciones" required="required" />
                      <div class="invalid-feedback">
                             Debe aceptar los terminos y condiciones antes de calcular.
                      </div>
                    </div>
                </div>
        </div>
    
    <div class="form-row">
        <div class="col-md-2 mb-3">
            <div class="form-row">   
                    <div class="col-md-3 mb-3">
                          <asp:Button id="Button1" 	CssClass="btn btn-primary"  Text="Calcular"   runat="server"/>
                    </div>
            </div>
         </div>
        <div class="col-md-4 mb-4">
           
          <!--    <div class="modal fade" id="preloader"  runat="server"    Posifle efecto visual>
                          <div class="modal-dialog" role="document">-->
                           <div runat="server" id="efecto">   
                               <div id="preloader_1">
                                  <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                        </div> 
             <!--            </div>
                </div>-->

       </div>
    </div>
   


    
  <div class="align-middle" id="theDiv" runat="server" >
        <div class="card mb-1">      
        <div class="card-header">
          <h4> <i class="fa fa-line-chart"></i> Resultados del calculo del Valor Presente Neto (VPN)</h4>
        </div>
             <div class="navbar-expand-sm bg-dark navbar-dark">  
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link " href="#Resultado">Resultado</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#Resultado2">TIR</a>
                </li>
                <!--<li class="nav-item">
                      <a class="nav-link" href="#Tabla">Tabla</a>
                </li>-->
                <li class="nav-item">
                  <a class="nav-link" href="#Grafica">Grafica</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#Descargas">Descargas</a>
                </li>
              </ul>
            </div>
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                <div id="Resultado">
                        <div class="card-header" >
                                <h5><i class="fa fa-dollar"></i>  Resultado VPN</h5>
                        </div>
                        <div class="breadcrumb">
                            <div class="card-body text-info">
                            <h3>    <asp:Label id="VPN" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                            </div>
                        </div>
                </div>
            </div>
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">
                <div id="Resultado2">
                        <div class="card-header" >
                                <h5> % Tasa Interna de Rendimiento</h5>
                        </div>
                        <div class="breadcrumb">
                            <div class="card-body text-info">
                            <h3>    <asp:Label id="TIR" runat="server" Cssclass="card-text" Text="Label" ></asp:Label> </h3>
                            </div>
                        </div>
                </div>
            </div>
            <div id="Tabla" class="container-fluid card-body" style="padding-top:15px;padding-bottom:15px">
             <div class="card-header">
                <h5><i class="fa fa-table"></i>  Tabla</h5>
             </div>
                                                   <div class="table-responsive breadcrumb">
                                                <Table class="table table-bordered" id="dataTable"   >
                                                  <thead>
                                                    <tr>
                                                      <th>Name</th>
                                                      <th>Position</th>
                                                      <th>Office</th>
                                                      <th>Age</th>
                                                      <th>Start date</th>
                                                      <th>Salary</th>
                                                    </tr>
                                                  </thead>
                                                  <tfoot>
                                                    <tr>
                                                      <th>Name</th>
                                                      <th>Position</th>
                                                      <th>Office</th>
                                                      <th>Age</th>
                                                      <th>Start date</th>
                                                      <th>Salary</th>
                                                    </tr>
                                                  </tfoot>
                                                  <tbody>
                                                    <tr>
                                                      <td>Tiger Nixon</td>
                                                      <td>System Architect</td>
                                                      <td>Edinburgh</td>
                                                      <td>61</td>
                                                      <td>2011/04/25</td>
                                                      <td>$320,800</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Garrett Winters</td>
                                                      <td>Accountant</td>
                                                      <td>Tokyo</td>
                                                      <td>63</td>
                                                      <td>2011/07/25</td>
                                                      <td>$170,750</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Ashton Cox</td>
                                                      <td>Junior Technical Author</td>
                                                      <td>San Francisco</td>
                                                      <td>66</td>
                                                      <td>2009/01/12</td>
                                                      <td>$86,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Cedric Kelly</td>
                                                      <td>Senior Javascript Developer</td>
                                                      <td>Edinburgh</td>
                                                      <td>22</td>
                                                      <td>2012/03/29</td>
                                                      <td>$433,060</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Airi Satou</td>
                                                      <td>Accountant</td>
                                                      <td>Tokyo</td>
                                                      <td>33</td>
                                                      <td>2008/11/28</td>
                                                      <td>$162,700</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Brielle Williamson</td>
                                                      <td>Integration Specialist</td>
                                                      <td>New York</td>
                                                      <td>61</td>
                                                      <td>2012/12/02</td>
                                                      <td>$372,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Herrod Chandler</td>
                                                      <td>Sales Assistant</td>
                                                      <td>San Francisco</td>
                                                      <td>59</td>
                                                      <td>2012/08/06</td>
                                                      <td>$137,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Rhona Davidson</td>
                                                      <td>Integration Specialist</td>
                                                      <td>Tokyo</td>
                                                      <td>55</td>
                                                      <td>2010/10/14</td>
                                                      <td>$327,900</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Colleen Hurst</td>
                                                      <td>Javascript Developer</td>
                                                      <td>San Francisco</td>
                                                      <td>39</td>
                                                      <td>2009/09/15</td>
                                                      <td>$205,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Sonya Frost</td>
                                                      <td>Software Engineer</td>
                                                      <td>Edinburgh</td>
                                                      <td>23</td>
                                                      <td>2008/12/13</td>
                                                      <td>$103,600</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jena Gaines</td>
                                                      <td>Office Manager</td>
                                                      <td>London</td>
                                                      <td>30</td>
                                                      <td>2008/12/19</td>
                                                      <td>$90,560</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Quinn Flynn</td>
                                                      <td>Support Lead</td>
                                                      <td>Edinburgh</td>
                                                      <td>22</td>
                                                      <td>2013/03/03</td>
                                                      <td>$342,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Charde Marshall</td>
                                                      <td>Regional Director</td>
                                                      <td>San Francisco</td>
                                                      <td>36</td>
                                                      <td>2008/10/16</td>
                                                      <td>$470,600</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Haley Kennedy</td>
                                                      <td>Senior Marketing Designer</td>
                                                      <td>London</td>
                                                      <td>43</td>
                                                      <td>2012/12/18</td>
                                                      <td>$313,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Tatyana Fitzpatrick</td>
                                                      <td>Regional Director</td>
                                                      <td>London</td>
                                                      <td>19</td>
                                                      <td>2010/03/17</td>
                                                      <td>$385,750</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Michael Silva</td>
                                                      <td>Marketing Designer</td>
                                                      <td>London</td>
                                                      <td>66</td>
                                                      <td>2012/11/27</td>
                                                      <td>$198,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Paul Byrd</td>
                                                      <td>Chief Financial Officer (CFO)</td>
                                                      <td>New York</td>
                                                      <td>64</td>
                                                      <td>2010/06/09</td>
                                                      <td>$725,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Gloria Little</td>
                                                      <td>Systems Administrator</td>
                                                      <td>New York</td>
                                                      <td>59</td>
                                                      <td>2009/04/10</td>
                                                      <td>$237,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Bradley Greer</td>
                                                      <td>Software Engineer</td>
                                                      <td>London</td>
                                                      <td>41</td>
                                                      <td>2012/10/13</td>
                                                      <td>$132,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Dai Rios</td>
                                                      <td>Personnel Lead</td>
                                                      <td>Edinburgh</td>
                                                      <td>35</td>
                                                      <td>2012/09/26</td>
                                                      <td>$217,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jenette Caldwell</td>
                                                      <td>Development Lead</td>
                                                      <td>New York</td>
                                                      <td>30</td>
                                                      <td>2011/09/03</td>
                                                      <td>$345,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Yuri Berry</td>
                                                      <td>Chief Marketing Officer (CMO)</td>
                                                      <td>New York</td>
                                                      <td>40</td>
                                                      <td>2009/06/25</td>
                                                      <td>$675,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Caesar Vance</td>
                                                      <td>Pre-Sales Support</td>
                                                      <td>New York</td>
                                                      <td>21</td>
                                                      <td>2011/12/12</td>
                                                      <td>$106,450</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Doris Wilder</td>
                                                      <td>Sales Assistant</td>
                                                      <td>Sidney</td>
                                                      <td>23</td>
                                                      <td>2010/09/20</td>
                                                      <td>$85,600</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Angelica Ramos</td>
                                                      <td>Chief Executive Officer (CEO)</td>
                                                      <td>London</td>
                                                      <td>47</td>
                                                      <td>2009/10/09</td>
                                                      <td>$1,200,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Gavin Joyce</td>
                                                      <td>Developer</td>
                                                      <td>Edinburgh</td>
                                                      <td>42</td>
                                                      <td>2010/12/22</td>
                                                      <td>$92,575</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jennifer Chang</td>
                                                      <td>Regional Director</td>
                                                      <td>Singapore</td>
                                                      <td>28</td>
                                                      <td>2010/11/14</td>
                                                      <td>$357,650</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Brenden Wagner</td>
                                                      <td>Software Engineer</td>
                                                      <td>San Francisco</td>
                                                      <td>28</td>
                                                      <td>2011/06/07</td>
                                                      <td>$206,850</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Fiona Green</td>
                                                      <td>Chief Operating Officer (COO)</td>
                                                      <td>San Francisco</td>
                                                      <td>48</td>
                                                      <td>2010/03/11</td>
                                                      <td>$850,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Shou Itou</td>
                                                      <td>Regional Marketing</td>
                                                      <td>Tokyo</td>
                                                      <td>20</td>
                                                      <td>2011/08/14</td>
                                                      <td>$163,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Michelle House</td>
                                                      <td>Integration Specialist</td>
                                                      <td>Sidney</td>
                                                      <td>37</td>
                                                      <td>2011/06/02</td>
                                                      <td>$95,400</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Suki Burks</td>
                                                      <td>Developer</td>
                                                      <td>London</td>
                                                      <td>53</td>
                                                      <td>2009/10/22</td>
                                                      <td>$114,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Prescott Bartlett</td>
                                                      <td>Technical Author</td>
                                                      <td>London</td>
                                                      <td>27</td>
                                                      <td>2011/05/07</td>
                                                      <td>$145,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Gavin Cortez</td>
                                                      <td>Team Leader</td>
                                                      <td>San Francisco</td>
                                                      <td>22</td>
                                                      <td>2008/10/26</td>
                                                      <td>$235,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Martena Mccray</td>
                                                      <td>Post-Sales support</td>
                                                      <td>Edinburgh</td>
                                                      <td>46</td>
                                                      <td>2011/03/09</td>
                                                      <td>$324,050</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Unity Butler</td>
                                                      <td>Marketing Designer</td>
                                                      <td>San Francisco</td>
                                                      <td>47</td>
                                                      <td>2009/12/09</td>
                                                      <td>$85,675</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Howard Hatfield</td>
                                                      <td>Office Manager</td>
                                                      <td>San Francisco</td>
                                                      <td>51</td>
                                                      <td>2008/12/16</td>
                                                      <td>$164,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Hope Fuentes</td>
                                                      <td>Secretary</td>
                                                      <td>San Francisco</td>
                                                      <td>41</td>
                                                      <td>2010/02/12</td>
                                                      <td>$109,850</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Vivian Harrell</td>
                                                      <td>Financial Controller</td>
                                                      <td>San Francisco</td>
                                                      <td>62</td>
                                                      <td>2009/02/14</td>
                                                      <td>$452,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Timothy Mooney</td>
                                                      <td>Office Manager</td>
                                                      <td>London</td>
                                                      <td>37</td>
                                                      <td>2008/12/11</td>
                                                      <td>$136,200</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jackson Bradshaw</td>
                                                      <td>Director</td>
                                                      <td>New York</td>
                                                      <td>65</td>
                                                      <td>2008/09/26</td>
                                                      <td>$645,750</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Olivia Liang</td>
                                                      <td>Support Engineer</td>
                                                      <td>Singapore</td>
                                                      <td>64</td>
                                                      <td>2011/02/03</td>
                                                      <td>$234,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Bruno Nash</td>
                                                      <td>Software Engineer</td>
                                                      <td>London</td>
                                                      <td>38</td>
                                                      <td>2011/05/03</td>
                                                      <td>$163,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Sakura Yamamoto</td>
                                                      <td>Support Engineer</td>
                                                      <td>Tokyo</td>
                                                      <td>37</td>
                                                      <td>2009/08/19</td>
                                                      <td>$139,575</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Thor Walton</td>
                                                      <td>Developer</td>
                                                      <td>New York</td>
                                                      <td>61</td>
                                                      <td>2013/08/11</td>
                                                      <td>$98,540</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Finn Camacho</td>
                                                      <td>Support Engineer</td>
                                                      <td>San Francisco</td>
                                                      <td>47</td>
                                                      <td>2009/07/07</td>
                                                      <td>$87,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Serge Baldwin</td>
                                                      <td>Data Coordinator</td>
                                                      <td>Singapore</td>
                                                      <td>64</td>
                                                      <td>2012/04/09</td>
                                                      <td>$138,575</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Zenaida Frank</td>
                                                      <td>Software Engineer</td>
                                                      <td>New York</td>
                                                      <td>63</td>
                                                      <td>2010/01/04</td>
                                                      <td>$125,250</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Zorita Serrano</td>
                                                      <td>Software Engineer</td>
                                                      <td>San Francisco</td>
                                                      <td>56</td>
                                                      <td>2012/06/01</td>
                                                      <td>$115,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jennifer Acosta</td>
                                                      <td>Junior Javascript Developer</td>
                                                      <td>Edinburgh</td>
                                                      <td>43</td>
                                                      <td>2013/02/01</td>
                                                      <td>$75,650</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Cara Stevens</td>
                                                      <td>Sales Assistant</td>
                                                      <td>New York</td>
                                                      <td>46</td>
                                                      <td>2011/12/06</td>
                                                      <td>$145,600</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Hermione Butler</td>
                                                      <td>Regional Director</td>
                                                      <td>London</td>
                                                      <td>47</td>
                                                      <td>2011/03/21</td>
                                                      <td>$356,250</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Lael Greer</td>
                                                      <td>Systems Administrator</td>
                                                      <td>London</td>
                                                      <td>21</td>
                                                      <td>2009/02/27</td>
                                                      <td>$103,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Jonas Alexander</td>
                                                      <td>Developer</td>
                                                      <td>San Francisco</td>
                                                      <td>30</td>
                                                      <td>2010/07/14</td>
                                                      <td>$86,500</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Shad Decker</td>
                                                      <td>Regional Director</td>
                                                      <td>Edinburgh</td>
                                                      <td>51</td>
                                                      <td>2008/11/13</td>
                                                      <td>$183,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Michael Bruce</td>
                                                      <td>Javascript Developer</td>
                                                      <td>Singapore</td>
                                                      <td>29</td>
                                                      <td>2011/06/27</td>
                                                      <td>$183,000</td>
                                                    </tr>
                                                    <tr>
                                                      <td>Donna Snider</td>
                                                      <td>Customer Support</td>
                                                      <td>New York</td>
                                                      <td>27</td>
                                                      <td>2011/01/25</td>
                                                      <td>$112,000</td>
                                                    </tr>
                                                  </tbody>
                                                </Table>
                                              </div>
             
            </div>
            <div id="Grafica" class="container-fluid " style="padding-top:15px;padding-bottom:15px">
                <div class="card-header">
                    <h5><i class="fa fa-bar-chart"></i>  Grafica</h5>
                </div>
                <div class="card-body breadcrumb">
                  <canvas id="myAreaChart" width="100" height="30"></canvas>
                </div>
            </div>
            <div id="Descargas" class="container-fluid " style="padding-top:15px;padding-bottom:15px">
              <div class="card-header">
                <h5><i class="fa fa-cloud-download"></i>  Descargas</h5>
              </div>
                <div class="breadcrumb">
                  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
                  <p>Try to scroll this section and look at the navigation bar while scrolling! Try to scroll this section and look at the navigation bar while scrolling!</p>
                </div>
            </div>
        <div class="card-footer small text-muted"> Actualizado el  <%: DateTime.Today %></div>
      </div>   
</div>
 

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields

    /* <div class="input-group-append"> 
                       <asp:RequiredFieldValidator runat="server" ControlToValidate="Inversion" CssClass="text-danger" ErrorMessage="El campo  es obligatorio." Display="Dynamic"  />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Estructura incorrecta" ControlToValidate="Inversion" ValidationExpression="([0-9]*)(\.[0-9]{2})?" Display="Dynamic"></asp:RegularExpressionValidator>
                  </div> */
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
                  form.classList.add('was-feedback');
              }, false);
            });
          }, false);  
    })();
</script>
   
<script src="../Scripts/startbootstrap/vendor/smooth-scroll/smooth-scroll.js"></script>
<script >
    var scroll = new SmoothScroll('a[href*=""]', {
	// Selectors
	ignore: '[data-scroll-ignore]', // Selector for links to ignore (must be a valid CSS selector)
	header: null, // Selector for fixed headers (must be a valid CSS selector)

	// Speed & Easing
	speed: 1500, // Integer. How fast to complete the scroll in milliseconds
	offset: 41, // Integer or Function returning an integer. How far to offset the scrolling anchor location in pixels
	easing: 'easeInOutCubic', // Easing pattern to use
	customEasing: function (time) {

		// Function. Custom easing pattern
		// If this is set to anything other than null, will override the easing option above

		// return <your formulate with time as a multiplier>

		// Example: easeInOut Quad
		return time < 0.5 ? 2 * time * time : -1 + (4 - 2 * time) * time;

	},

	// Callback API
	before: function (anchor, toggle) {}, // Callback to run before scroll
	after: function (anchor, toggle) {} // Callback to run after scroll
    });




    function formatoMoneda(number) {
       
    var number1 = number.toString(), result = '', estado = true;
    if (parseInt(number1) < 0) {
        estado = false;
        number1 = parseInt(number1) * -1;
        number1 = number1.toString();
    }
    if (number1.indexOf(',') == -1) {
        while (number1.length > 3) {
            result = '.' + '' + number1.substr(number1.length - 3) + '' + result;
            number1 = number1.substring(0, number1.length - 3);
        }
        result = number1 + result;
        if (estado == false) {
            result = '-' + result;
        }
    }
    else {
        var pos = number1.indexOf(',');
        var numberInt = number1.substring(0, pos);
        var numberDec = number1.substring(pos, number1.length);
        while (numberInt.length > 3) {
            result = '.' + '' + numberInt.substr(numberInt.length - 3) + '' + result;
            numberInt = numberInt.substring(0, numberInt.length - 3);
        }
        result = numberInt + result + numberDec;
        if (estado == false) {
            result = '-' + result;
        }
        }
    return result;
}

</script>
</asp:Content>

