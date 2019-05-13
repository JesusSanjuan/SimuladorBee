using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_PE : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static object get_costos_fijosT(string idProyecto)
    {

        try
        {
            //Realizamos la consula
            var db = new Entidades();
            //var query = db.Gastos_Pro.Where(Gastos => Gastos.ID_Proyecto == idProyecto);
            var query = db.Costos_Pro.Where(Costos => Costos.ID_Proyecto == idProyecto)
                                         .OrderBy(Costos => Costos.ID_Periodo)
                                         .Select(Costos => new { Costos.Produccion, Costos.Ventas, Costos.Admon, Costos.Financiamiento })
                                         .ToList();



            List<List<string>> result_query = new List<List<string>>();
            foreach (var Result in query)
            {
                List<string> item = new List<string>();
                item.Add(Result.Produccion);
                item.Add(Result.Ventas);
                item.Add(Result.Admon);
                item.Add(Result.Financiamiento);
                result_query.Add(item);

            }
            
            for (int i = 0; i< result_query.LongCount(); i++)
            {
                
                for (int j = 0; j< result_query[i].LongCount(); j++)
                {




                    System.Diagnostics.Debug.WriteLine("2>" + result_query[i][j]);

                    dynamic dynJson = JsonConvert.DeserializeObject(result_query[i][j]);
                   /* foreach (var item in dynJson)
                    {
                        //Console.WriteLine("{0} {1}\n", item.Concepto, item.Tipo);
                        System.Diagnostics.Debug.WriteLine(item.Concepto);
                    }
                    */

                    System.Diagnostics.Debug.WriteLine("------>");

                }

            }
            

            var json = JsonConvert.SerializeObject(result_query);


            //System.Diagnostics.Debug.WriteLine(json);

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