using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;

public partial class User_Index : System.Web.UI.Page
{
    protected void Guardar_ProyectoBtn_Click(Object sender, EventArgs e)
    {
        string nombre_proyecto = Nombre_Proyecto.Text;
        string id_periodo      = nperiodo.Value.Substring(0, 1) + lapso.Value.ToString().Substring(0, 1);//Para crear el idPeriodo
        string id_user         = User.Identity.GetUserId();/*para obtener el id de usuario utilizando Microsoft.AspNet.Identity */
        string id_proyect      = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/

        // Probando a guardar datos de ejrmplo en la BD
        var db = new Entidades();
        var NuevoProyecto           = new Proyecto();
        NuevoProyecto.ID_Proyecto   = id_proyect;
        NuevoProyecto.ID_Usuario    = id_user;
        NuevoProyecto.Nombre_Proyecto = nombre_proyecto;
        NuevoProyecto.Fecha_Hora    = DateTime.Now;
        NuevoProyecto.ID_Periodo    = id_periodo;
        db.Proyecto.Add(NuevoProyecto);
        db.SaveChanges();
        //crear las sessiones 
        System.Web.HttpContext.Current.Session["ID_Proyecto"]   = id_proyect;
        System.Web.HttpContext.Current.Session["name_Proyecto"] = nombre_proyecto;
        System.Diagnostics.Debug.WriteLine(nombre_proyecto + "--"+ id_periodo +"--"+ id_user);
    }
    [WebMethod]
    public static string getsource()
    {
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */
        /**Otra forma de obtener el id del usuario**/
        /****Obtén el contexto actual**/
        var httpContext = HttpContext.Current;
        /***Get the user id**/
        string id_user = httpContext.User.Identity.GetUserId();
        var consulta = db.Proyecto.Where(Proyect => Proyect.ID_Usuario == id_user);//consulta los proyectos del usuario

        List<List<string>> result_query = new List<List<string>>();

        foreach (Proyecto Proyect in consulta)
        {
            //para visualizar en el debug
            System.Diagnostics.Debug.WriteLine(string.Format("ID_proyecto: {0}\tid_usuario: {1}\tnombre_proyecto: {2}\tfecha: {3}\tclave_periodo: {4}",
                Proyect.ID_Proyecto, Proyect.ID_Usuario, Proyect.Nombre_Proyecto, Proyect.Fecha_Hora, Proyect.ID_Periodo));

            List<string> item = new List<string>();
            item.Add(Proyect.Nombre_Proyecto);
            item.Add(String.Format("{0:dd/MM/yyyy HH:mm:ss}", Proyect.Fecha_Hora));
            item.Add("<i class='fas fa-check' aria-hidden='true'>");
            item.Add("<a href='#' class='nav-link cargar' data-id="+ Proyect.ID_Proyecto+ "  data-name=' " + Proyect.Nombre_Proyecto +" '><i class='fa fa-redo fa-lg'></i></a>");
            result_query.Add(item);
            System.Diagnostics.Debug.WriteLine(" -----------------------------------------\n");
        }

        var json = JsonConvert.SerializeObject(result_query);

       
        return json;
    }

    [WebMethod]
    public static object createSessionProyect(string id_proyect, string nam_proyect)
    {
        try
        {
            System.Web.HttpContext.Current.Session["ID_Proyecto"] = id_proyect;
            System.Web.HttpContext.Current.Session["name_Proyecto"] = nam_proyect;
            return "succes";
        }
        // Most specific:
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


    }

    [WebMethod]
    public static object buscarID_proyect()
    {
        try
        {
            if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
            {
                System.Diagnostics.Debug.WriteLine("existe");
                return System.Web.HttpContext.Current.Session["name_Proyecto"];
            }
            else
            {
                System.Diagnostics.Debug.WriteLine("No existe");
                return "false";
            }
            
        }
        // Most specific:
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}