using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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




    //[System.Web.Services.WebMethod]

    /*public static string sendTable2(string dataTable)
    {
        System.Diagnostics.Debug.WriteLine("datos-->" + dataTable);
        return "datos " + dataTable;
        
    }*/

    /*[System.Web.Services.WebMethod]
    public void sendTable(string[] ids)
    {
        String[] a = ids;
        System.Diagnostics.Debug.WriteLine("datos-->" + a);

        Response.Write("<script>alert('"++"');</script>");
        // Do whatever processing you want
        // However, you cannot access server controls
        // in a static web method.
    }*/

    /* [WebMethod]
     public  void sendTable(string[] ids)
     {

         System.Diagnostics.Debug.WriteLine("datos-->" + ids);

         Response.Write("<script>alert('"+ ids + "');</script>");
     }*/

    [WebMethod]
    public static string Subscribe(string name, string email)
    {
        //Insert it to our database
        return "thanks " + name + ", your email " + email + " is subscribed to our newsletter.";
    }




    /* protected void add_row_Click(Object sender, EventArgs e)
     {

     }*/
}