using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_tasainflacion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Resultados.Visible = false;
    }

    protected void Btn_ClickInflacion(Object sender, EventArgs e)
    {
        Resultados.Visible = true;
    }
}