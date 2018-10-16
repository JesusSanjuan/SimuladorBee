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
    }

    protected void Btn_ClickInflacion(Object sender, EventArgs e)
    {
        Resultados.Visible = true;
    }

    [WebMethod]
    public static string extraerindices()
    {
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */

        var consulta1 = db.indice_INPC.OrderByDescending(indice =>indice.Id_indice );

        List<string> result_ids_indice = new List<string>();
        List<string> result_descrip_indice_base = new List<string>();

        foreach (indice_INPC INPC_id in consulta1)
        {
            result_ids_indice.Add(INPC_id.Id_indice);
            result_descrip_indice_base.Add(INPC_id.descripcion_indice_base);
        }

        List<List<string>> valores = new List<List<string>>();
        valores.Add(result_ids_indice);
        valores.Add(result_descrip_indice_base);

        var json = JsonConvert.SerializeObject(valores);


        return json;

    }
}