using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Simulador_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_ClickVANC(Object sender, EventArgs e)
    {

        CreacionTabla();
    }

    public void CreacionTabla()
    {
        String PeriodoSelect = select.SelectedItem.ToString();
        

        int Periodo = Convert.ToInt32(n.Text);
        String[,] ArregloDatos = new String[Periodo + 1, 7];

        for (int j = 0; j <= Periodo; j++)
        {
            ArregloDatos[j, 0] = Convert.ToString(j + 1);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 1] = PeriodoSelect + " " + Convert.ToString(j);
        }

        String MatrizFinal = JsonConvert.SerializeObject(ArregloDatos);
        String comando = "InicializarTabla(" + MatrizFinal + ")";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", comando, true);
    }
     
}