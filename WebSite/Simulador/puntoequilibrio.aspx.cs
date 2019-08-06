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

    [WebMethod]
    public static object guardar_PE(string idProyecto, double costosFijos, double precio_VU, double costo_variable_unidad, double punto_equilibrio_U, double precio_V, double costo_V, double punto_equilibrio_P)
    {
        try
        {
            var res = "";
            var db = new Entidades();
            bool ban = false;
            //Verificamos que los datos no se repitan
            decimal var1 = Convert.ToDecimal(precio_VU);
            decimal var2 = Convert.ToDecimal(costo_variable_unidad);
            double var3 = Convert.ToDouble( punto_equilibrio_U);
            decimal var4 = Convert.ToDecimal(precio_V);
            decimal var5 = Convert.ToDecimal(costo_V);
            decimal var6 = Convert.ToDecimal(punto_equilibrio_P);

            var query = db.Punto_Equilibrio.Where(PE => PE.ID_Proyecto == idProyecto && PE.Precio_Venta_Unidad == var1
                                                                        && PE.PE_Pesos == var6);
            if (query.Count() > 0)
            {
                ban = true;
                res = "OK";
            }
            else
            {

                Punto_Equilibrio PE = new Punto_Equilibrio();
                string id_PE = System.Guid.NewGuid().ToString("D");
                PE.ID_PE = id_PE;
                PE.ID_Proyecto = idProyecto;
                PE.Costos_Fijos_Unidad = Convert.ToDecimal(costosFijos);
                PE.Precio_Venta_Unidad = Convert.ToDecimal(precio_VU);
                PE.Costo_Variable_Unidad = Convert.ToDecimal(costo_variable_unidad);
                PE.PE_Unidades = Convert.ToDecimal(punto_equilibrio_U);

                PE.Costos_Fijos_Pesos = Convert.ToDecimal(costosFijos);
                PE.Precio_Venta = Convert.ToDecimal(precio_V);
                PE.Costo_Venta = Convert.ToDecimal(costo_V);
                PE.PE_Pesos = Convert.ToDecimal(punto_equilibrio_P);
                PE.Fecha = DateTime.Now;
                db.Punto_Equilibrio.Add(PE);

                db.SaveChanges();


                res = "OK";
            }
            //verificamos si ya hay punto equilibrio en la tabla
            var query2= db.Punto_Equilibrio.Where(PE => PE.ID_Proyecto == idProyecto );
            if (query2.Count() == 1 && ban == false)
                agregar_avance(idProyecto);

            return res; 
                
                
        }
        
        // Most specific:
        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


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
    public static object get_punto_equilibrio(string idProyecto)
    {
        try
        {
            //Realizamos la consula del ultimo insertado
            var db = new Entidades();
            var query = db.Punto_Equilibrio.Where(PE => PE.ID_Proyecto == idProyecto)
                                            .OrderByDescending(PE => PE.Fecha);
            List<string> result_query = new List<string>();

            foreach (var Result in query)
            {

                result_query.Add(Result.Precio_Venta_Unidad.ToString());
                result_query.Add(Result.Costo_Variable_Unidad.ToString());
                result_query.Add(Result.PE_Unidades.ToString());
                result_query.Add(Result.Precio_Venta.ToString());
                result_query.Add(Result.Costo_Venta.ToString());
                result_query.Add(Result.PE_Pesos.ToString());
                

            }
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




}