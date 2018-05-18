using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class User_Vpn : System.Web.UI.Page
{

    int finasincrono=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        Button1.Click += new EventHandler(this.GreetingBtn_Click);
        Inversion.TextChanged += new EventHandler(this.EventoInversion); //
        theDiv.Visible = false;
        efecto.Visible = false;        
    }

    private async void GreetingBtn_Click(Object sender, EventArgs e)
    {
        
                       await ProcesoAsincrono0(); //Tratando de mostrar efecto visual
        finasincrono = await ProcesoAsincrono();
        if (finasincrono==1) // Ocualtar efecto visual "Desactivado"
        {
           // efecto.Visible = false;
        }        
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
        Single ResultadoVPN;
        String timeC;
        String repArrayC;
        String PeriodoSelect = JsonConvert.SerializeObject(Select.Value);
        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        Single fTMAR = Convert.ToSingle(TMAR.Text);
        int Periodo = Convert.ToInt32(n.Text);
        int negativos;
        Single num;

        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();

        ResultadoVPN = CalcularVPN(fTMAR / 100);

        if (ResultadoVPN > 0)
        {
            VPN.Text = "$ " + Convert.ToString(Math.Round(ResultadoVPN, 2)) + "   Se recomienda aceptar la inversión";

            /* Calculo de la TIR */
            TIR.Text = Convert.ToString((CalcularTIR(fTMAR / 100)) * 100) + " %";
        }
        else
        {
            VPN.Text = "$ " + Convert.ToString(Math.Round(ResultadoVPN, 2)) + "   Se recomienda rechazar la inversión";
            TIR.Text = "No aplicable";
        }

        fTMAR = 0;

        do
        {
            ListaX.Add(Math.Round(fTMAR * 100, 2));
            ListaY.Add(Math.Round(CalcularVPN(fTMAR), 2));
            negativos = 0;
            foreach (var item in ListaY)
            {
                num = Convert.ToSingle(item);
                if (num < 0)
                {
                    negativos++;
                }
            }
            fTMAR = Convert.ToSingle(Math.Round(fTMAR + 0.02, 4));

        } while (negativos < 10);
        // pasamos las variabes en formato array json
        timeC = JsonConvert.SerializeObject(ListaX);
        repArrayC = JsonConvert.SerializeObject(ListaY);

        //llamamos la función pasaando los parametros
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Graficar(" + timeC + ", " + repArrayC + "," + PeriodoSelect + ");", true);

        return 1;
    }

    Single CalcularVPN(Single fTMAR)
    {
        Single P = Convert.ToSingle(Inversion.Text);
        Single fFNE = Convert.ToSingle(FNE.Text);
        Single fVS = Convert.ToSingle(VdS.Text);
        Single FNEAcumulado, fVPN;
        int Periodo = Convert.ToInt32(n.Text);
        int i;

        FNEAcumulado = 0;
        Single DivTMAR = 1 + fTMAR;
        for (i = 1; i < Periodo; i++)
        {
            FNEAcumulado = FNEAcumulado + (fFNE / Convert.ToSingle(Math.Pow(DivTMAR, i)));
        }
        FNEAcumulado = FNEAcumulado + ((fFNE + fVS) / Convert.ToSingle(Math.Pow(DivTMAR, i)));
        fVPN = FNEAcumulado - P;

        return fVPN;
    }

    Single CalcularTIR(Single ValorTIR)
    {
        Single TasaIncDec;
        Single Resultado;
        Boolean MenosCero = false;
        TasaIncDec = 0.01F;
        ValorTIR = ValorTIR + TasaIncDec;

        do
        {
            Resultado = CalcularVPN(ValorTIR);

            if (MenosCero == true)
                TasaIncDec = TasaIncDec / 2;
            if (Resultado > 0)
                ValorTIR = ValorTIR + TasaIncDec;
            else
            {
                ValorTIR = ValorTIR - TasaIncDec;
                MenosCero = true;
            }
        } while (Math.Abs(Resultado) >= 0.01);

        return ValorTIR;
    }

    private void EventoInversion(Object sender, EventArgs e)
    {
         System.Diagnostics.Debug.WriteLine("ALGO PASA ");

    }

    

}

