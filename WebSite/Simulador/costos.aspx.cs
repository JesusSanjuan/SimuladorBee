using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

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
                                            $('#myTab li:nth-child(2) a').tab('show')
                          });
                       </script>";
        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion2", script, false);
    }

    [WebMethod]
    public static string sendTable(List<Dictionary<string, string>> dataTabla)
    {
        //Here I want to iterate the  objects 

        int a = dataTabla.Count();

        string json = JsonConvert.SerializeObject(dataTabla);
        System.Diagnostics.Debug.WriteLine(json);

        return json;

    }



    /* protected void add_row_Click(Object sender, EventArgs e)
     {

     }*/
}