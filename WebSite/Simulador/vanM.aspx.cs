using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.Services;
using Newtonsoft.Json;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_vanM : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static string MiCalculo(decimal inversion, decimal[] FNE, decimal VdS, decimal TMAR, int Select, int n)
    {
        int negativos, Periodo = n;
        decimal num;
        System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoVPNArray = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoVAN = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoTIR = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();
        System.Collections.ArrayList PeriodoSelect = new System.Collections.ArrayList();
        decimal ResultadoVPN, RCalcuTIR;

        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        ResultadoVPN = CalcularVPN(inversion, FNE, VdS, TMAR / 100, n);
        ResultadoVPNArray.Add(ResultadoVPN);
        ListaFinal.Add(ResultadoVPNArray);
        if (ResultadoVPN > 0)
        {
            ResultadoVAN.Add("$" + ResultadoVPN.ToString("0,0.0000"));
            RCalcuTIR = CalcularTIR(TMAR / 100, 1, inversion, FNE, VdS, n);
            ResultadoTIR.Add((RCalcuTIR * 100).ToString("0,0.00") + " %");
        }
        else
        {
            ResultadoVAN.Add("$" + ResultadoVPN.ToString("0,0.0000"));
            RCalcuTIR = CalcularTIR(TMAR / 100, 2, inversion, FNE, VdS, n);
            ResultadoTIR.Add((RCalcuTIR * 100).ToString("0,0.00") + " %");
        }
        ListaFinal.Add(ResultadoVAN);
        ListaFinal.Add(ResultadoTIR);

        TMAR = RCalcuTIR * 10;
        decimal TMAR2 = Math.Round(RCalcuTIR * 100, 4);
        int contador = 0;
        int pos = 0;
        do
        {
            ListaX.Add(Math.Round(TMAR, 4));
            ListaY.Add(Math.Round(CalcularVPN(inversion, FNE, VdS, TMAR / 100, n), 4));
            negativos = 0;

            foreach (var item in ListaY)
            {
                num = Convert.ToDecimal(item);
                if (num < 0)
                {
                    negativos++;
                }
            }
            if (TMAR2 == Math.Round(TMAR, 4))
            {
                pos = contador;
            }
            TMAR = TMAR + (RCalcuTIR * 10);// Cantidad de saltos de los puntos en el eje X
            contador++;
        } while (negativos < 5);// Solo 5 numeros negativos despues del cruce con 0 en el eje x

        ListaFinal.Add(ListaX);
        ListaFinal.Add(ListaY);
        if (1 == Select)
        {
            PeriodoSelect.Add("Mes");
        }
        else
        {
            PeriodoSelect.Add("Año");
        }
        ListaFinal.Add(PeriodoSelect);
        ListaFinal.Add(pos);
        String json = JsonConvert.SerializeObject(ListaFinal);
        return json;
    }

    public static decimal CalcularVPN(decimal Inversion, decimal[] FNE, decimal VS, decimal TMAR, int Periodo)
    {
        decimal FNEAcumulado = 0, fVPN = 0;
        int i = 0;
        try
        {
            decimal DivTMAR = 1M + TMAR;
            for (i = 1; i < Periodo; i++)
            {
                decimal valorinferior = (decimal)Math.Pow((double)DivTMAR, i);
                FNEAcumulado = FNEAcumulado + FNE[i-1] / valorinferior;
            }
            decimal valorinferiorF = (decimal)Math.Pow((double)DivTMAR, i);
            FNEAcumulado = FNEAcumulado + ((FNE[i-1] + VS) / valorinferiorF);
            fVPN = FNEAcumulado - Inversion;
        }
        catch (OverflowException e)
        {
            Console.WriteLine("Exception: {0} > {1}.", e, decimal.MaxValue);
        }
        return fVPN;
    }

    public static decimal CalcularTIR(decimal ValorTIR, int caso, decimal inversion, decimal[] FNE, decimal VdS, int n)
    {
        decimal TasaIncDec = 0.01M;
        decimal Resultado;
        Boolean MenosCero = false;
        decimal ValorTIRR = ValorTIR + TasaIncDec;
        switch (caso)
        {
            case 1:
                do
                {
                    Resultado = CalcularVPN(inversion, FNE, VdS, ValorTIRR, n);//Cabie aqui tenia hasta 10
                    if (MenosCero == true)
                    {
                        TasaIncDec = TasaIncDec / 2;
                        MenosCero = false;
                    }
                    if (Resultado > 0)
                    {
                        ValorTIRR = Math.Round(ValorTIRR + TasaIncDec, 10);
                    }
                    else
                    {
                        ValorTIRR = Math.Round(ValorTIRR - TasaIncDec, 10);
                        MenosCero = true;
                    }

                } while (Math.Abs(Resultado) >= 0.01M);
                break;
            case 2:
                do
                {
                    Resultado = CalcularVPN(inversion, FNE, VdS, ValorTIRR, n);
                    if (MenosCero == true)
                    {
                        TasaIncDec = TasaIncDec / 2;
                        MenosCero = false;
                    }
                    if (Resultado > 0)
                    {
                        ValorTIRR = ValorTIRR + TasaIncDec;
                        MenosCero = true;
                    }
                    else
                    {
                        ValorTIRR = ValorTIRR - TasaIncDec;

                    }
                } while (Math.Abs(Resultado) >= 0.01M);
                break;
        }
        Thread.Sleep(450);
        return ValorTIRR;
    }
}