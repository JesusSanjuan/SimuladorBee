<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="costos.aspx.cs" Inherits="Simulador_costos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div  class="container" >
        <div class="card-header">
            <h5><i class="fa fa-table"></i>  Costos</h5>
            <div class="table-responsive">
                <table id="costTable" class="table table-bordered" >
                    <thead class="thead-dark">
                        <tr>
                            <th >Concepto</th>
                            <th >$ Costo</th>
                            <th ></th>
                
                        </tr>
                    </thead>
                    <tbody>
                
                    </tbody>
                    <tfoot>
                        <tr>
                            <th><strong>TOTAL</strong></th>
                            <th></th>
                            <th id="na"></th>
                 
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        

        <div class="row">
             <div class="col">
                 <asp:Button id="add_row" 	CssClass="btn btn-primary mb1 bg-red"  Text="Agregar"   runat="server" OnClientClick="return false;"/>
                    
             </div>
        </div>

    </div>
</asp:Content>

