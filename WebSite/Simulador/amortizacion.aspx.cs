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
    public static object sendTableAmort(List<Dictionary<string, string>> dataTabla, string Nperiod, Decimal total)
    {
        try
        {
            //Here I want to iterate the  objects 
            string json = JsonConvert.SerializeObject(dataTabla);// selializamos las List de la tabla
            // OBTENEMOS LOS DATOS DE LA AMORTIZACION DEL PERIODO SELECCIONADO
            string id_amortizac = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/
            string id_proyect      = (string) System.Web.HttpContext.Current.Session["ID_Proyecto"];
            string id_periodo   = Nperiod;
            string tabl_json    = json;
            Decimal tabl_total    = total;

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
            /*System.Diagnostics.Debug.WriteLine(string.Format("ID_proyecto: {0}\tid_usuario: {1}\tnombre_proyecto: {2}\tfecha: {3}\tclave_periodo: {4}",
                Proyect.ID_Proyecto, Proyect.ID_Usuario, Proyect.Nombre_Proyecto, Proyect.Fecha_Hora, Proyect.ID_Periodo));*/
            //nperiodos   =   ((Proyect.ID_Periodo).Substring(0, ((Proyect.ID_Periodo).Length) - 1));
            nperiodos = Proyect.ID_Periodo;
        }

        //consultamos que periodos ya fuerón guardados en amortizacion_pro
        var query2 = db.Amortizacion_pro.Where(Amortizacion => Amortizacion.ID_Proyecto == idProyecto);
        List<List<string>> result_query = new List<List<string>>();
        List<string> periodos = new List<string>();
        foreach (Amortizacion_pro Amort in query2)
        {
            System.Diagnostics.Debug.WriteLine(string.Format("ID_Amortizacion_pro: {0}\tID_Proyecto: {1}\tID_Periodo: {2}\tAmortizacion: {3}\tTotal: {4}",
                Amort.ID_Amortizacion_pro, Amort.ID_Proyecto, Amort.ID_Periodo, Amort.Amortizacion, Amort.Total));

            periodos.Add((Amort.ID_Periodo).Substring(0, ((Amort.ID_Periodo).Length) - 1) );// para obtener solo el numero de periodo
            System.Diagnostics.Debug.WriteLine(" +++++++++++++++++++++++++++++\n");
        }
        //guardo el nperiodos
        periodos.Add(nperiodos);
        result_query.Add(periodos);

        var json = JsonConvert.SerializeObject(result_query);

        System.Diagnostics.Debug.WriteLine(json);

        return json;

    }

    [WebMethod]
    public static object get_data_amort(string idproyecto, string periodSelect)
    {

        try
        {
            //Realizamos la consula
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
            return json;
        }
        // Most specific:
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


    }

    [WebMethod]
    public static object updateTableAmort(List<Dictionary<string, string>> dataTabla, string Nperiod, Decimal total)
    {
        try
        {
            //Here I want to iterate the  objects 
            string json = JsonConvert.SerializeObject(dataTabla);// selializamos las List de la tabla
            // OBTENEMOS LOS DATOS DE LA AMORTIZACION DEL PERIODO SELECCIONADO
            string id_amortizac = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/
            string id_proyect = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];
            string id_periodo = Nperiod;
            string tabl_json = json;
            Decimal tabl_total = total;

            // consultamos A LA BASE DE DATOS
            var db = new Entidades();
            var updateAmortizacion = db.Amortizacion_pro.Where(Amortizacion => Amortizacion.ID_Proyecto == id_proyect && Amortizacion.ID_Periodo== id_periodo).Single();
            //modificamos el campo Amortizacion
            updateAmortizacion.Amortizacion = tabl_json;
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
 
}