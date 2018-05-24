using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Simulador_costos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Click += new EventHandler(this.GreetingBtn_Click);
    }

    protected void GreetingBtn_Click(Object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Prueba");
        string script = @"<script type='text/javascript'>
                                 $(document).ready(function(){
                                        alert();
                            });
                            </script>";
        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion2", script, false);
    }
}