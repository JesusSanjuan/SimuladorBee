using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class User_van : System.Web.UI.Page
{

   

    protected void Page_Load(object sender, EventArgs e)
    {
        ResultadosVAN.Visible = false;
    }

    protected  void GreetingBtn_Click(Object sender, EventArgs e)
    {
        Single ResultadoVPN;
        //System.Threading.Thread.Sleep(Convert.ToInt32(2000));
        
        ResultadoVPN = CalculoVPN();
        ResultadosVAN.Visible = true;

        var Texto="";
        if (ResultadoVPN > 0)
        {
            Texto="Se recomienda aceptar la inversión";

        }
        else
        {
            Texto = " Se recomienda rechazar la inversión";           
        }
        string script2 = @"<script type='text/javascript'>
                                 $(document).ready(function () {
                                 $('#myModal2').modal({ show: false }); 
                                 $('#modal-text-body').text('" + Texto + "');" +                                 
                                "$('#myModal').modal({ show: true }); }); " +                               
        "</script>";
        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script2, false);     
    }

    public Single CalculoVPN()
    {        
        String timeC;
        String repArrayC;
        String PeriodoSelect = JsonConvert.SerializeObject(Select.Value);
        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        Single fTMAR = Convert.ToSingle(TMAR.Text);
        int Periodo = Convert.ToInt32(n.Text);
        int negativos;
        Single num, ResultadoVPN;

        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();

        ResultadoVPN = CalcularVPN(fTMAR / 100);

        if (ResultadoVPN > 0)
        {
            VAN.Text = "$ " + Convert.ToString(Math.Round(ResultadoVPN, 2));
            /* Calculo de la TIR */
            TIR.Text = Convert.ToString((Math.Round(CalcularTIR(fTMAR / 100),6)) * 100) + " %";
        }
        else
        {
            VAN.Text = "$ " + Convert.ToString(Math.Round(ResultadoVPN, 2));
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

        return ResultadoVPN;
    }

    public Single CalcularVPN(Single fTMAR)
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

    public Single CalcularTIR(Single ValorTIR)
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

    

}

