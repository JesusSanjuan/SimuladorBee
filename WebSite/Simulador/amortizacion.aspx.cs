using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Simulador_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static object sendTableAmort(List<Dictionary<string, string>> dataTabla, string Nperiod, float total)
    {
        try
        {
            //Here I want to iterate the  objects 
            int a = dataTabla.Count();
            string json = JsonConvert.SerializeObject(dataTabla);
            //System.Diagnostics.Debug.WriteLine(json);
            System.Diagnostics.Debug.WriteLine(Nperiod);
            System.Diagnostics.Debug.WriteLine(total);
            // OBTENEMOS LOS DATOS DE LA AMORTIZACION DEL PERIODO SELECCIONADO
            string id_amortizac = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/
            string id_proyect      = (string) System.Web.HttpContext.Current.Session["ID_Proyecto"];
            string id_periodo   = Nperiod;
            string tabl_json    = json;
            float tabl_total    = total;

            // GUARDAMOS A LA BASE DE DATOS
            var db = new Entidades();
            var NuevaAmortizacion = new Amortizacion_pro();
            NuevaAmortizacion.ID_Amortizacion_pro = id_amortizac;
            NuevaAmortizacion.ID_Proyecto = id_proyect;
            NuevaAmortizacion.ID_Periodo = id_periodo;
            NuevaAmortizacion.Amortizacion = tabl_json;
            NuevaAmortizacion.Total = tabl_total;

            db.Amortizacion_pro.Add(NuevaAmortizacion);
            db.SaveChanges();

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

                List<string> list = new List<string>();
                list.Add((string) (System.Web.HttpContext.Current.Session["ID_Proyecto"]) );
                list.Add((string)(System.Web.HttpContext.Current.Session["name_Proyecto"]) );

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

    [WebMethod]
    public static string getPeriodo(string idProyecto) {
        /********* busqueda del numero de periodos**********/
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */
        /**Otra forma de obtener el id del usuario**/
        /****Obtén el contexto actual**/
        var httpContext = HttpContext.Current;
        /***Get the user id**/
        string id_user = httpContext.User.Identity.GetUserId();
        var consulta = db.Proyecto.Where(Proyect => Proyect.ID_Proyecto == idProyecto);

        var nperiodos   =   "";
        foreach (Proyecto Proyect in consulta)
        {
            System.Diagnostics.Debug.WriteLine(string.Format("ID_proyecto: {0}\tid_usuario: {1}\tnombre_proyecto: {2}\tfecha: {3}\tclave_periodo: {4}",
                Proyect.ID_Proyecto, Proyect.ID_Usuario, Proyect.Nombre_Proyecto, Proyect.Fecha_Hora, Proyect.ID_Periodo));
            nperiodos   =   ((Proyect.ID_Periodo).Substring(0, ((Proyect.ID_Periodo).Length) - 1));

            System.Diagnostics.Debug.WriteLine(" -----------------------------------------\n");
        }
        System.Diagnostics.Debug.WriteLine(nperiodos);
        return nperiodos;

    }

    /*[WebMethod]
    public static int llenarSelect(int nperiodo)
    {

        return nperiodo;

    }*/
}