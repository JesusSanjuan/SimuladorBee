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

   /* protected void GreetingBtn_Click(Object sender, EventArgs e)
    {        
        Graficar();
        CreacionTabla();
    }

    public void Graficar()
    {
        decimal fTMAR = Convert.ToDecimal(TMAR.Text);
        int negativos, Periodo = Convert.ToInt32(n.Text.Replace(",", ""));
        decimal num;
        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();
        decimal ResultadoVPN, RCalcuTIR;
        Boolean Ceros = false;

        /* System.Diagnostics.Debug.WriteLine(PeriodoSelect);   Linea de codigo para ver en consola las cosas */       
       
/*
        ResultadoVPN = CalcularVPN(fTMAR / 100);
        string script3 = "Modal(" + ResultadoVPN + ");";
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script22", script3, true);


        if (ResultadoVPN > 0)
        {
            VAN.Text = "$" + ResultadoVPN.ToString("0,0.0000");
            RCalcuTIR = CalcularTIR(fTMAR / 100, 1);
            TIR.Text = (RCalcuTIR * 100).ToString("0,0.00") + " %";
        }
        else
        {
            VAN.Text = "$" + ResultadoVPN.ToString("0,0.0000");
            TIR.Text = "No aplicable";
            RCalcuTIR = CalcularTIR(fTMAR / 100, 2);
        }      

        fTMAR = 0;
        do
        {
            ListaX.Add(fTMAR * 100);
            ListaY.Add(CalcularVPN(fTMAR));
            negativos = 0;
            foreach (var item in ListaY)
            {
                num = Convert.ToDecimal(item);
                if (num < 0)
                {
                    negativos++;
                }
                if (num <= .1M && num >= -0.1M)
                {
                    Ceros = true;// Busca si ya existe el cruce en el eje x con 0
                }
            }
            fTMAR = fTMAR + 0.02M;// Cantidad de saltos de los puntos en el eje X
        } while (negativos < 5);// Solo 5 numeros negativos despues del cruce con 0 en el eje x

        /*Buscando interseccion con eje x *//*
        if (!Ceros)
        {
            decimal ValorY0 = Math.Round(CalcularVPN(RCalcuTIR), 2);
            decimal ValorX0 = Math.Round(RCalcuTIR * 100, 4);
            decimal v1, v2;
            for (int z = 1; z < ListaX.Count; z++)
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
        }
        /*Buscando interseccion con eje x *//*
        // pasamos las variabes en formato array json
        String timeC = JsonConvert.SerializeObject(ListaX);
        String repArrayC = JsonConvert.SerializeObject(ListaY);
        String PeriodoSelect = JsonConvert.SerializeObject("Año");
        if ("1" == select.Value)
        {
            PeriodoSelect = JsonConvert.SerializeObject("Mes");
        }
        //llamamos la función pasaando los parametros
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "Graficar(" + timeC + ", " + repArrayC + "," + PeriodoSelect + ");", true);

    }

    public decimal CalcularVPN(decimal fTMAR)
    {       
            decimal P = Convert.ToDecimal(Inversion.Text);
            decimal fFNE = Convert.ToDecimal(FNE.Text);
            decimal fVS = Convert.ToDecimal(VdS.Text);
            decimal FNEAcumulado = 0, fVPN = 0;
            int Periodo = Convert.ToInt32(n.Text.Replace(",", "")), i = 0;
        
        try
        {
            decimal DivTMAR = 1M + fTMAR;
            for (i = 1; i < Periodo; i++)
            {
                decimal valorinferior = (decimal)Math.Pow((double)DivTMAR, i);
                FNEAcumulado = FNEAcumulado + Math.Round(fFNE / Convert.ToDecimal(valorinferior), 4);
            }

            decimal valorinferiorF = (decimal)Math.Pow((double)DivTMAR, i);
            System.Diagnostics.Debug.WriteLine(DivTMAR);
            System.Diagnostics.Debug.WriteLine(i);
            FNEAcumulado = FNEAcumulado + Math.Round((fFNE + fVS) / Convert.ToDecimal(valorinferiorF), 4);
            fVPN = FNEAcumulado - P;

            
        }
        catch (OverflowException e)
        {
            Console.WriteLine("Exception: {0} > {1}.", e, decimal.MaxValue);
        }
        return fVPN;
    }

    public decimal CalcularTIR(decimal ValorTIR, int caso)
    {
        decimal TasaIncDec = 0.01M;
        decimal Resultado;
        Boolean MenosCero = false;
        decimal ValorTIRR =ValorTIR + TasaIncDec;
        switch (caso)
        {
            case 1:
                    do
                    {
                        Resultado = CalcularVPN(ValorTIRR);
                        if (MenosCero == true)
                        {
                            TasaIncDec = TasaIncDec / 2;
                            MenosCero = false;
                        }
                        if (Resultado > 0)
                        {
                            ValorTIRR = ValorTIRR + TasaIncDec;
                        }
                        else
                        {
                            ValorTIRR = ValorTIRR - TasaIncDec;
                            MenosCero = true;
                        }
                    } while (Math.Abs(Resultado) >= 0.01M);
                    break;
            case 2:
                    do
                    {
                        Resultado = CalcularVPN(ValorTIRR);
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
        return ValorTIRR;
    }

    public void CreacionTabla()
    {
        String PeriodoSelect="Año";
        if (select.Value=="1")
        {
           PeriodoSelect = "Mes";
        }
        

        Random r = new Random();
        int Costos = r.Next(200000, 2500000);

        Random r2 = new Random();
        int Ingresos = r2.Next(500000, 2500000);

        int Periodo = Convert.ToInt32(n.Text.Replace(",", ""));
        String[,] ArregloDatos = new String[Periodo + 1, 7];
        ArregloDatos[0, 3] = ArregloDatos[0, 4] = ArregloDatos[0, 5] = "";
        /*Cambiar cuado aya valores verdaderos de costos*//*
        ArregloDatos[0, 2] = "-" + Inversion.Text.Replace(",", "");
        /*Cambiar cuado aya valores verdaderos de costos*//*
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
            ArregloDatos[j, 4] = FNE.Text;
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
        String MatrizFinal = JsonConvert.SerializeObject(ArregloDatos);
        String comando = "RellenarTabla(" + MatrizFinal + ")";
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "clave", comando, true);

        decimal P = Convert.ToDecimal(Inversion.Text);
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
                        decimal T2 = Math.Round(((P / ((x2 * -1) + x1)) + (Anio - 1)), 3);
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
        BenCosto.Text = "Por cada peso invertido usted obtendra una ganancia de: $" + Convert.ToString(Math.Round(CRBC, 3));
    }*/
}