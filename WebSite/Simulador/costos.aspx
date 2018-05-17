<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="costos.aspx.cs" Inherits="Simulador_costos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <div  class="container" >
        <form>
            <div class="form-row">
                <div class="form-group col-md-3">
                  <input type="text" class="form-control" id="concepto" placeholder="Concepto">
                </div>
                <div class="form-group col-md-3">
                  <input type="text" class="form-control" id="precio" placeholder="Precio">
                </div>
                <div class="form-group col-md-3">
                    <asp:Button id="add_row" 	CssClass="btn btn-primary mb1 bg-green"  Text="Agregar Concepto"   runat="server" OnClientClick="return false;"/>
                </div>
            </div>
           
        </form>
   
    </div>
    <div id="costos" class="container" >
        <div class="card-header">
            <h5><i class="fa fa-table"></i>  Costos</h5>
            <div class="table-responsive">
                <Table class="table table-bordered" id="tab_logic"   >
                    <thead class="thead-dark">
                        <tr>
                            <th></th>
                            <th>Concepto</th>
                            <th>$</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr id='addr1'></tr>
                    </tbody>
                </Table>
            </div>
        </div>
         <div class="row">
             <div class="col">
                 <asp:Button id="delete_row" 	CssClass="btn btn-primary mb1 bg-red"  Text="Borrar"   runat="server" OnClientClick="return false;"/>
             </div>
        </div>
       
      
    </div>
</asp:Content>

