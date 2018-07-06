using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Index : System.Web.UI.Page
{
    protected void Guardar_ProyectoBtn_Click(Object sender, EventArgs e)
    {
        // Probando a guardar datos de ejrmplo en la BD
        /*var db = new Entidades();
        var NuevoProyecto = new Proyecto();
        NuevoProyecto.ID_Proyecto = "0001";
        NuevoProyecto.ID_Usuario = "f68f0294-060b-436e-91e0-098ca8436170";
        NuevoProyecto.Nombre_Proyecto = Nombre_Proyecto.Text;
        NuevoProyecto.Fecha_Hora = DateTime.Now;
        NuevoProyecto.ID_Periodo = "0";
        db.Proyecto.Add(NuevoProyecto);
        db.SaveChanges();*/
        System.Diagnostics.Debug.WriteLine(Nombre_Proyecto.Text);
    }

        protected void Page_Load(object sender, EventArgs e)
    {

    }
}