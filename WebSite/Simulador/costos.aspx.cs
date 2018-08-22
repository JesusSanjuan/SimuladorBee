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

public partial class Simulador_costos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Continuar_Click(Object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Prueba");
        string script = @"<script type='text/javascript'>
                                 $(document).ready(function () {
                                 $('#Continuacioncostos').modal({ show: true }); });
                                     $( '#costo_continuar' ).click(function() {
                                            $('#myTab li:nth-child(2) a').tab('show');
                                            $('#myTab li:nth-child(1) a').addClass('disabled');


                          });
                       </script>";
        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion2", script, false);
    }

    [WebMethod]
    public static object  sendTable(List<Dictionary<string, string>> dataTabla, string Nperiod, Decimal total, string pestania)
    {
        //Here I want to iterate the  objects 

        int a = dataTabla.Count();

        string json = JsonConvert.SerializeObject(dataTabla);
        System.Diagnostics.Debug.WriteLine("nperiodo-->"+ Nperiod+" total-->"+total+" nava-->"+ pestania);

        // OBTENEMOS LOS DATOS DE LA TABLA COSTOS DEL PERIODO SELECCIONADO
        string id_costos = System.Guid.NewGuid().ToString("D");/**** crear los id en random formato string***/
        string id_proyect = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];
        string id_periodo = Nperiod;
        string tabl_json = json;
        Decimal tabl_total = total;



        try
        {
            // GUARDAMOS A LA BASE DE DATOS
            var db = new Entidades();
            
            switch (pestania)
            {
                case "NCostos1":
                    
                    var NuevoCosto = new Costos_Pro();
                    NuevoCosto.ID_Costos_pro = id_costos;
                    NuevoCosto.ID_Proyecto = id_proyect;
                    NuevoCosto.ID_Periodo = id_periodo;
                    NuevoCosto.Produccion = tabl_json;
                    NuevoCosto.Ventas = "";
                    NuevoCosto.Financiamiento = "";
                    NuevoCosto.Admon = "";
                    db.Costos_Pro.Add(NuevoCosto);
                    //Guardo el id que se creo
                    System.Web.HttpContext.Current.Session["id_costo"] = id_costos;
                    System.Diagnostics.Debug.WriteLine("case 1---->");
                    break;
                default:
                   
                    if (System.Web.HttpContext.Current.Session["id_costo"] != null)
                    {
                        
                        string idCosto = (string)System.Web.HttpContext.Current.Session["id_costo"];
                        // Realizamos la consulta
                        var costos = db.Costos_Pro.Where(costo => costo.ID_Costos_pro == idCosto);

                        // Modificamos los objetos que consideremos oportunos
                        foreach (var costo in costos)
                        {
                            System.Diagnostics.Debug.WriteLine("case 2---->pestania-->" + pestania);
                            if (pestania    == "NCostos2")
                            {
                                costo.Ventas = tabl_json;
                            }
                            else if (pestania == "NCostos3")
                            {
                                costo.Admon = tabl_json;

                            }
                            else if (pestania == "NCostos4")
                            {
                                costo.Financiamiento = tabl_json;
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

        //consultamos que periodos ya fuerón guardados en costos_pro
        var query2 = db.Costos_Pro.Where(Costos => Costos.ID_Proyecto == idProyecto);
        //List<List<List<string>>> result_query = new List<List<List<string>>>();
        List<List<string> >result_query = new List<List<string>>();
        List<string> periodos = new List<string>();
        List<string> pestanias = new List<string>();
        foreach (Costos_Pro Cost in query2)
        {
            System.Diagnostics.Debug.WriteLine(string.Format("ID_Costos_pro: {0}\tID_Proyecto: {1}\tID_Periodo: {2}\tProduccion: {3}\tVentas: {4}\tFinanciamiento: {5}\tAdmon: {6}\tFinanciamiento: {5}\tTotal: {7}",
                Cost.ID_Costos_pro, Cost.ID_Proyecto, Cost.ID_Periodo, Cost.Produccion, Cost.Ventas, Cost.Financiamiento, Cost.Admon, Cost.Total));
            var periodo = (Cost.ID_Periodo).Substring(0, ((Cost.ID_Periodo).Length) - 1);// para obtener solo el numero de periodo
            if (Cost.Ventas != ""  & Cost.Financiamiento != "" & Cost.Admon != "")
            {
                periodos.Add(periodo);
            }
            else
            {
                if (Cost.Produccion != "")
                {
                    pestanias.Add("1");

                }
                if (Cost.Ventas != "")
                {
                    pestanias.Add("2");

                }
                if (Cost.Admon != "")
                {
                    pestanias.Add("3");
                }
                if (Cost.Financiamiento != "")
                {
                    pestanias.Add("4");
                }
            }
            
            System.Diagnostics.Debug.WriteLine(" +++++++++++++++++++++++++++++\n");
        }
        //guardo el nperiodos
        List<string> nperiodos_a = new List<string>();
        nperiodos_a.Add(nperiodos);
        //periodos.Add(nperiodos_a);
        result_query.Add(periodos);
        result_query.Add(pestanias);
        result_query.Add(nperiodos_a);

        var json = JsonConvert.SerializeObject(result_query);

        System.Diagnostics.Debug.WriteLine(json);

        return json;

    }

    [WebMethod]
    public static object crear_session_costo(string idproyecto, string periodSelect)
    {

        try
        {
            
            //Verificamos que no exista la session
            if (System.Web.HttpContext.Current.Session["id_costo"] == null)
            {
                //Realizamos la consula
                var db = new Entidades();
                var query = db.Costos_Pro.Where(Costos => Costos.ID_Proyecto == idproyecto && Costos.ID_Periodo.StartsWith(periodSelect));
                foreach (var Result in query)
                {
                    System.Web.HttpContext.Current.Session["id_costo"] = Result.ID_Costos_pro;
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



}