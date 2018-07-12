<%@ Page Title="" Language="C#" MasterPageFile="~/Simulador/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="User_Index" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="../Scripts/DataTables/datatables.min.css" rel="stylesheet" />
    <link href="../Scripts/rangeslider.js/rangeslider.css" rel="stylesheet" />
    <link href="../Scripts/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
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
                <!--<tr>
                  <td>consultoria empresarial</td>
                  <td>06/12/2018 2:26 PM</td>
                  <td><i class="fas fa-check" aria-hidden="true"></td>
                  <td><i class="fa fa-download fa-lg" aria-hidden="true"></i></td>
                </tr>
                <tr>
                  <td>proyecto 2</td>
                  <td>06/08/2018 1:26 PM</td>
                  <td><i class="fa fa-exclamation-circle fa-lg" aria-hidden="true"></i></td>
                  <td><i class="fa fa-download fa-lg" aria-hidden="true"></i></td>
                </tr>-->
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
                <asp:HiddenField id="nperiodo" runat="server" />
                <div class="form-group">
                    <label for="titulo" class="col-form-label">Título:</label>
                    <asp:TextBox runat="server" ID="Nombre_Proyecto" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Nombre_Proyecto"
                            CssClass="text-danger" ErrorMessage="Debe asignarle un nombre al proyecto" />
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="periodo" CssClass="control-label">Período de evaluación</asp:Label>
                    <input  type="range" max="10" value="1" id="periodo" runat="server">
                </div>
                <div class="form-group">
                    <label for="lapso" class="col-form-label">Lapso por</label>
                    <select class="selectpicker show-tick" id="lapso" runat="server">
                        <option>Años</option>
                        <option>Meses</option>
                    </select>
                </div>
                <!--</form>-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:Button id="Guardar_Proyecto" CssClass="btn btn-primary" OnClick="Guardar_ProyectoBtn_Click" Text="Guardar" runat="server"/>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="ContenPie" runat="server" ContentPlaceHolderID="Foder">
     <!-- plugin rangeslide-->
    <script type="text/javascript" src="../Scripts/rangeslider.js/rangeslider.min.js"></script>
    <!-- plugin selectpicker-->
    <script type="text/javascript" src="../Scripts/bootstrap-select/bootstrap-select.min.js"></script>
    <!-- plugin dataTable-->
    <script type="text/javascript" src="../Scripts/DataTables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../Scripts/DataTables/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#MainContent_nperiodo").val("1");
            /**Inicialización rangeslider.js**/
            $('input[type="range"]').rangeslider({
                polyfill: false,
                onInit: function () {
                    this.output = $('<div class="range-output" />').insertAfter(this.$range).html(this.$element.val());
                },
                onSlide: function (position, value) {
                    this.output.html(value);
                    $("#MainContent_nperiodo").val(value);
                }
            });
           
            /**Inicialización selectpicker.js**/
            $('.selectpicker').selectpicker
            /***Inicializando la Tabla****/
            $.ajax({
                type: "POST",
                url: "Index.aspx/getsource",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    //console.log(data.d);
                    var registros = JSON.parse(data.d);
                    $('#nproyect').text(registros.length);
                    $('#tableProyect').DataTable({
                        "aaData": registros,
                        "language": {
                            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
                        }
                    });

                },
                error: function (err) {
                    console.log(err);
                    console.log(err.responseText);
                }
            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });

            /****cargar el proyecto****/
            $("body").on("click", ".cargar", function () {
                //obtenemos los datas
                var id = $(this).attr("data-id");

                var name = $(this).attr("data-name");
                console.log("id" + id + "-- nombre" + name);
                $("#nameProject").text(name);
                //visualizamos el mensaje
                $(".alert").removeClass("d-none").addClass("d-block");

                $.ajax({
                    type: "POST",
                    url: "Index.aspx/createSessionProyect",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    data: JSON.stringify({ id_proyect: id }),
                    success: function (data) {
                        console.log(data.d);
                        if (typeof ID_Proyecto !== 'undefined') {

                            console.log("existee session --->"+ID_Proyecto );
                        }
                    },
                    error: function (err) {
                        console.log(err);
                        console.log(err.responseText);
                    }
                }).done(function (data) {
                    //console.log(data);
                }).fail(function (data) {
                    console.log("Error: " + data);
                });

            });

            /***** verificar si la session id_proyect existe *****/
            $.ajax({
                type: "POST",
                url: "Index.aspx/buscarID_proyect",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data.d);
                    
                },
                error: function (err) {
                    console.log(err);
                    console.log(err.responseText);
                }
            }).done(function (data) {
                //console.log(data);
            }).fail(function (data) {
                console.log("Error: " + data);
            });
            
        });
    </script>

</asp:Content>
