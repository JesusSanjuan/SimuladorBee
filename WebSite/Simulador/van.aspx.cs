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

public partial class User_van : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    [WebMethod]
    public static string Graficar(decimal inversion, decimal FNE, decimal VdS, decimal TMAR, int Select, int n)
    {
         int negativos, Periodo = n;
         decimal num;
         System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();
         System.Collections.ArrayList ResultadoVPNArray= new System.Collections.ArrayList();
         System.Collections.ArrayList ResultadoVAN = new System.Collections.ArrayList();
         System.Collections.ArrayList ResultadoTIR = new System.Collections.ArrayList();
         System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
         System.Collections.ArrayList ListaY = new System.Collections.ArrayList();
         System.Collections.ArrayList PeriodoSelect = new System.Collections.ArrayList();
         decimal ResultadoVPN, RCalcuTIR;

        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        ResultadoVPN = CalcularVPN( inversion, FNE,VdS, TMAR / 100, n);
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
            ResultadoTIR.Add("No aplicable");
            RCalcuTIR = CalcularTIR(TMAR / 100, 2, inversion, FNE, VdS, n);
         }
        ListaFinal.Add(ResultadoVAN);
        ListaFinal.Add(ResultadoTIR);

        TMAR = RCalcuTIR * 10;
        do
        {
            ListaX.Add(Math.Round(TMAR,4));
            ListaY.Add(Math.Round(CalcularVPN(inversion, FNE, VdS, TMAR/100, n),4));
            negativos = 0;
            foreach (var item in ListaY)
            {
                num = Convert.ToDecimal(item);
                if (num < 0)
                {
                    negativos++;
                }
            }
            TMAR = TMAR + (RCalcuTIR * 10);// Cantidad de saltos de los puntos en el eje X
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
        String json = JsonConvert.SerializeObject(ListaFinal);
        return json;
    }


    public static decimal CalcularVPN(decimal Inversion, decimal FNE, decimal VS, decimal TMAR, int Periodo)
    {                       
        decimal FNEAcumulado = 0, fVPN = 0;
        int i = 0;
        try
        {
            decimal DivTMAR = 1M + TMAR;
            for (i = 1; i < Periodo; i++)
            {
                decimal valorinferior = (decimal) Math.Pow((double)DivTMAR, i);
                FNEAcumulado = FNEAcumulado + FNE /valorinferior;
            }
            decimal valorinferiorF = (decimal)Math.Pow((double)DivTMAR, i);
            FNEAcumulado = FNEAcumulado + ((FNE + VS) / valorinferiorF);
            fVPN = FNEAcumulado - Inversion;
        }
        catch (OverflowException e)
        {
            Console.WriteLine("Exception: {0} > {1}.", e, decimal.MaxValue);
        }
        return fVPN;
    }
    public static decimal CalcularTIR(decimal ValorTIR, int caso, decimal inversion, decimal FNE, decimal VdS,int n)
    {
        decimal TasaIncDec = 0.01M;
        decimal Resultado;
        Boolean MenosCero = false;
        decimal ValorTIRR =ValorTIR + TasaIncDec;
        int iteraciones = 0;
        switch (caso)
        {
            case 1:
                    do
                    {
                        Resultado = Math.Round(CalcularVPN(inversion, FNE, VdS, ValorTIRR, n), 10);
                        if (MenosCero == true)
                        {
                            TasaIncDec = TasaIncDec / 2;
                            MenosCero = false;
                        }
                        if (Resultado > 0)
                        {
                            ValorTIRR = Math.Round(ValorTIRR + TasaIncDec,10);
                        }
                        else
                        {
                            ValorTIRR = Math.Round(ValorTIRR - TasaIncDec,10);
                            MenosCero = true;
                        }
                        iteraciones++;
                       // System.Diagnostics.Debug.WriteLine("Iteracion: "+iteraciones+ " \tResultado condicion: "+Resultado+ " \tTIR: " + ValorTIRR);
                        
                    } while (Math.Abs(Resultado) >= 0.01M);
                    break;
            case 2:
                    do
                    {
                        Resultado = CalcularVPN( inversion, FNE, VdS, ValorTIRR, n);
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
                        iteraciones++;
                       //System.Diagnostics.Debug.WriteLine("Iteracion: " + iteraciones + " Resultado condicion: " + Resultado + " TIR: " + ValorTIRR);
                    } while (Math.Abs(Resultado) >= 0.01M);
                    break;
        }
        Thread.Sleep(450);
        return ValorTIRR;
    }
    [WebMethod]
    public static string CreacionTabla(decimal inversion, decimal FNE, decimal VdS, decimal TMAR, int Select, int n)
    {
        System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();
        System.Collections.ArrayList PeridoRec = new System.Collections.ArrayList(); 
        System.Collections.ArrayList BenCosto = new System.Collections.ArrayList();
        String PeriodoSelect;
        String PeridoRec2="";
        if (1 == Select)
        {
            PeriodoSelect="Mes";
        }
        else
        {
            PeriodoSelect="Año";
        }
        Random r = new Random();
        int Costos = r.Next(200000, 2500000);

        Random r2 = new Random();
        int Ingresos = r2.Next(500000, 2500000);

        int Periodo = n;
        String[,] ArregloDatos = new String[Periodo + 1, 7];
        ArregloDatos[0, 3] = ArregloDatos[0, 4] = ArregloDatos[0, 5] = "";
        /*Cambiar cuado aya valores verdaderos de costos*/
        ArregloDatos[0, 2] = "-" + inversion.ToString();
        /*Cambiar cuado aya valores verdaderos de costos*/
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
            ArregloDatos[j, 2] = Convert.ToString(Costos);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 3] = Convert.ToString(Ingresos);
        }
        for (int j = 1; j <= Periodo; j++)
        {
            ArregloDatos[j, 4] = FNE.ToString();
        }
        for (int j = 1; j <= Periodo; j++)
        {
            for (int i = 1; i <= Periodo; i++)
            {
                decimal IngresoActual = (Convert.ToDecimal(ArregloDatos[i, 3])) / Convert.ToDecimal(Math.Pow(1 + .1, i));
                ArregloDatos[j, 5] = Convert.ToString(Math.Round(IngresoActual, 3));
            }
        }
        ArregloDatos[0, 6] = ArregloDatos[0, 2];
        for (int i = 1; i <= Periodo; i++)
        {
            decimal x = Convert.ToDecimal(ArregloDatos[i - 1, 6]);
            decimal Flujoneto = Convert.ToDecimal(ArregloDatos[i, 4]);
            ArregloDatos[i, 6] = Convert.ToString(x + Flujoneto);
        }
        ListaFinal.Add(ArregloDatos);

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
                            PeridoRec2=Convert.ToString(T1) + " " + PeriodoSelect + "es";
                          }
                          else
                          {
                            PeridoRec2=Convert.ToString(T1) + " " + PeriodoSelect;
                          }

                      }
                      else
                      {
                          decimal T2 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);
                          if (T2 > 1)
                          {
                            PeridoRec2 = Convert.ToString(T2) + " " + PeriodoSelect + "s";
                          }
                          else
                          {
                            PeridoRec2 = Convert.ToString(T2) + " " + PeriodoSelect;
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
          decimal SumIngresos_actualizados = 0;
          for (int i = 1; i <= Periodo; i++)
          {
              SumIngresos_actualizados = SumIngresos_actualizados + Convert.ToDecimal(ArregloDatos[i, 4]);
          }

          decimal Sum_costos = 0;
          for (int i = 1; i <= Periodo; i++)
          {
              Sum_costos = Sum_costos + Convert.ToDecimal(ArregloDatos[i, 5]);
          }
          decimal CRBC = SumIngresos_actualizados / Sum_costos;
          BenCosto.Add("Por cada peso invertido usted obtendra una ganancia de: $" + Convert.ToString(Math.Round(CRBC, 3)));          
          ListaFinal.Add(BenCosto);
          String json = JsonConvert.SerializeObject(ListaFinal);
          return json;
    }
}