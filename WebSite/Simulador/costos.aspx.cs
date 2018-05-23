using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_costos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Continuar.Click += new EventHandler(this.Continuar_Click);
    }

    public void Continuar_Click(Object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Prueba");
        string scrip = @"<script type='text/javascript'>
                                 $(document).ready(function () {
                                 $('#Continuacioncostos').modal({ show: true }); });
                            </script>";
        ScriptManager.RegisterStartupScript(this.Page, typeof(Page), "script", scrip, false);
    }
}