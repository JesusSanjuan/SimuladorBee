<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="User_Index" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="../Scripts/rangeslider/rangeslider.css" rel="stylesheet" />
    <link href="../Content/bootstrap-select.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
       
            function validateRango(sender, args) {
                 $(document).ready(function () {
                    var perdiodo = "Años";


                    alert("-->"+perdiodo);
                    if (perdiodo == "Años")
                        args.IsValid = (args.Value.length <= 80);
                    else if (perdiodo == "Meses")
                         args.IsValid = (args.Value.length <= 300);
                  });
            }
        
    </script>

    
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
          <!--
                <div class="col-xl-3 col-sm-6 mb-3"  data-anijs="if: load, on:window, do: tada animated, before: scrollReveal, after: removeAnim">
                  <div class="card text-white bg-warning o-hidden h-100">
                    <div class="row card-body">
                      <div class="col-3">
                        <i class="fa fa-comments fa-5x"></i>
                      </div>
                      <div class="col-9 text-right">
                        <div class="huge">26</div>
                        <div>Nuevos comentarios!</div>
                      </div>
                    </div>
                    <a class="card-footer bg-light  clearfix small z-1 " href="#">
                      <span class="pull-left">Ver detalles</span>
                      <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                      </span>
                    </a>
                  </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3" data-anijs="if: load, on:window, do: tada animated, before: scrollReveal, after: removeAnim">
                  <div class="card text-white bg-success o-hidden h-100">
                    <div class="row card-body">
                      <div class="col-3">
                        <i class="fa fa-shopping-cart fa-5x"></i>
                      </div>
                      <div class="col-9 text-right">
                        <div class="huge">123</div>
                        <div>Nuevas ordenes!</div>
                      </div>
                    </div>
                    <a class="card-footer bg-light  clearfix small z-1 " href="#">
                      <span class="pull-left">Ver detalles</span>
                      <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                      </span>
                    </a>
                  </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3" data-anijs="if: load, on:window, do: rubberBand animated, before: scrollReveal, after: removeAnim">
                  <div class="card text-white bg-danger o-hidden h-100">
                    <div class="row card-body">
                      <div class="col-3">
                          <i class="far fa-life-ring fa-5x"></i>
                      </div>
                      <div class="col-9 text-right">
                        <div class="huge">13</div>
                        <div>Nuevos Tickets!</div>
                      </div>
                    </div>
                    <a class="card-footer bg-light  clearfix small z-1 " href="#">
                      <span class="pull-left">Ver detalles</span>
                      <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                      </span>
                    </a>
                  </div>
                </div>
      -->
      </div>
    
      
      <!-- Example DataTables -->
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
                  <th>Acciones</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Nombre</th>
                  <th>Fecha de Creación</th>
                  <th>Terminado</th>
                  <th>Acciones</th>
                </tr>
              </tfoot>
              <tbody>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
      </div>
    </div>
    <!-- /.container-fluid-->


    <!-- modal add Project-->
    <div class="modal fade" id="newProject" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <label for="titulo" class="col-form-label">Título:</label>
                        <input ID="Nombre_Proyecto" class="form-control" />
                        
                        <span id="valid1"  class="text-danger">Debe asignarle un nombre al proyecto</span>
                        
                        
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="lapso" class="col-form-label">Lapso por</label>
                                <select class="selectpicker show-tick" id="lapso" >
                                    <option>Años</option>
                                    <option>Meses</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm">
                            <div class="form-group">
                                <label for="periodo" class="col-form-label">Período de evaluación</label>
                                <input ID="nperiodo" class="form-control">
                                                               
                                <span id="valid2" class="text-danger">Debe asignarle un período </span> 

                                <span id="valid3"  class="text-danger"></span> 

                                <span id="valid4"  class="text-danger">Debe asignarle un período válido</span>                                

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
    <script src="../Scripts/startbootstrap/js/scripts.js"></script>  

</asp:Content>
