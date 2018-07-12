using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class User_van : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GreetingBtn_Click(Object sender, EventArgs e)
    {
        decimal ResultadoVPN;
        CreacionTabla();
        ResultadoVPN = Calculos();
        
        string script3 = "Modal(" + ResultadoVPN + ");";
        
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script22", script3, true);
    }

    public decimal Calculos()
    {
        String timeC;
        String repArrayC;
        String PeriodoSelect = JsonConvert.SerializeObject(Select.Value);
        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */
        decimal fTMAR = Convert.ToDecimal(TMAR.Text);
        int Periodo = Convert.ToInt32(n.Text);
        int negativos;
        decimal num, ResultadoVPN;

        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();

        ResultadoVPN = CalcularVPN(fTMAR / 100);

        if (ResultadoVPN > 0)
        {
            VAN.Text = "$" + Math.Round(ResultadoVPN, 2).ToString("0,0.00");
            /* Calculo de la TIR */
            decimal ResultadoCTIR = CalcularTIR(fTMAR / 100);
            TIR.Text = (Math.Round(ResultadoCTIR, 6) * 100).ToString("0,0.0") + " %";////////////////////////////////////////////////////////REVISAR
        }
        else
        {
            VAN.Text = "$" + Math.Round(ResultadoVPN, 2).ToString("0,0.00");
            TIR.Text = "No aplicable";
        }

        /*Buscando interseccion con eje x */
        // double ResultadoCTIR = CalcularTIR(fTMAR / 100);
        decimal ValorY0 = Math.Round(CalcularVPN(CalcularTIR(fTMAR / 100)), 1);////////////////////////////////////////////////////////REVISAR
        decimal ValorX0 = Math.Round(CalcularTIR(fTMAR / 100) * 100, 6);
        /*Buscando interseccion con eje x */
        fTMAR = 0;

        do
        {
            ListaX.Add(Math.Round(fTMAR * 100, 2));
            ListaY.Add(Math.Round(CalcularVPN(fTMAR), 2));
            negativos = 0;
            foreach (var item in ListaY)
            {
                num = Convert.ToDecimal(item);
                if (num < 0)
                {
                    negativos++;
                }
            }
            fTMAR = Convert.ToDecimal(Math.Round(fTMAR + 0.02M, 4));

        } while (negativos < 5);

        /*Buscando interseccion con eje x */
        decimal v1, v2;
        var xxx = ListaX.Count;////////////////////////////////////////////////////////REVISAR
        for (int z = 1;   z< ListaX.Count; z++)
        {
            v1 = (decimal)ListaX[z - 1];
            v2 = (decimal)ListaX[z];
            if (ValorX0 >= v1 && ValorX0 <= v2)
            {
                ListaX.Insert(z, ValorX0);
                ListaY.Insert(z, ValorY0);
                break;
            }            
        }
        /*Buscando interseccion con eje x */
        // pasamos las variabes en formato array json
        timeC = JsonConvert.SerializeObject(ListaX);
        repArrayC = JsonConvert.SerializeObject(ListaY);

        //llamamos la función pasaando los parametros
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Graficar(" + timeC + ", " + repArrayC + "," + PeriodoSelect + ");", true);

        return ResultadoVPN;
    }

    public decimal CalcularVPN(decimal fTMAR)
    {
        decimal P = Convert.ToDecimal(Inversion.Text);
        decimal fFNE = Convert.ToDecimal(FNE.Text);
        decimal fVS = Convert.ToDecimal(VdS.Text);
        decimal FNEAcumulado = 0, fVPN=0;
        int Periodo = Convert.ToInt32(n.Text);
        int i;

        decimal DivTMAR = 1M + fTMAR;
        for (i = 1; i < Periodo; i++)
        {
            FNEAcumulado = FNEAcumulado + (fFNE / Convert.ToDecimal(Math.Pow((double)DivTMAR, i)));
        }
        FNEAcumulado = FNEAcumulado + ((fFNE + fVS) / Convert.ToDecimal(Math.Pow((double)DivTMAR, i)));
        fVPN = FNEAcumulado - P;

        return Math.Round(fVPN,4);
    }

    public decimal CalcularTIR(decimal ValorTIR)
    {
        decimal TasaIncDec = 0.01M;
        decimal Resultado;
        Boolean MenosCero = false;
        ValorTIR =ValorTIR + TasaIncDec;
        
        do
        {
            Resultado = CalcularVPN(ValorTIR);

            if (MenosCero == true)
            {
                TasaIncDec = TasaIncDec / 2;
                MenosCero = false;
            }
            if (Resultado > 0)
            {
                ValorTIR = ValorTIR + TasaIncDec;                
            }
            else
            {
                ValorTIR = ValorTIR - TasaIncDec;
                MenosCero = true;
            }
        } while (Math.Abs(Resultado) >= 0.01M);

        return ValorTIR;
    }

    public void CreacionTabla()
    {
        String PeriodoSelect = Select.Value;

        Random r = new Random();
        int Costos = r.Next(200000, 2500000);

        Random r2 = new Random();
        int Ingresos = r2.Next(500000, 2500000);

        int Periodo = Convert.ToInt32(n.Text);
        String[,] ArregloDatos = new String[Periodo + 1, 7];
        ArregloDatos[0, 1] = PeriodoSelect + " 0";
        ArregloDatos[0, 3] = ArregloDatos[0, 4] = ArregloDatos[0, 5] = "";
        /*Cambiar cuado aya valores verdaderos de costos*/
        ArregloDatos[0, 2] = "-" + Inversion.Text;
        /*Cambiar cuado aya valores verdaderos de costos*/
        for (int j = 0; j <= Periodo; j++)
        {
            ArregloDatos[j, 0] = Convert.ToString(j + 1);
        }
        for (int j = 1; j <= Periodo; j++)
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
            ArregloDatos[j, 4] = FNE.Text;
        }
        for (int j = 1; j <= Periodo; j++)
        {
            for (int i = 1; i <= Periodo; i++)
            {
                double IngresoActual = (Convert.ToDouble(ArregloDatos[i, 3].Trim(new Char[] { '$', ' ' }))) / Convert.ToDouble(Math.Pow(1 + .1, i));
                ArregloDatos[j, 5] = Convert.ToString(Math.Round(IngresoActual, 3));
            }
        }

        ArregloDatos[0, 6] = ArregloDatos[0, 2];
        for (int i = 1; i <= Periodo; i++)
        {
            double x = Convert.ToDouble(ArregloDatos[i - 1, 6]);
            double Flujoneto = Convert.ToDouble(ArregloDatos[i, 4]);
            ArregloDatos[i, 6] = Convert.ToString(x + Flujoneto);
        }
        String MatrizFinal = JsonConvert.SerializeObject(ArregloDatos);
        String comando = "RellenarTabla(" + MatrizFinal + ")";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", comando, true);

        double P = Convert.ToDouble(Inversion.Text);
        for (int i = 1; i <= Periodo; i++)
        {
            double x1 = Convert.ToDouble(ArregloDatos[i, 6]);
            if (x1 >= 0)
            {
                double x2 = Convert.ToDouble(ArregloDatos[i - 1, 6]);
                if (x2 < 0)
                {
                    double Anio = Convert.ToDouble(ArregloDatos[i - 1, 0]);
                    if (PeriodoSelect == "Mes")
                    {
                        double T1 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);

                        if(T1>1)
                        {
                            PeridoRec.Text = Convert.ToString(T1) + " " + PeriodoSelect + "es";
                        }
                        else
                        {
                            PeridoRec.Text = Convert.ToString(T1) + " " + PeriodoSelect;
                        }
                        
                    }
                    else
                    {
                        double T2 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);
                        if (T2 > 1)
                        {
                            PeridoRec.Text = Convert.ToString(T2) + " " + PeriodoSelect + "s";
                        }
                        else
                        {
                            PeridoRec.Text = Convert.ToString(T2) + " " + PeriodoSelect;
                        }
                    }
                    break;
                }
            }
            else
            {
                PeridoRec.Text = "No es posible calcular";
            }

        }

        double SumIngresos_actualizados = 0;
        for (int i = 1; i <= Periodo; i++)
        {
            SumIngresos_actualizados = SumIngresos_actualizados + Convert.ToDouble(ArregloDatos[i, 4]);
        }

        double Sum_costos = 0;
        for (int i = 1; i <= Periodo; i++)
        {
            Sum_costos = Sum_costos + Convert.ToDouble(ArregloDatos[i, 5]);
        }

        double CRBC = SumIngresos_actualizados / Sum_costos;
        BenCosto.Text = "Por cada peso invertido usted obtendra una ganancia de: $" + Convert.ToString(Math.Round(CRBC, 3));
    }


}