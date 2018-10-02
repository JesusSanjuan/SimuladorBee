using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_tasainflacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Resultados.Visible = false;
        getPeriodo();
    }

    protected void Btn_ClickInflacion(Object sender, EventArgs e)
    {
        Resultados.Visible = true;
    }

    [WebMethod]
    public static void getPeriodo()
    {
        /********* busqueda del numero de periodos**********/
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */

        var consulta = db.INPC.OrderByDescending(anio => anio.anio); 

        List<string> result_ids = new List<string>();
        List<int> result_anios= new List<int>();

        foreach (INPC INPC_anio in consulta)
        {
            result_ids.Add(INPC_anio.Id);
            result_anios.Add((int)INPC_anio.anio);
        }
        
    }
}