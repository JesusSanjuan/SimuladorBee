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

        var consulta1 = db.indice_INPC.OrderByDescending(indice =>indice.Id_indice );

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
            //var query = db.INPC.Where(Inpc => Inpc.id_indice == id_indice_base);
            // var queryPrueba = db.INPC.Where(Inpc => Inpc.id_indice == id_indice_base).Select(t => new { t.Id, t.anio });
            // Tengo que hacer una consulta con el id de la base seleccionada y obtener todos los id de los años de esa base seleccionada, de ahi de cada id obtener los meses
            var json ="";
            if (queryMax!= null && queryMin!=null)
            {    
                    string[] meses = new string[] { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre" };
                    int anio_MAX= (int)queryMax.anio;
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
                                string mesMax= meses[11];
                                for(int i=1; i<=result_query.Count;i++)
                                {
                                    if(anio_MAX == anio_MIN)
                                    {
                                        if (result_query[i-1] != 0)
                                        {
                                            mesMax = meses[i-1];
                                        }
                                    }
                                    else
                                    { 
                                       if (result_query[0]==0)
                                        {
                                            anio_MAX=anio_MAX - 1;
                                            mesMax = meses[11];
                                            break;
                                        }
                                        if(result_query[i]==0)
                                        {
                                            mesMax=meses[i - 1];
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
                                string mesMin="";
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
                                if(cuentameses==0)
                                {
                                    mesMin = meses[0];
                                }
                                else
                                {
                                    if(cuentameses!=12)
                                    { 
                                        mesMin = meses[posicion+1];
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



}