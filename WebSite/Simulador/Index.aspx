<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="User_Index" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="../Scripts/rangeslider/rangeslider.css" rel="stylesheet" />
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
<div class="animate-bottom">
    <div class="container-fluid" >
      <!-- Breadcrumbs-->
         <nav aria-label="breadcrumb" style="padding-bottom:1rem;"  data-anijs="if: load, on:window, do: pulse animated, before: scrollReveal, after: removeAnim">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">Simulador</a>
            </li>
            <li class="breadcrumb-item active">Inicio</li>
          </ol>
      </nav> 
     <!-- Mensaje -->
        <div class="alert alert-primary d-none" role="alert">
            Proyecto <a href="#" class="alert-link" id="nameProject">x</a> cargado...
        </div>
      <!-- Icon Cards-->
      <div class="row" >
                <div class="col-xl-3 col-sm-6 mb-3" data-anijs="if: load, on:window, do: rubberBand animated, before: scrollReveal, after: removeAnim">
                  <div class="card text-white  bg-primary o-hidden h-100">
                    <div class="row card-body">              
                        <div class="col-3">
                            <i class="fa fa-tasks fa-5x"></i>
                        </div>
                        <div class="col-9 text-right">
                            <div class="huge" id="nproyect">0</div>
                            <div>Proyectos</div>
                        </div>
                    </div>
                    <a class="card-footer bg-light  clearfix small z-1 " href="#" id="addProject">
                      <span class="pull-left">Agregar Nuevo</span>
                      <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                      </span>
                    </a>
                  </div>
                </div>
       </div>         
      <!--DataTable -->
          <div class="card mb-3" data-anijs="if: load, on: window, do: fadeInUp animated, before: scrollReveal">
                <div class="card-header">
                  <i class="fa fa-table"></i> Mis proyectos</div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-bordered" id="tableProyect" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th>Nombre</th>
                          <th>Fecha de Creación</th>
                          <th>Terminado</th>
                          <th>Cargar</th>
                          <th>Eliminar</th>
                        </tr>
                      </thead>
                      <tfoot>
                        <tr>
                          <th>Nombre</th>
                          <th>Fecha de Creación</th>
                          <th>Terminado</th>
                          <th>Cargar</th>
                          <th>Eliminar</th>
                        </tr>
                      </tfoot>
                      <tbody>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="card-footer small text-muted">Actualizado ayer a las 11:59 PM</div>
          </div>
    </div>
</div>
<!-- modal add Project-->
<div class="modal fade" id="newProject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-anijs="if: load, on:window, do: tada animated, before: scrollReveal, after: removeAnim">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title" id="exampleModalLabel">Nuevo Proyecto</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="titulo" class="col-form-label">Título</label>
                    <div class="input-group">
                        <input ID="Nombre_Proyecto" class="form-control" autocomplete="off" style="cursor:pointer" required="required" />     
                        <div id="valid1"class="invalid-tooltip">
                            Debe asignarle un nombre al proyecto
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm">
                        <div class="form-row"> 
                            <div class="col-md-12 mb-2">
                                <label for="validationCustom05">Plazo</label>    
                            </div>
                        </div>
                        <div class="form-row"> 
                            <div class="col-md-6 mb-2">  
                                <div class="input-group">
                                    <select  id="select" class="selectpicker show-tick form-control"  runat="server" ClientIDMode="Static"  required="required" >
                                                                    <option value="" class="dropdown-item" selected>Seleccione</option>
                                                                    <option value="2" class="dropdown-item">Años</option>
                                                                    <option value="1" class="dropdown-item">Meses</option>                                                                    
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
                </div>                    
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="Guardar_Proyecto"  type="button" class="btn btn-primary" >Guardar </button>
            </div>
        </div>
    </div>
</div>
<!-- modalde eliminar proyecto-->
<div class="modal fade" id="eliminarproyecto" data-anijs="if: load, on: window, do: swing animated, before: scrollReveal" >
        <div class="modal-dialog">
            <div class="modal-content">      
                <!-- Modal Header -->
                <div class="modal-header">
                        <h4 class="modal-title bounce animated" id="txtmodatitle"> <i class="fa fa-check-square-o"></i> Eliminar proyecto</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>                    
                </div>        
                <!-- Modal body -->
                <div class="modal-body" id="modal-text-body" >    
                    <div class="row">
                            <div class="col-3" id="imgmodal"></div>
                            <div class="col-9" id="texmodal"></div>                                                                        
                    </div>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button class="btn btn-secondary" id="cerrar"  type="button" data-dismiss="modal">Cerrar</button> 
                </div>
            </div>
        </div>
</div> 
</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
     <!-- plugin rangeslide-->
    <script type="text/javascript" src="../Scripts/rangeslider/rangeslider.min.js"></script>
    <!-- plugin selectpicker-->
    <script src="../Scripts/bootstrap-select.min.js"></script>
    <!-- plugin dataTable-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <!-- SCRIPT DE LOS CONTENIDOS -->
    <script src="../Scripts/Simulador/scripts.js"></script>
</asp:Content>
