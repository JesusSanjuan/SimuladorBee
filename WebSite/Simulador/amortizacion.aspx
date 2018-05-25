<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="amortizacion.aspx.cs" Inherits="Simulador_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">  
                <a href="Index.aspx">Inicio</a>
            </li>
            <li class="breadcrumb-item active">Amortización</li>
        </ol>
    </nav>
    <div class="card align-middle">
        <div class="card-header">
            <h1><i class="fa fa-money"></i>  Amortización</h1>
        </div>

        <div class="tab-content" id="amort">
            <div class="container-fluid" style="padding-top:15px;padding-bottom:15px">          
                    <div class="card-header">
                        <h5><i class="fa fa-table"></i>  Amortizacion</h5>
                    </div>      
                    <div class="table-responsive">
                        <table class="table table-bordered" id="amortTable" >
                            <thead>
                                <tr>
                                    <th >Concepto</th>
                                    <th >$ Costo</th>
                                    <th >%</th>
                                    <th >Total</th>
                                    <th ></th>
                
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="previous">Terrenos</td>
                                    <td>0</td>
                                    <td>20</td>
                                    <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Edificios</td>
                                    <td>0</td>
                                    <td>5</td>
                                    <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Transporte</td>
                                    <td>0</td>
                                    <td>25</td>
                                    <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                <tr>
                                    <td class="previous">Cómputo</td>
                                    <td>0</td>
                                    <td>30</td>
                                    <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                 <tr>
                                    <td class="previous">Mobiliario</td>
                                    <td>0</td>
                                    <td>10</td>
                                     <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                                 <tr>
                                    <td class="previous">Equipo de Oficina</td>
                                    <td>0</td>
                                    <td>10</td>
                                    <td data-editable="false"></td>
                                    <td data-editable="false"><i  class="fa fa-times fa-3 remove" aria-hidden="true"></i> </td>

                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th><strong>TOTAL</strong></th>
                                    <th></th>
                                    <th class="na"></th>
                                    <th class="na"></th>
                                    <th class="na"></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                 </div>  

            <div class="row">
                <div class="col">
                    <asp:Button id="add_row" 	CssClass="btn btn-primary"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                </div>
                <div class="col">
                  

                    <asp:LinkButton runat="server" ID="guardar" OnClientClick="return false;" CssClass="btn btn-primary">
                        <i class='fa fa-save'></i> Guardar
                    </asp:LinkButton>
                                               
                </div>
            </div>

        </div>



    </div>

</asp:Content>

