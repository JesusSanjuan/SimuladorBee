using Microsoft.AspNet.Identity;
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

        var consulta1 = db.indice_INPC.OrderByDescending(indice => indice.Id_indice);

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
            var db = new Entidades();
            var queryMax = db.INPC.Where(t => t.id_indice == id_indice_base).Select(t => new { t.Id, t.anio }).OrderByDescending(x => x.anio).FirstOrDefault();
            var queryMin = db.INPC.Where(t => t.id_indice == id_indice_base).Select(t => new { t.Id, t.anio }).OrderBy(x => x.anio).FirstOrDefault();

            var anonymousObjResult = from s in db.INPC
                                     where s.id_indice == id_indice_base
                                     orderby s.anio descending
                                     select new
                                     {
                                         Id = s.Id,
                                         Name = s.anio
                                     };
            List<string> R1 = new List<string>();
            List<string> R2 = new List<string>();
            foreach (var obj in anonymousObjResult)
            {
                R1.Add(obj.Id);
                R2.Add(obj.Name.ToString());
            }
            // var studentList = db.INPC.SqlQuery("Select *  from INPC where id_indice= '" + id_indice_base + "' ORDER BY anio").ToList(); //Error al final de la consulta 
            var json = "";
            if (queryMax != null && queryMin != null)
            {
                string[] meses = new string[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
                int anio_MAX = (int)queryMax.anio;
                string id_INCP_MAX = (string)queryMax.Id;
                int anio_MIN = (int)queryMin.anio;
                string id_INCP_MIN = (string)queryMin.Id;

                var queryMesMax = db.INPC.Where(t => t.Id == id_INCP_MAX);
                var queryMesMin = db.INPC.Where(t => t.Id == id_INCP_MIN);

                List<double> result_query = new List<double>();
                List<double> result_query2 = new List<double>();

                foreach (var Result in queryMesMax)
                {
                    result_query.Add((double)Result.enero);
                    result_query.Add((double)Result.febrero);
                    result_query.Add((double)Result.marzo);
                    result_query.Add((double)Result.abril);
                    result_query.Add((double)Result.mayo);
                    result_query.Add((double)Result.junio);
                    result_query.Add((double)Result.julio);
                    result_query.Add((double)Result.agosto);
                    result_query.Add((double)Result.septiembre);
                    result_query.Add((double)Result.octubre);
                    result_query.Add((double)Result.noviembre);
                    result_query.Add((double)Result.diciembre);

                }
                string mesMax = meses[11];
                for (int i = 1; i <= result_query.Count; i++)
                {
                    if (anio_MAX == anio_MIN)
                    {
                        if (result_query[i - 1] != 0)
                        {
                            mesMax = meses[i - 1];
                        }
                    }
                    else
                    {
                        if (result_query[0] == 0)
                        {
                            anio_MAX = anio_MAX - 1;
                            mesMax = meses[11];
                            break;
                        }
                        if (result_query[i] == 0)
                        {
                            mesMax = meses[i - 1];
                            break;
                        }
                    }
                }
                foreach (var Result in queryMesMin)
                {
                    result_query2.Add((double)Result.enero);
                    result_query2.Add((double)Result.febrero);
                    result_query2.Add((double)Result.marzo);
                    result_query2.Add((double)Result.abril);
                    result_query2.Add((double)Result.mayo);
                    result_query2.Add((double)Result.junio);
                    result_query2.Add((double)Result.julio);
                    result_query2.Add((double)Result.agosto);
                    result_query2.Add((double)Result.septiembre);
                    result_query2.Add((double)Result.octubre);
                    result_query2.Add((double)Result.noviembre);
                    result_query2.Add((double)Result.diciembre);

                }
                int cuentameses = 0;
                int posicion = 0;
                string mesMin = "";
                for (int i = 0; i < result_query2.Count; i++)
                {
                    if (result_query2[i] == 0)
                    {
                        cuentameses++;
                        mesMin = meses[i];
                        posicion = i;
                    }
                    else
                    {
                        break;
                    }

                }
                if (cuentameses == 0)
                {
                    mesMin = meses[0];
                }
                else
                {
                    if (cuentameses != 12)
                    {
                        mesMin = meses[posicion + 1];
                    }
                }
                List<string> T1 = new List<string>();
                List<string> T2 = new List<string>();
                T1.Add(Convert.ToString(anio_MIN));
                T1.Add(mesMin);
                T1.Add(id_INCP_MIN);

                T2.Add(Convert.ToString(anio_MAX));
                T2.Add(mesMax);
                T2.Add(id_INCP_MAX);

                List<List<string>> valoresF = new List<List<string>>();
                valoresF.Add(T1);
                valoresF.Add(T2);
                valoresF.Add(R1);
                valoresF.Add(R2);
                if (cuentameses != 12)
                {
                    json = JsonConvert.SerializeObject(valoresF);
                }
                else
                {
                    json = "";
                }

            }
            return json;
        }

        catch (ArgumentNullException e)
        {
            Console.WriteLine("{0} First exception caught.", e);
            return e;
        }


    }

    [WebMethod]
    public static object get_imputs_post_anio(string id_periodo_select)
    {
        var db = new Entidades();

        var Result = from s in db.INPC
                     where s.Id == id_periodo_select
                     select new
                     {
                         Enero = s.enero,
                         Febrero = s.febrero,
                         Marzo = s.marzo,
                         Abril = s.abril,
                         Mayo = s.mayo,
                         Junio = s.junio,
                         Julio = s.julio,
                         Agosto = s.agosto,
                         Septiembre = s.septiembre,
                         Octubre = s.octubre,
                         Noviembre = s.noviembre,
                         Diciembre = s.diciembre

                     };
        var json = "";
        List<string> R1 = new List<string>();
        foreach (var obj in Result)
        {
            if (obj.Enero.ToString() != "0")
            {
                R1.Add("Enero");
            }
            if (obj.Febrero.ToString() != "0")
            {
                R1.Add("Febrero");
            }
            if (obj.Marzo.ToString() != "0")
            {
                R1.Add("Marzo");
            }
            if (obj.Abril.ToString() != "0")
            {
                R1.Add("Abril");
            }
            if (obj.Mayo.ToString() != "0")
            {
                R1.Add("Mayo");
            }
            if (obj.Junio.ToString() != "0")
            {
                R1.Add("Junio");
            }
            if (obj.Julio.ToString() != "0")
            {
                R1.Add("Julio");
            }
            if (obj.Agosto.ToString() != "0")
            {
                R1.Add("Agosto");
            }
            if (obj.Septiembre.ToString() != "0")
            {
                R1.Add("Septiembre");
            }
            if (obj.Octubre.ToString() != "0")
            {
                R1.Add("Octubre");
            }
            if (obj.Noviembre.ToString() != "0")
            {
                R1.Add("Noviembre");
            }
            if (obj.Diciembre.ToString() != "0")
            {
                R1.Add("Diciembre");
            }
        }

        json = JsonConvert.SerializeObject(R1);
        return json;
    }



    [WebMethod]
    public static object get_imputs_post_anio_2(string id_periodo_select_anio)
    {
                var json = "";              
                var db = new Entidades();
                var Result = from s in db.INPC
                             where s.Id == id_periodo_select_anio
                             select new
                             {
                                id_indice_general = s.id_indice,
                                anio=s.anio
                             };
                var id_indice="";
                    int anio=0;
                foreach (var obj in Result)
                {
                    id_indice = obj.id_indice_general;
                    anio = obj.anio.Value;
                }
             
                var Result2 = from s in db.INPC
                             where (s.id_indice == id_indice && s.anio>=anio)
                              orderby s.anio descending
                              select new
                             {
                                 id_resultado = s.Id,
                                 anio = s.anio
                             };
                List<string> result_query = new List<string>();
                List<string> result_query2 = new List<string>();

                foreach (var obj in Result2)
                {

                    result_query.Add(obj.id_resultado);
                    result_query2.Add(obj.anio.ToString());
                }

                List<List<string>> valoresF = new List<List<string>>();
               
                valoresF.Add(result_query);
                valoresF.Add(result_query2);
                json = JsonConvert.SerializeObject(valoresF);
        
        return json;
    }


    [WebMethod]
    public static object get_imputs_post_anio_3(string id_periodo_select_anio, string id_periodo_select_mes, string id_periodo_select_anio2)
    {
        var json = "";
        var db = new Entidades();
        if(id_periodo_select_anio == id_periodo_select_anio2)
        {
            switch (id_periodo_select_mes)
               {
                   case "enero":
                            var lst0 = from s in db.INPC
                                       where s.Id == id_periodo_select_anio
                                       select new
                                       {
                                           Febrero = s.febrero,
                                           Marzo = s.marzo,
                                           Abril = s.abril,
                                           Mayo = s.mayo,
                                           Junio = s.junio,
                                           Julio = s.julio,
                                           Agosto = s.agosto,
                                           Septiembre = s.septiembre,
                                           Octubre = s.octubre,
                                           Noviembre = s.noviembre,
                                           Diciembre = s.diciembre
                                       };
                            List<string> result_query0 = new List<string>();
                            foreach (var obj in lst0)
                            {
                                    if (obj.Febrero.ToString() != "0")
                                    {
                                        result_query0.Add("Febrero");
                                    }
                                    if (obj.Marzo.ToString() != "0")
                                    {
                                         result_query0.Add("Marzo");
                                    }
                                    if (obj.Abril.ToString() != "0")
                                    {
                                        result_query0.Add("Abril");
                                    }
                                    if (obj.Mayo.ToString() != "0")
                                    {
                                        result_query0.Add("Mayo");
                                    }
                                    if (obj.Junio.ToString() != "0")
                                    {
                                         result_query0.Add("Junio");
                                    }
                                    if (obj.Julio.ToString() != "0")
                                    {
                                         result_query0.Add("Julio");
                                    }
                                    if (obj.Agosto.ToString() != "0")
                                    {
                                        result_query0.Add("Agosto");
                                    }
                                    if (obj.Septiembre.ToString() != "0")
                                    {
                                        result_query0.Add("Septiembre");
                                    }
                                    if (obj.Octubre.ToString() != "0")
                                    {
                                         result_query0.Add("Octubre");
                                    }
                                    if (obj.Noviembre.ToString() != "0")
                                    {
                                         result_query0.Add("Noviembre");
                                    }
                                    if (obj.Diciembre.ToString() != "0")
                                    {
                                         result_query0.Add("Diciembre");
                                    }
                             }
                            json = JsonConvert.SerializeObject(result_query0);

                    break;
                   case "febrero":
                            var lst1 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {                              
                                Marzo = s.marzo,
                                Abril = s.abril,
                                Mayo = s.mayo,
                                Junio = s.junio,
                                Julio = s.julio,
                                Agosto = s.agosto,
                                Septiembre = s.septiembre,
                                Octubre = s.octubre,
                                Noviembre = s.noviembre,
                                Diciembre = s.diciembre
                            };
                            List<string> result_query = new List<string>();
                            foreach (var obj in lst1)
                            {
                                    if (obj.Marzo.ToString() != "0")
                                    {
                                        result_query.Add("Marzo");
                                    }
                                    if (obj.Abril.ToString() != "0")
                                    {
                                        result_query.Add("Abril");
                                    }
                                    if (obj.Mayo.ToString() != "0")
                                    {
                                        result_query.Add("Mayo");
                                    }
                                    if (obj.Junio.ToString() != "0")
                                    {
                                        result_query.Add("Junio");
                                    }
                                    if (obj.Julio.ToString() != "0")
                                    {
                                        result_query.Add("Julio");
                                    }
                                    if (obj.Agosto.ToString() != "0")
                                    {
                                        result_query.Add("Agosto");
                                    }
                                    if (obj.Septiembre.ToString() != "0")
                                    {
                                        result_query.Add("Septiembre");
                                    }
                                    if (obj.Octubre.ToString() != "0")
                                    {
                                        result_query.Add("Octubre");
                                    }
                                    if (obj.Noviembre.ToString() != "0")
                                    {
                                        result_query.Add("Noviembre");
                                    }
                                    if (obj.Diciembre.ToString() != "0")
                                    {
                                        result_query.Add("Diciembre");
                                    }
                             }
                            json = JsonConvert.SerializeObject(result_query);
                            break;
                   case "marzo":
                             var lst2 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                 Abril = s.abril,
                                 Mayo = s.mayo,
                                 Junio = s.junio,
                                 Julio = s.julio,
                                 Agosto = s.agosto,
                                 Septiembre = s.septiembre,
                                 Octubre = s.octubre,
                                 Noviembre = s.noviembre,
                                 Diciembre = s.diciembre
                             };
                            List<string> result_query2 = new List<string>();
                            foreach (var obj in lst2)
                            {
                                if (obj.Abril.ToString() != "0")
                                {
                                    result_query2.Add("Abril");
                                }
                                if (obj.Mayo.ToString() != "0")
                                {
                                    result_query2.Add("Mayo");
                                }
                                if (obj.Junio.ToString() != "0")
                                {
                                    result_query2.Add("Junio");
                                }
                                if (obj.Julio.ToString() != "0")
                                {
                                    result_query2.Add("Julio");
                                }
                                if (obj.Agosto.ToString() != "0")
                                {
                                    result_query2.Add("Agosto");
                                }
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query2.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query2.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query2.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query2.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query2);
                            break;
                   case "abril":
                             var lst3 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                 Mayo = s.mayo,
                                 Junio = s.junio,
                                 Julio = s.julio,
                                 Agosto = s.agosto,
                                 Septiembre = s.septiembre,
                                 Octubre = s.octubre,
                                 Noviembre = s.noviembre,
                                 Diciembre = s.diciembre
                             };
                            List<string> result_query3 = new List<string>();
                            foreach (var obj in lst3)
                            {
                               if (obj.Mayo.ToString() != "0")
                                {
                                    result_query3.Add("Mayo");
                                }
                                if (obj.Junio.ToString() != "0")
                                {
                                    result_query3.Add("Junio");
                                }
                                if (obj.Julio.ToString() != "0")
                                {
                                    result_query3.Add("Julio");
                                }
                                if (obj.Agosto.ToString() != "0")
                                {
                                    result_query3.Add("Agosto");
                                }
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query3.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query3.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query3.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query3.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query3);
                            break;
                   case "mayo":
                              var lst4 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                  Junio = s.junio,
                                  Julio = s.julio,
                                  Agosto = s.agosto,
                                  Septiembre = s.septiembre,
                                  Octubre = s.octubre,
                                  Noviembre = s.noviembre,
                                  Diciembre = s.diciembre
                              };
                            List<string> result_query4 = new List<string>();
                            foreach (var obj in lst4)
                            {
                               if (obj.Junio.ToString() != "0")
                                {
                                    result_query4.Add("Junio");
                                }
                                if (obj.Julio.ToString() != "0")
                                {
                                    result_query4.Add("Julio");
                                }
                                if (obj.Agosto.ToString() != "0")
                                {
                                    result_query4.Add("Agosto");
                                }
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query4.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query4.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query4.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query4.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query4);
                            break;
                   case "junio":
                             var lst5 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                 Julio = s.julio,
                                 Agosto = s.agosto,
                                 Septiembre = s.septiembre,
                                 Octubre = s.octubre,
                                 Noviembre = s.noviembre,
                                 Diciembre = s.diciembre
                             };
                            List<string> result_query5 = new List<string>();
                            foreach (var obj in lst5)
                            {
                               if (obj.Julio.ToString() != "0")
                                {
                                    result_query5.Add("Julio");
                                }
                                if (obj.Agosto.ToString() != "0")
                                {
                                    result_query5.Add("Agosto");
                                }
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query5.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query5.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query5.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query5.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query5);
                            break;
                   case "julio":
                          var  lst6 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                              Agosto = s.agosto,
                              Septiembre = s.septiembre,
                              Octubre = s.octubre,
                              Noviembre = s.noviembre,
                              Diciembre = s.diciembre
                          };

                            List<string> result_query6 = new List<string>();
                            foreach (var obj in lst6)
                            {
                                if (obj.Agosto.ToString() != "0")
                                {
                                    result_query6.Add("Agosto");
                                }
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query6.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query6.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query6.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query6.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query6);
                       break;
                   case "agosto":
                             var lst7 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                 Septiembre = s.septiembre,
                                 Octubre = s.octubre,
                                 Noviembre = s.noviembre,
                                 Diciembre = s.diciembre
                             };
                             List<string> result_query7 = new List<string>();
                            foreach (var obj in lst7)
                            {
                                if (obj.Septiembre.ToString() != "0")
                                {
                                    result_query7.Add("Septiembre");
                                }
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query7.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query7.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query7.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query7);
                       break;
                   case "septiembre":
                            var lst8 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                Octubre = s.octubre,
                                Noviembre = s.noviembre,
                                Diciembre = s.diciembre
                            };

                              List<string> result_query8 = new List<string>();
                            foreach (var obj in lst8)
                            {
                                if (obj.Octubre.ToString() != "0")
                                {
                                    result_query8.Add("Octubre");
                                }
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query8.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query8.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query8);
                       break;
                   case "octubre":
                            var lst9 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {

                                Noviembre = s.noviembre,
                                Diciembre = s.diciembre
                            };
                            List<string> result_query9 = new List<string>();
                            foreach (var obj in lst9)
                            {                               
                                if (obj.Noviembre.ToString() != "0")
                                {
                                    result_query9.Add("Noviembre");
                                }
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query9.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query9);
                    break;
                   case "noviembre":
                            var lst10 = from s in db.INPC where s.Id == id_periodo_select_anio select new
                             {
                                Diciembre = s.diciembre
                            };
                            List<string> result_query10 = new List<string>();
                            foreach (var obj in lst10)
                            {                             
                                
                                if (obj.Diciembre.ToString() != "0")
                                {
                                    result_query10.Add("Diciembre");
                                }
                            }
                            json = JsonConvert.SerializeObject(result_query10);
                       break;
                   case "diciembre":
                        List<string> result_query11 = new List<string>();
                        result_query11.Add("No es posible");
                        json = JsonConvert.SerializeObject(result_query11);
                    break;
                   default:
                       Console.WriteLine("Caso por default");
                       break;
               }
        }
        else
        {

            var Result = from s in db.INPC
                         where s.Id == id_periodo_select_anio2
                         select new
                         {
                             Enero = s.enero,
                             Febrero = s.febrero,
                             Marzo = s.marzo,
                             Abril = s.abril,
                             Mayo = s.mayo,
                             Junio = s.junio,
                             Julio = s.julio,
                             Agosto = s.agosto,
                             Septiembre = s.septiembre,
                             Octubre = s.octubre,
                             Noviembre = s.noviembre,
                             Diciembre = s.diciembre

                         };
            List<string> R1 = new List<string>();
            foreach (var obj in Result)
            {
                if (obj.Enero.ToString() != "0")
                {
                    R1.Add("Enero");
                }
                if (obj.Febrero.ToString() != "0")
                {
                    R1.Add("Febrero");
                }
                if (obj.Marzo.ToString() != "0")
                {
                    R1.Add("Marzo");
                }
                if (obj.Abril.ToString() != "0")
                {
                    R1.Add("Abril");
                }
                if (obj.Mayo.ToString() != "0")
                {
                    R1.Add("Mayo");
                }
                if (obj.Junio.ToString() != "0")
                {
                    R1.Add("Junio");
                }
                if (obj.Julio.ToString() != "0")
                {
                    R1.Add("Julio");
                }
                if (obj.Agosto.ToString() != "0")
                {
                    R1.Add("Agosto");
                }
                if (obj.Septiembre.ToString() != "0")
                {
                    R1.Add("Septiembre");
                }
                if (obj.Octubre.ToString() != "0")
                {
                    R1.Add("Octubre");
                }
                if (obj.Noviembre.ToString() != "0")
                {
                    R1.Add("Noviembre");
                }
                if (obj.Diciembre.ToString() != "0")
                {
                    R1.Add("Diciembre");
                }
            }

            json = JsonConvert.SerializeObject(R1);
        }   
        return json;
    }

    [WebMethod]
    public static object calcular_inflacion(string id_inpc_inicial, string id_inpc_inicial_mes, string id_inpc_final, string id_inpc_final_mes)
    {
        var json = "";
        var db = new Entidades();
        List<string> R1 = new List<string>();

        var Result = from s in db.INPC
                     where s.Id == id_inpc_inicial
                     select new
                     {
                         Enero = s.enero,
                         Febrero = s.febrero,
                         Marzo = s.marzo,
                         Abril = s.abril,
                         Mayo = s.mayo,
                         Junio = s.junio,
                         Julio = s.julio,
                         Agosto = s.agosto,
                         Septiembre = s.septiembre,
                         Octubre = s.octubre,
                         Noviembre = s.noviembre,
                         Diciembre = s.diciembre,
                         Anio=s.anio

                     }; 
        
        double inpcinicial=0;
        int anio_inicial = 0;
        
        foreach (var obj in Result)
        {
            anio_inicial = (int)obj.Anio;
            R1.Add(anio_inicial.ToString());
            switch (id_inpc_inicial_mes) 
            {
                case "enero":
                    inpcinicial = (double) obj.Enero;
                    R1.Add("Enero");
                    break;
                case "febrero":
                    inpcinicial = (double) obj.Febrero;
                    R1.Add("Febrero");
                    break;
                case "marzo":
                    inpcinicial = (double)obj.Marzo;
                    R1.Add("Marzo");
                    break;
                case "abril":
                    inpcinicial = (double)obj.Abril;
                    R1.Add("Abril");
                    break;
                case "mayo":
                    inpcinicial = (double)obj.Mayo;
                    R1.Add("Mayo");
                    break;
                case "junio":
                    inpcinicial = (double)obj.Junio;
                    R1.Add("Junio");
                    break;
                case "julio":
                    inpcinicial = (double)obj.Julio;
                    R1.Add("Julio");
                    break;
                case "agosto":
                    inpcinicial = (double)obj.Agosto;
                    R1.Add("Agosto");
                    break;
                case "septiembre":
                    inpcinicial = (double)obj.Septiembre;
                    R1.Add("Septiembre");
                    break;
                case "octubre":
                    inpcinicial = (double)obj.Octubre;
                    R1.Add("Octubre");
                    break;
                case "noviembre":
                    inpcinicial = (double)obj.Noviembre;
                    R1.Add("Noviembre");
                    break;
                case "diciembre":
                    inpcinicial = (double)obj.Diciembre;
                    R1.Add("Diciembre");
                    break;
            }
            
        }

        var Result2 = from s in db.INPC
                      where s.Id == id_inpc_final
                      select new
                      {
                          Enero = s.enero,
                          Febrero = s.febrero,
                          Marzo = s.marzo,
                          Abril = s.abril,
                          Mayo = s.mayo,
                          Junio = s.junio,
                          Julio = s.julio,
                          Agosto = s.agosto,
                          Septiembre = s.septiembre,
                          Octubre = s.octubre,
                          Noviembre = s.noviembre,
                          Diciembre = s.diciembre,
                          Anio = s.anio
                      };
        double inpcfinal=0;
        int anio_final = 0;
        foreach (var obj in Result2)
        {
            anio_final = (int)obj.Anio;
            R1.Add(anio_final.ToString());
            switch (id_inpc_final_mes)
            {
                case "enero":
                    inpcfinal = (double)obj.Enero;
                    R1.Add("Enero");
                    break;
                case "febrero":
                    inpcfinal = (double)obj.Febrero;
                    R1.Add("Febrero");
                    break;
                case "marzo":
                    inpcfinal = (double)obj.Marzo;
                    R1.Add("Marzo");
                    break;
                case "abril":
                    inpcfinal = (double)obj.Abril;
                    R1.Add("Abril");
                    break;
                case "mayo":
                    inpcfinal = (double)obj.Mayo;
                    R1.Add("Mayo");
                    break;
                case "junio":
                    inpcfinal = (double)obj.Junio;
                    R1.Add("Junio");
                    break;
                case "julio":
                    inpcfinal = (double)obj.Julio;
                    R1.Add("Julio");
                    break;
                case "agosto":
                    inpcfinal = (double)obj.Agosto;
                    R1.Add("Agosto");
                    break;
                case "septiembre":
                    inpcfinal = (double)obj.Septiembre;
                    R1.Add("Septiembre");
                    break;
                case "octubre":
                    inpcfinal = (double)obj.Octubre;
                    R1.Add("Noviembre");
                    break;
                case "noviembre":
                    inpcfinal = (double)obj.Noviembre;
                    R1.Add("Noviembre");
                    break;
                case "diciembre":
                    inpcfinal  = (double)obj.Diciembre;
                    R1.Add("Diciembre");
                    break;
            }
        }

        double TasaInfla = (((inpcfinal - inpcinicial) / inpcinicial) * 100);
        R1.Add(TasaInfla.ToString()); //RESULTADOS DE LA CALCULADORA
        json = JsonConvert.SerializeObject(R1);
        return json;
    }

    /***************/

    [WebMethod]
    public static string cargar_proyectos()
    {
        var db = new Entidades();   
        var httpContext = HttpContext.Current;
        /***Get the user id**/
        string id_user = httpContext.User.Identity.GetUserId();
        var consulta = db.Proyecto.Where(Proyect => Proyect.ID_Usuario == id_user);//consulta los proyectos del usuario

        List<string> item = new List<string>();
        foreach (Proyecto Proyect in consulta)
        {
            string option;
            option = "<option value='" + Proyect.ID_Proyecto + "'>" + Proyect.Nombre_Proyecto + "</option>";
            if (System.Web.HttpContext.Current.Session["ID_Proyecto"] != null)
            {
                string idProyecto = (string)System.Web.HttpContext.Current.Session["ID_Proyecto"];
                if (idProyecto == Proyect.ID_Proyecto)
                {
                    option = "<option selected value='" + Proyect.ID_Proyecto + "'>" + Proyect.Nombre_Proyecto + "</option>";
                }
            }

            item.Add(option);
            
                
        }
        var json = JsonConvert.SerializeObject(item);
        return json;
    }


}