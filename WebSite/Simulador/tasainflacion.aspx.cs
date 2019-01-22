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
        // string[] meses = new string[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };

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
                         Julio = s.junio,
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


              /*  switch (id_periodo_select_mes)
                {
                    case "enero":
                        Console.WriteLine("Case 1");
                        break;
                    case "febrero":
                        Console.WriteLine("Case 2");
                        break;
                    case "marzo":
                        Console.WriteLine("Case 2");
                        break;
                    case "abril":
                        Console.WriteLine("Case 2");
                        break;
                    case "mayo":
                        Console.WriteLine("Case 2");
                        break;
                    case "junio":
                        Console.WriteLine("Case 2");
                        break;
                    case "julio":
                        Console.WriteLine("Case 2");
                        break;
                    case "agosto":
                        Console.WriteLine("Case 2");
                        break;
                    case "septiembre":
                        Console.WriteLine("Case 2");
                        break;
                    case "octubre":
                        Console.WriteLine("Case 2");
                        break;
                    case "noviembre":
                        Console.WriteLine("Case 2");
                        break;
                    case "diciembre":
                        Console.WriteLine("Case 2");
                        break;
                    default:
                        Console.WriteLine("Default case");
                        break;
                }
                */




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
}