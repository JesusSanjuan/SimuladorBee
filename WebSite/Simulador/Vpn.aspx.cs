using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class User_Vpn : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {       
        Button1.Click += new EventHandler(this.GreetingBtn_Click);
        Inversion.TextChanged += new EventHandler(this.EventoInversion);
        theDiv.Visible = false;
        efecto.Visible = false;
    }

    private async void GreetingBtn_Click(Object sender, EventArgs e)
    {
        
              await ProcesoAsincrono0();
        int x=await ProcesoAsincrono();
                          
        
       //System.Diagnostics.Debug.WriteLine("Valor de x:  "+x);  //System.Threading.Thread.Sleep(10000);
       
    }

     async System.Threading.Tasks.Task<int> ProcesoAsincrono ()
    {
        int retorno = 0;
        await System.Threading.Tasks.Task.Run(() =>
                {
                    retorno =  CalculoVPN();
                    System.Diagnostics.Debug.WriteLine("EJECUTANDO PROCESO ASINCRONO 2");
                }            
            );
        return retorno;

    }


    async System.Threading.Tasks.Task ProcesoAsincrono0()
    {
       
        await System.Threading.Tasks.Task.Run(() =>
        {
            theDiv.Visible = true;
            efecto.Visible = true;
            System.Diagnostics.Debug.WriteLine("EJECUTANDO PROCESO ASINCRONO 1");
        }
        );

    }

    public int CalculoVPN()
    {
        double ResultadoVPN;
        String timeC;
        String repArrayC;
        String PeriodoSelect = JsonConvert.SerializeObject(Select.Value);
        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        double fTMAR = Convert.ToSingle(TMAR.Text);
        int Periodo = Convert.ToInt32(n.Text);
        int i, negativos, cantidad_datos = 50;
        double[] X = new double[cantidad_datos + 1];
        double[] Y = new double[cantidad_datos + 1];


        ResultadoVPN = CalcularVPN(fTMAR / 100);
        VPN.Text = Convert.ToString(Math.Round(ResultadoVPN, 2));

        /*
        Codigo para generar arreglos con valores para X y Y
        X guarda TMAR de 0 a 1 en incrementos de 0.001
        Y guarda los valores de VPN 
        */
        fTMAR = 0;
        negativos = 0;
        for (i = 0; i <= cantidad_datos; i++)
        {
            X[i] = Math.Round(fTMAR * 100, 2);
            Y[i] = Math.Round(CalcularVPN(fTMAR), 2);
            if (Y[i] < 0) negativos++;
            if (negativos == 10) break;
            fTMAR = Math.Round(fTMAR + 0.02, 4);
        }
        // pasamos las variabes en formato array json
        timeC = JsonConvert.SerializeObject(X);
        repArrayC = JsonConvert.SerializeObject(Y);

        //llamamos la función pasaando los parametros
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Graficar(" + timeC + ", " + repArrayC + "," + PeriodoSelect + ");", true);

        return 1;

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

    private void EventoInversion(Object sender, EventArgs e)
    {
         System.Diagnostics.Debug.WriteLine("ALGO PASA ");


    }

}

