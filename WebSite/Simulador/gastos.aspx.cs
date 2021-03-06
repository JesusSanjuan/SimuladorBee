﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Microsoft.AspNet.Identity;

public partial class Simulador_gastos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    [WebMethod]
    public static object  sendTable(List<Dictionary<string, string>> dataTabla, string Nperiod, Decimal total, string pestania, float inflacion)
    {
        //Here I want to iterate the  objects 
        int a = dataTabla.Count();

        string json = JsonConvert.SerializeObject(dataTabla);
        // OBTENEMOS LOS DATOS DE LA TABLA COSTOS DEL PERIODO SELECCIONADO
        string id_gastos  = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/
        string id_proyect = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];
        string id_periodo = Nperiod;
        string tabl_json   = json;
        Decimal tabl_total = total;

        try
        {
            // GUARDAMOS A LA BASE DE DATOS
            var db = new Entidades();
            
            switch (pestania)
            {
                case "NGastos1"://Para guardar los datos por primera vez
                    
                    var NuevoGasto = new Gastos_Pro();
                    NuevoGasto.ID_Gastos_pro = id_gastos;
                    NuevoGasto.ID_Proyecto   = id_proyect;
                    NuevoGasto.ID_Periodo    = id_periodo;
                    NuevoGasto.Produccion    = tabl_json;
                    NuevoGasto.Ventas        = "";
                    NuevoGasto.Financiamiento = "";
                    NuevoGasto.Admon = "";
                    NuevoGasto.Total = tabl_total;
                    db.Gastos_Pro.Add(NuevoGasto);
                    //Guardo el id que se creo
                    System.Web.HttpContext.Current.Session["id_gasto"] = id_gastos;
                    
                    break;
                default://Para el update
                   
                    if (System.Web.HttpContext.Current.Session["id_gasto"] != null)
                    {
                        
                        string idGasto = (string)System.Web.HttpContext.Current.Session["id_gasto"];
                        // Realizamos la consulta
                        var gastos = db.Gastos_Pro.Where(costo => costo.ID_Gastos_pro == idGasto);

                        // Modificamos los objetos que consideremos oportunos
                        foreach (var gasto in gastos)
                        {
                            System.Diagnostics.Debug.WriteLine("case 2---->pestania-->" + pestania);
                            if (pestania    == "NGastos2")
                            {
                                gasto.Ventas = tabl_json;
                                gasto.Total = gasto.Total + tabl_total;
                            }
                            else if (pestania == "NGastos3")
                            {
                                gasto.Admon = tabl_json;
                                gasto.Total = gasto.Total + tabl_total;

                            }
                            else if (pestania == "NGastos4")
                            {
                                gasto.Financiamiento = tabl_json;
                                gasto.Total = gasto.Total + tabl_total;
                                float val_inflacion = inflacion;
                                Proyeccion(db, id_proyect, id_periodo, gasto.Total, val_inflacion);
                                agregar_avance(id_proyect);
                            }
                            
                        }

                    }
                    break;
            }

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

    private static object Proyeccion(Entidades db, string id_proyect, string id_periodo, decimal tabl_total, float infla)
    {
        var inflacion = (infla / 100) + 1;

        //BUSCAMOS CUANTOS PERIODOS TIENE
        var httpContext = HttpContext.Current;
        string id_user = httpContext.User.Identity.GetUserId();
        var consulta = db.Proyecto.Where(Proyect => Proyect.ID_Proyecto == id_proyect);
        int nperiodos = 0;
        var claveperiodo = "";
        foreach (Proyecto Proyect in consulta)
        {
            // para obtener solo el A(anual) M(mensual)
            claveperiodo = (Proyect.ID_Periodo).Substring((Proyect.ID_Periodo).Length - 1, 1);
            // para obtener solo el numero de periodo
            nperiodos = Int32.Parse((Proyect.ID_Periodo).Substring(0, ((Proyect.ID_Periodo).Length) - 1));

        }
        var query = db.Gastos_Pro.Where(Gastos => Gastos.ID_Proyecto == id_proyect && Gastos.ID_Periodo == id_periodo);
        List<string> result_query = new List<string>();


        foreach (var Result in query)
        {
            result_query.Add(Result.Produccion);
            result_query.Add(Result.Ventas);
            result_query.Add(Result.Admon);
            result_query.Add(Result.Financiamiento);
        }
        Decimal total = tabl_total;

        var arreglo = result_query;
        for (int i = 2; i <= nperiodos; i++)
        {
            string clave = (i - 1).ToString() + claveperiodo;
            List<string> campos = new List<string>();
            foreach (var prime in arreglo)
            {
                List<Dictionary<string, string>> obj = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(prime);
                foreach (Dictionary<string, string> lst in obj)
                {
                    decimal gastoU = decimal.Parse(lst["$ Gasto Unitario"]) * (decimal)(inflacion);
                    decimal gastoT = decimal.Parse(lst["$ Gasto Total"]) * (decimal)(inflacion);
                    lst["$ Gasto Unitario"] = gastoU.ToString();
                    lst["$ Gasto Total"]    = gastoT.ToString();


                }
                campos.Add(JsonConvert.SerializeObject(obj));
            }

            total = total * (decimal)inflacion;
            //GUARDAMOS
            string id_costos = System.Guid.NewGuid().ToString("D");
            var NuevoGasto = new Gastos_Pro();
            NuevoGasto.ID_Gastos_pro = id_costos;
            NuevoGasto.ID_Proyecto = id_proyect;
            NuevoGasto.ID_Periodo = i + claveperiodo;
            NuevoGasto.Produccion = campos[0];
            NuevoGasto.Ventas = campos[1];
            NuevoGasto.Admon = campos[2];
            NuevoGasto.Financiamiento = campos[3];
            NuevoGasto.Total = total;
            db.Gastos_Pro.Add(NuevoGasto);
            arreglo = campos;
        }

        return "succes";
    }

    public static string agregar_avance(string id_proyecto)
    {
        try
        {
            var db = new Entidades();

            var projAvance = db.Proyecto.Where(Proyect => Proyect.ID_Proyecto == id_proyecto).Single();
            //modificamos el campo Activo
            projAvance.Avance = projAvance.Avance + 1;
            db.SaveChanges();

            return "succes";

        }
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return "fail";
        }
    }
    [WebMethod]
    public static string getPeriodo(string idProyecto)
    {
        /********* busqueda del numero de periodos**********/
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */
        /**Otra forma de obtener el id del usuario**/
        /****Obtén el contexto actual**/
        var httpContext = HttpContext.Current;
        /***Get the user id**/
        string id_user = httpContext.User.Identity.GetUserId();

        var consulta = db.Proyecto.Where(Proyect => Proyect.ID_Proyecto == idProyecto);

        var nperiodos = "";
        foreach (Proyecto Proyect in consulta)
        {
            nperiodos = Proyect.ID_Periodo;
        }

        //consultamos que periodos ya fuerón guardados en gastos
        var query2 = db.Gastos_Pro.Where(Gastos => Gastos.ID_Proyecto == idProyecto);
        //List<List<List<string>>> result_query = new List<List<List<string>>>();
        List<List<string> >result_query = new List<List<string>>();
        List<string> periodos = new List<string>();
        List<string> pestanias = new List<string>();
        foreach (Gastos_Pro Gast in query2)
        {
            var periodo = (Gast.ID_Periodo).Substring(0, ((Gast.ID_Periodo).Length) - 1);// para obtener solo el numero de periodo
            if (Gast.Ventas != ""  & Gast.Financiamiento != "" & Gast.Admon != "")
            {
                periodos.Add(periodo);
            }
            else
            {
                if (Gast.Produccion != "")
                {
                    pestanias.Add("1");

                }
                if (Gast.Ventas != "")
                {
                    pestanias.Add("2");

                }
                if (Gast.Admon != "")
                {
                    pestanias.Add("3");
                }
                if (Gast.Financiamiento != "")
                {
                    pestanias.Add("4");
                }
            }
            
        }
        //guardo el nperiodos
        List<string> nperiodos_a = new List<string>();
        nperiodos_a.Add(nperiodos);
        //periodos.Add(nperiodos_a);
        result_query.Add(periodos);
        result_query.Add(pestanias);
        result_query.Add(nperiodos_a);
        // el formato que envia es : [[arreglo de los periodos que ya estan completos],[pestanias que estan completas],[num de periodo en total que tiene]]
        var json = JsonConvert.SerializeObject(result_query);
        return json;
    }

    [WebMethod]
    public static object crear_session(string idproyecto, string periodSelect)
    {

        try
        {
            
            //Verificamos que no exista la session
            if (System.Web.HttpContext.Current.Session["id_gasto"] == null)
            {
                //Realizamos la consula
                var db = new Entidades();
                var query = db.Gastos_Pro.Where(Gastos => Gastos.ID_Proyecto == idproyecto && Gastos.ID_Periodo.StartsWith(periodSelect));
                foreach (var Result in query)
                {
                    System.Web.HttpContext.Current.Session["id_gasto"] = Result.ID_Gastos_pro;
                }
            }

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
    public static object get_data(string idproyecto, string periodSelect)
    {

        try
        {
            //Realizamos la consula
            var db = new Entidades();
            var query = db.Gastos_Pro.Where(Gastos => Gastos.ID_Proyecto == idproyecto && Gastos.ID_Periodo.StartsWith(periodSelect));

            List<string> result_query = new List<string>();

            foreach (var Result in query)
            {
                result_query.Add(Result.ID_Periodo);
                result_query.Add(Result.Produccion);
                result_query.Add(Result.Ventas);
                result_query.Add(Result.Admon);
                result_query.Add(Result.Financiamiento);
                //Verificamos que no exista la session
                if (System.Web.HttpContext.Current.Session["id_gasto"] == null)
                {
                    System.Web.HttpContext.Current.Session["id_gasto"] = Result.ID_Gastos_pro;

                }

            }
            /*****se hace la cosulta de la inflacion********/
            //var inflacion = (1.5).ToString();
            var inflacion = "X";
            result_query.Add(inflacion);
            /*****se hace la cosulta de la inflacion********/

            var json = JsonConvert.SerializeObject(result_query);
            System.Diagnostics.Debug.WriteLine(json);
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
    public static object updateTable(List<Dictionary<string, string>> dataTabla, string Nperiod, Decimal total, Decimal total_a, string pestania)
    {
        //Here I want to iterate the  objects 
        int a = dataTabla.Count();

        string json = JsonConvert.SerializeObject(dataTabla);

        // OBTENEMOS LOS DATOS DE LA TABLA COSTOS DEL PERIODO SELECCIONADO
        string tabl_json = json;
        string periodo = Nperiod;
        Decimal tabl_total = total;
        Decimal total_ant = total_a;

        try
        {
            // GUARDAMOS A LA BASE DE DATOS
            var db = new Entidades();

            if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
            {
                string idProyecto = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];
                // Realizamos la consulta
                var gastos = db.Gastos_Pro.Where(gasto => gasto.ID_Proyecto == idProyecto && gasto.ID_Periodo == periodo);
                // Modificamos los objetos que consideremos oportunos
                foreach (var gasto in gastos)
                {
                    switch (pestania)
                    {
                        case "NGastos1"://Para guardar los datos por primera vez
                            gasto.Produccion = tabl_json;
                            gasto.Total = (gasto.Total - total_a) + tabl_total;
                            break;
                        case "NGastos2":
                            gasto.Ventas = tabl_json;
                            gasto.Total = (gasto.Total - total_a) + tabl_total;
                            break;
                        case "NGastos3":
                            gasto.Admon = tabl_json;
                            gasto.Total = (gasto.Total - total_a) + tabl_total;
                            break;

                        default://NGastos4
                            gasto.Financiamiento = tabl_json;
                            gasto.Total = (gasto.Total - total_a) + tabl_total;
                            break;
                    }
                }

            }
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
    public static object getInflacion()
    {
        string id_proyect = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];

        try
        {
            //Realizamos la consula
            var db = new Entidades();
            var query = db.Inflacion.Where(infla => infla.ID_Proyecto == id_proyect);

            List<List<string>> result_query = new List<List<string>>();



            foreach (var Result in query)
            {
                List<string> item = new List<string>();

                item.Add(Result.ID_Inflacion);
                item.Add(Result.Valor_Inflacion.ToString());
                item.Add(Result.Tipo);
                item.Add(Result.Periodo);
                result_query.Add(item);
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


}