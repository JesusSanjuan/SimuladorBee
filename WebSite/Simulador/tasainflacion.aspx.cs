using Newtonsoft.Json;
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
    public void getPeriodo()
    {
        /********* busqueda del numero de periodos**********/
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */

        var consulta1 = db.indice_INPC.OrderByDescending(indice =>indice.Id_indice );

        List<string> result_ids_indice = new List<string>();
        List<string> result_descrip_indice_base = new List<string>();

        foreach (indice_INPC INPC_id in consulta1)
        {
            result_ids_indice.Add(INPC_id.Id_indice);
            result_descrip_indice_base.Add(INPC_id.descripcion_indice_base);
        }

        String vec1 = JsonConvert.SerializeObject(result_ids_indice);
        String vec2 = JsonConvert.SerializeObject(result_descrip_indice_base);

        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "inicializacion(" + vec1 + ", " + vec2 +  ");", true);

      /*  var consulta3 = db.INPC.OrderByDescending(anio => anio.anio); 

        List<string> result_ids = new List<string>();
        List<int> result_anios= new List<int>();

        foreach (INPC INPC_anio in consulta3)
        {
            result_ids.Add(INPC_anio.Id);
            result_anios.Add((int)INPC_anio.anio);
        }*/
        
    }
}