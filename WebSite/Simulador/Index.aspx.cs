using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class User_Index : System.Web.UI.Page
{
    protected void Guardar_ProyectoBtn_Click(Object sender, EventArgs e)
    {
        string nombre_proyecto = Nombre_Proyecto.Text;
        string id_periodo      = nperiodo.Value.Substring(0, 1) + lapso.Value.ToString().Substring(0, 1);
        string id_user         = User.Identity.GetUserId();/*para obtener el id de usuario utilizando icrosoft.AspNet.Identity */

        // Probando a guardar datos de ejrmplo en la BD
        var db = new Entidades();
        var NuevoProyecto           = new Proyecto();
        NuevoProyecto.ID_Proyecto   = "0001";
        NuevoProyecto.ID_Usuario    = id_user;
        NuevoProyecto.Nombre_Proyecto = nombre_proyecto;
        NuevoProyecto.Fecha_Hora    = DateTime.Now;
        NuevoProyecto.ID_Periodo    = id_periodo;
        db.Proyecto.Add(NuevoProyecto);
        db.SaveChanges();
        System.Diagnostics.Debug.WriteLine(nombre_proyecto + "--"+ id_periodo +"--"+ id_user);
    }

        protected void Page_Load(object sender, EventArgs e)
    {

    }
}