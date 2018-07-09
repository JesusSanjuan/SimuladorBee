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
        string id_periodo      = nperiodo.Value.Substring(0, 1) + lapso.Value.ToString().Substring(0, 1);
        string id_user         = User.Identity.GetUserId();/*para obtener el id de usuario utilizando icrosoft.AspNet.Identity */
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
        var consulta = db.Proyecto.Where(Proyecto => Proyecto.ID_Usuario == id_user);
        System.Diagnostics.Debug.WriteLine(consulta);

        foreach (Proyecto proyecto in consulta)
        {
            Console.WriteLine(string.Format("ID_proyecto: {0}\tid_usuario: {1}\tnombre_proyecto: {2}\tfecha: {3}\tclave_periodo: {4}",
                proyecto.ID_Proyecto, proyecto.ID_Usuario, proyecto.Nombre_Proyecto, proyecto.Fecha_Hora, proyecto.ID_Periodo));
            
            Console.WriteLine(" -----------------------------------------\n");
        }

       // System.Diagnostics.Debug.WriteLine(json);


        return "hola";
    }

    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}