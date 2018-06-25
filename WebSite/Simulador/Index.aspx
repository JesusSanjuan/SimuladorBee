<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="User_Index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Simulador</a>
        </li>
        <li class="breadcrumb-item active">Inicio</li>
      </ol>
      <!-- Icon Cards-->
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white  bg-primary o-hidden h-100">
            <div class="row card-body">
              
                <div class="col-3">
                    <i class="fa fa-tasks fa-5x"></i>
                </div>
                <div class="col-9 text-right">
                    <div class="huge">2</div>
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
        <div class="col-xl-3 col-sm-6 mb-3">
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
        <div class="col-xl-3 col-sm-6 mb-3">
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
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="row card-body">
              <div class="col-3">
                <i class="fa fa-support fa-5x"></i>
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
      </div>
      
      <!-- Example DataTables Card-->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fa fa-table"></i> Mis proyectos</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Fecha de Creación</th>
                  <th>Terminado</th>
                  <th>Plan de negocios</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Nombre</th>
                  <th>Fecha de Creación</th>
                  <th>Terminado</th>
                  <th>Plan de negocios</th>
                </tr>
              </tfoot>
              <tbody>
                <tr>
                  <td>consultoria empresarial</td>
                  <td>06/12/2018 2:26 PM</td>
                  <td><i class="fa fa-check-square-o fa-lg" aria-hidden="true"></i></td>
                  <td><i class="fa fa-download fa-lg" aria-hidden="true"></i></td>
                </tr>
                <tr>
                  <td>proyecto 2</td>
                  <td>06/08/2018 1:26 PM</td>
                  <td><i class="fa fa-exclamation-circle fa-lg" aria-hidden="true"></i></td>
                  <td><i class="fa fa-download fa-lg" aria-hidden="true"></i></td>
                </tr>
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
                <!--<form>-->
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Título:</label>
                    <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">Año</label>
                    <input type="text" class="form-control" id="anio">
                </div>
                <div class="form-group">
                    <label for="recipient-name" class="col-form-label">País</label>
                    <input type="text" class="form-control" id="pais">
                </div>
                <div class="form-group">
                    <label for="message-text" class="col-form-label">Objetivos:</label>
                    <textarea class="form-control" id="objetivos"></textarea>
                </div>
                <!--</form>-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

