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
    public static string MiCalculo(decimal inversion, decimal[] FNE, int[] Anio, decimal VdS, decimal TMAR, int Select, int n)
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

        decimal[] valores = new decimal[Anio.Length];
        for (int a=1;a<=Anio.Length;a++)
        {
            for (int b = 0; b < Anio.Length; b++)
            {
                if(a==Anio[b])
                {
                    valores[a-1] = FNE[b];
                    break;
                }
            }
        }
        FNE = valores;
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

    [WebMethod]
    public static string CreacionTabla(decimal inversion, decimal[] Costos, decimal[] Ingresos, decimal[] FNE, int[] AnioV, decimal VdS, decimal TMAR, int Select, int n)
    {
        System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();
        System.Collections.ArrayList PeridoRec = new System.Collections.ArrayList();
        System.Collections.ArrayList PeridoRecP2 = new System.Collections.ArrayList();
        System.Collections.ArrayList BenCosto = new System.Collections.ArrayList();

        decimal[] valores = new decimal[AnioV.Length];
        decimal[] valores1 = new decimal[AnioV.Length];
        decimal[] valores2 = new decimal[AnioV.Length];

        for (int a = 1; a <= AnioV.Length; a++)
        {
            for (int b = 0; b < AnioV.Length; b++)
            {
                if (a == AnioV[b])
                {
                    valores[a - 1] = Costos[b];
                    valores1[a - 1] = Ingresos[b];
                    valores2[a - 1] = FNE[b];
                    break;
                }
            }
        }
        Costos = valores;
        Ingresos = valores1;
        FNE = valores2;

        String PeriodoSelect;
        String PeridoRec2 = "";
        String PeridoRec3 = "";
        if (1 == Select)
        {
            PeriodoSelect = "Mes";
        }
        else
        {
            PeriodoSelect = "Año";
        }

        TMAR = TMAR / 100;
        int Periodo = n;
        String[,] ArregloDatos = new String[Periodo + 1, 8];
        ArregloDatos[0, 3] = ArregloDatos[0, 4] = ArregloDatos[0, 5] = "";
        ArregloDatos[0, 2] = "-" + inversion.ToString();
        ArregloDatos[0, 7] = "-" + inversion.ToString();
        for (int j = 0; j <= Periodo; j++)
        {
            ArregloDatos[j, 0] = Convert.ToString(j + 1);
        }
        for (int j = 0; j <= Periodo; j++)
        {
            ArregloDatos[j, 1] = PeriodoSelect + " " + Convert.ToString(j);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 2] = Convert.ToString(Costos[j-1]);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 3] = Convert.ToString(Ingresos[j - 1]);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 4] = FNE[j-1].ToString();
        }
        for (int j = 1; j <= Periodo; j++)
        {
                decimal IngresoActual = (Convert.ToDecimal(ArregloDatos[j, 3])) / Convert.ToDecimal(Math.Pow((double)(1 + TMAR), j));
                ArregloDatos[j, 5] = Convert.ToString(Math.Round(IngresoActual, 3));
        }

        /*Calculo de periodo de recuperacion en funcion del ingreso actualizado en tabla*/
        for (int i = 1; i <= Periodo; i++)
        {
            decimal x = Convert.ToDecimal(ArregloDatos[i - 1, 7]);
            decimal ingresactualiza = Convert.ToDecimal(ArregloDatos[i, 5]);
            ArregloDatos[i, 7] = Convert.ToString(x + ingresactualiza);
        }
        /*Calculo de periodo de recuperacion en funcion del ingreso actualizado en tabla*/

        /*Calculo de periodo de recuperacion en tabla*/
        ArregloDatos[0, 6] = ArregloDatos[0, 2];
        for (int i = 1; i <= Periodo; i++)
        {
            decimal x = Convert.ToDecimal(ArregloDatos[i - 1, 6]);
            decimal Flujoneto = Convert.ToDecimal(ArregloDatos[i, 4]);
            ArregloDatos[i, 6] = Convert.ToString(x + Flujoneto);
        }
        ListaFinal.Add(ArregloDatos);
        /*Calculo de periodo de recuperacion en tabla*/

        /*Calculo de periodo de recuperacion*/
        decimal P = inversion;
        for (int i = 1; i <= Periodo; i++)
        {
            decimal x1 = Convert.ToDecimal(ArregloDatos[i, 6]);
            if (x1 >= 0)
            {
                decimal x2 = Convert.ToDecimal(ArregloDatos[i - 1, 6]);
                if (x2 < 0)
                {
                    decimal Anio = Convert.ToDecimal(ArregloDatos[i - 1, 0]);
                    if (PeriodoSelect == "Mes")
                    {
                        decimal T1 = Math.Round(((P / ((x2 * -1M) + x1)) + (Anio - 1)), 3);

                        if (T1 > 1)
                        {
                            double valorConDecimal = (double)T1;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec2 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + "es con " + decimales + " dia(s)" ;
                        }
                        else
                        {
                            double valorConDecimal = (double)T1;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec2 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + " " + decimales + " dia(s)";
                        }
                    }
                    else
                    {
                        decimal T2 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);
                        if (T2 > 1)
                        {      
                            double valorConDecimal = (double)T2;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal)*12,1);
                            PeridoRec2 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + "s con " + decimales + " mes(es)";
                        }
                        else
                        {
                            double valorConDecimal = (double)T2;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec2 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + " " + decimales + " mes(es)";
                        }
                    }
                    break;
                }
            }
            else
            {
                PeridoRec2 = "No es posible calcular";
            }
        }

        PeridoRec.Add(PeridoRec2);
        ListaFinal.Add(PeridoRec);

        for (int i = 1; i <= Periodo; i++)
        {
            decimal x1 = Convert.ToDecimal(ArregloDatos[i, 7]);
            if (x1 >= 0)
            {
                decimal x2 = Convert.ToDecimal(ArregloDatos[i - 1, 7]);
                if (x2 < 0)
                {
                    decimal Anio = Convert.ToDecimal(ArregloDatos[i - 1, 0]);
                    if (PeriodoSelect == "Mes")
                    {
                        decimal T1 = Math.Round(((P / ((x2 * -1M) + x1)) + (Anio - 1)), 3);

                        if (T1 > 1)
                        {
                            double valorConDecimal = (double)T1;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec3 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + "es con " + decimales + " dia(s)";
                        }
                        else
                        {
                            double valorConDecimal = (double)T1;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec3 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + " " + decimales + " dia(s)";
                        }
                    }
                    else
                    {
                        decimal T2 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);
                        if (T2 > 1)
                        {
                            double valorConDecimal = (double)T2;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec3 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + "s con " + decimales + " mes(es)";
                        }
                        else
                        {
                            double valorConDecimal = (double)T2;
                            long valorSinDecimal = (long)valorConDecimal;
                            double decimales = Math.Round((valorConDecimal - (double)valorSinDecimal) * 12, 1);
                            PeridoRec3 = Convert.ToString(valorSinDecimal) + " " + PeriodoSelect + " " + decimales + " mes(es)";
                        }
                    }
                    break;
                }
            }
            else
            {
                PeridoRec3 = "No es posible calcular";
            }
        }
        PeridoRecP2.Add(PeridoRec3);
        ListaFinal.Add(PeridoRecP2);
        /*Calculo de periodo de recuperacion*/

        /*Calculo de beneficio-costo*/
        decimal SumIngresos_actualizados = 0;
        for (int i = 1; i <= Periodo; i++)
        {
            SumIngresos_actualizados = SumIngresos_actualizados + Convert.ToDecimal(ArregloDatos[i, 5]);
        }

        decimal Sum_costos = 0;
        for (int i = 1; i <= Periodo; i++)
        {
            Sum_costos = Sum_costos + Convert.ToDecimal(ArregloDatos[i, 2]);
        }
        Sum_costos = Sum_costos + inversion;
        decimal CRBC = SumIngresos_actualizados / Sum_costos;
        BenCosto.Add("Por cada peso invertido usted obtendra una ganancia de: $" + Convert.ToString(Math.Round(CRBC, 3)));
        ListaFinal.Add(BenCosto);
        /*Calculo de beneficio-costo*/
        String json = JsonConvert.SerializeObject(ListaFinal);
        return json;
    }
}