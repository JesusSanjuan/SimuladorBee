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
    public static string sendTableAmort(List<Dictionary<string, string>> dataTabla)
    {
        //Here I want to iterate the  objects 

        int a = dataTabla.Count();

        string json = JsonConvert.SerializeObject(dataTabla);
        System.Diagnostics.Debug.WriteLine(json);

        return json;

    }
    [WebMethod]
    public static object buscarID_proyect()
    {
        try
        {
            if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
            {
                System.Diagnostics.Debug.WriteLine("existe");
                return System.Web.HttpContext.Current.Session["ID_Proyecto"];
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

        List<List<string>> result_query = new List<List<string>>();

       

        foreach (Proyecto Proyect in consulta)
        {
            System.Diagnostics.Debug.WriteLine(string.Format("ID_proyecto: {0}\tid_usuario: {1}\tnombre_proyecto: {2}\tfecha: {3}\tclave_periodo: {4}",
                Proyect.ID_Proyecto, Proyect.ID_Usuario, Proyect.Nombre_Proyecto, Proyect.Fecha_Hora, Proyect.ID_Periodo));
            List<string> item = new List<string>();
            item.Add((Proyect.ID_Periodo).Substring(0, ((Proyect.ID_Periodo).Length) - 1));
            item.Add(Proyect.Nombre_Proyecto);
            result_query.Add(item);

            System.Diagnostics.Debug.WriteLine(" -----------------------------------------\n");
        }

        System.Diagnostics.Debug.WriteLine(idProyecto);


        var json = JsonConvert.SerializeObject(result_query);
        return json;

    }

    /*[WebMethod]
    public static int llenarSelect(int nperiodo)
    {

        return nperiodo;

    }*/
}