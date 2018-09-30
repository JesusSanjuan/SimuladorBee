using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Btn_ClickVANC(Object sender, EventArgs e)
    {

        CreacionTabla();
    }

    public void CreacionTabla()
    {
        if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
        {
            //BUSQUEDA DE COSTOS
            var idProyecto = (string) System.Web.HttpContext.Current.Session["ID_Proyecto"];
            var db = new Entidades();
            var query = db.Costos_Pro.Where(Costos => Costos.ID_Proyecto == idProyecto).OrderBy(Costos => Costos.ID_Periodo);
            int periodo = 1;
            List<decimal> result_query = new List<decimal>();
            var clav = "";
            foreach (var Result in query)
            {
                result_query.Add(Result.Total);
                clav = Result.ID_Periodo;
                periodo++;

            }
            clav = (clav).Substring((clav).Length - 1, 1);
            if (clav == "A")
                clav = "Año";
            else
                clav = "Mes";

            String PeriodoSelect = clav;
            String[,] ArregloDatos = new String[periodo , 7];

            for (int j = 0; j < periodo; j++)
            {
                ArregloDatos[j, 0] = Convert.ToString(j + 1);
            }
            for (int j = 0; j < periodo; j++)
            {
                ArregloDatos[j, 1] = PeriodoSelect + " " + Convert.ToString(j);
            }

            ArregloDatos[0, 2] = "";
            var c = 0;
            for (int j = 1; j < periodo; j++)
            {
                ArregloDatos[j, 2] = result_query[c].ToString();
                c++;
            }

            String MatrizFinal = JsonConvert.SerializeObject(ArregloDatos);
            String comando = "InicializarTabla(" + MatrizFinal + ")";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", comando, true);

            
        }
    }


    /************************/
    [WebMethod]
    public static object buscarID_proyect()
    {
        try
        {
            if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
            {
                System.Diagnostics.Debug.WriteLine("existe");

                List<string> list = new List<string>();
                list.Add((string)(System.Web.HttpContext.Current.Session["ID_Proyecto"]));
                list.Add((string)(System.Web.HttpContext.Current.Session["name_Proyecto"]));

                return JsonConvert.SerializeObject(list);
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
}