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
    public static int getPeriodo(string idProyecto) {
        var nperiodo = 5;
        System.Diagnostics.Debug.WriteLine(nperiodo);
        return nperiodo;

    }

    /*[WebMethod]
    public static int llenarSelect(int nperiodo)
    {

        return nperiodo;

    }*/
}