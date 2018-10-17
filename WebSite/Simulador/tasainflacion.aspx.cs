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

    [WebMethod]
    public static object get_imputs_post(string id_indice_base)
    {

        try
        {
            /*   //Realizamos la consula
               var db = new Entidades();
               var query = db.Amortizacion_pro.Where(Amort => Amort.ID_Proyecto == idproyecto && Amort.ID_Periodo.StartsWith(periodSelect));

               List<string> result_query = new List<string>();

               foreach (var Result in query)
               {
                   result_query.Add(Result.ID_Amortizacion_pro);
                   result_query.Add(Result.ID_Periodo);
                   result_query.Add(Result.Amortizacion);

               }
                var json = JsonConvert.SerializeObject(result_query);
   */
            var json = JsonConvert.SerializeObject("hola" + id_indice_base);
            return json;
        }
        // Most specific:
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


    }


}