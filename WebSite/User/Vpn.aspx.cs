using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Click += new EventHandler(this.GreetingBtn_Click);
        theDiv.Visible = false;

    }
   

    void GreetingBtn_Click(Object sender, EventArgs e)
    {
        double ResultadoVPN;
        double fTMAR = Convert.ToSingle(TMAR.Text);
        int Periodo= Convert.ToInt32(n.Text);
        int i;
        double[] X = new double[1001];
        double[] Y = new double[1001];

        ResultadoVPN = CalcularVPN(fTMAR/100);
        VPN.Text = Convert.ToString(Math.Round(ResultadoVPN,2));

        /*
        Codigo para generar arreglos con valores para X y Y
        X guarda TMAR de 0 a 1 en incrementos de 0.001
        Y guarda los valores de VPN 
        */
        fTMAR = 0;

        for (i = 0; i <= 1000; i++)
        {
            X[i] = fTMAR;
            Y[i] = CalcularVPN(fTMAR);
            fTMAR = Math.Round(fTMAR+0.001, 5);
        }

        theDiv.Visible = true;
       
    }
    
   

    double CalcularVPN(double fTMAR)
    {
        double P = Convert.ToSingle(Inversion.Text);
        double fFNE = Convert.ToSingle(FNE.Text);
        double fVS = Convert.ToSingle(VdS.Text);
        double FNEAcumulado, fVPN;
        int Periodo = Convert.ToInt32(n.Text);
        int i;

        FNEAcumulado = 0;
        double DivTMAR = 1 + fTMAR;
        for (i = 1; i < Periodo; i++)
        {
            FNEAcumulado = FNEAcumulado + (fFNE / Math.Pow(DivTMAR, i));
        }
        FNEAcumulado = FNEAcumulado + ((fFNE + fVS) / Math.Pow(DivTMAR, i));
        fVPN = FNEAcumulado - P;

        return fVPN;
    }




}