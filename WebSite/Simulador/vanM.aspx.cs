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
    public static string MiCalculo(double inversion, double[] FNE, int[] Anio, double VdS, double TMAR, int Select, int n)
    {
        int negativos, Periodo = n;
        double num;
        System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoVPNArray = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoVAN = new System.Collections.ArrayList();
        System.Collections.ArrayList ResultadoTIR = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaX = new System.Collections.ArrayList();
        System.Collections.ArrayList ListaY = new System.Collections.ArrayList();
        System.Collections.ArrayList PeriodoSelect = new System.Collections.ArrayList();
        double ResultadoVPN, RCalcuTIR;

        double [] valores = new double[Anio.Length];
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
        ResultadoVAN.Add("$" + ResultadoVPN.ToString("0,0.0000"));
        List<double> resultados = CalcularTIR( inversion, FNE, VdS, n);
        RCalcuTIR = resultados[0];
        ResultadoTIR.Add((RCalcuTIR).ToString("0,0.00000000") + " %");        
        ListaFinal.Add(ResultadoVAN);
        ListaFinal.Add(ResultadoTIR);

        TMAR = RCalcuTIR / 20;
        double TMAR2 = Math.Round(RCalcuTIR,4);
        int contador = 0;
        int pos = 0;
        do
        {
            ListaX.Add(Math.Round(TMAR, 4));
            ListaY.Add(Math.Round(CalcularVPN(inversion, FNE, VdS, TMAR / 100, n), 4));
            negativos = 0;

            foreach (var item in ListaY)
            {
                num = Convert.ToDouble(item);
                if (num < 0)
                {
                    negativos++;
                }
            }
            if (TMAR2 == Math.Round(TMAR, 4))
            {
                pos = contador;
            }
            TMAR = TMAR + (RCalcuTIR / 20);// Cantidad de saltos de los puntos en el eje X
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
        ListaFinal.Add(RCalcuTIR);
        if (resultados[1] == 0)
        {
            ListaFinal.Add("$ " + resultados[1]);
        }
        else
        {
            string formattedString = "$ " + String.Format("{0:N35}", resultados[1]);
            ListaFinal.Add(formattedString);
        }
        String json = JsonConvert.SerializeObject(ListaFinal);
        return json;
    }

    [WebMethod]
    public static string optimizacionFNE(double inversion, double[] FNE, double VS, int periodo, double tir)
    {
        System.Collections.ArrayList ListaFinal = new System.Collections.ArrayList();

        int poblacionNumero = 1920;
        List<double> FNEList = FNE.ToList();
        double FNEMax = FNEList.Max();
        double FNEMin = FNEList.Min();

        if (FNEMax == FNEMin)
        {
            FNEMax = FNEMax + 1000;
            FNEMin = FNEMin - 1000;
        }

        List<List<double>> poblacion2 = new List<List<double>>();
        Random random = new Random();
        while (poblacion2.Count < poblacionNumero)
        {
            List<double> poblaciontem = new List<double>();
            while (poblaciontem.Count < periodo)
            {
                double numeroAleatorio = random.NextDouble() * ((FNEMax + 1) - (FNEMin - 1)) + (FNEMin - 1);
                if (!poblaciontem.Contains(numeroAleatorio))
                {
                    poblaciontem.Add(numeroAleatorio);
                }
            }
            poblacion2.Add(poblaciontem);
        }
        int j = 1;
        double porcentajeconvergencia2 = 0;
        double porcentaje2 = (((double)100) / poblacionNumero);
        List<double> ResultadosFX2;
        Random random2b = new Random();
        do
        {
            ResultadosFX2 = fxFNE(inversion, poblacion2, VS, tir, periodo);

            List<int> torneo1b = posTorneo(0, poblacion2.Count / 2);
            List<int> torneo2b = posTorneo(poblacion2.Count / 2, poblacion2.Count);
            List<List<double>> padre2 = SeleccionFNE(torneo1b, torneo2b, ResultadosFX2, poblacion2);

            List<int> cruce1b = posTorneo(0, padre2.Count / 2);
            List<int> cruce2b = posTorneo(padre2.Count / 2, padre2.Count);

            List<List<double>> hijos_Generadosb = new List<List<double>>();

            double probCruzb = random2b.NextDouble();

            if (probCruzb < 0.9)
            {
                hijos_Generadosb = CruceTotal2(padre2, cruce1b, cruce2b, j);
            }
            else
            {
                hijos_Generadosb = padre2;
            }

            poblacion2.Clear();
            poblacion2 = padre2.Concat(hijos_Generadosb).ToList();
            poblacion2 = DesordenarLista(poblacion2);
            //List<List<double>> poblacionanalisis = new List<List<double>>(poblacion2); permite pasar en otra lista
            List<double> convergencia = medir_convergencia2(poblacion2);
            var agrupacion = convergencia.OrderByDescending(o => o).ToList();
            var agrupacion2 = agrupacion.GroupBy(x => x).Select(g => new { Text = g.Key, Count = g.Count() }).ToList();
            var valormax = agrupacion.Max();

            foreach (var el in agrupacion2)
            {
                if (el.Text == valormax && el.Count == 1)
                {
                    double valor = Convert.ToDouble(el.Text);
                    porcentajeconvergencia2 = porcentaje2 * valor;
                }
                break;
            }
            j = j + 1;
        } while (porcentajeconvergencia2 < (double)99.9);

        ListaFinal.Add(poblacion2[0]);
        ListaFinal.Add(FNEList);
        ListaFinal.Add(ResultadosFX2[0]);
        ListaFinal.Add(tir);

        String json = JsonConvert.SerializeObject(ListaFinal);
        Thread.Sleep(450);
        return json;
    }

    public static List<double> CalcularTIR(double inversion, double[] FNE, double VS, int periodo)
    {
        int poblacionNumero = 960;

        // System.Diagnostics.Debug.WriteLine("\nAproximacion inicial encontrada");
        //System.Diagnostics.Debug.WriteLine("\n\n******************INICIO DE LA BUSQUEDA DE LA TIR.*****************\n\n");

        //Stopwatch tiempo = Stopwatch.StartNew();
        double aproxInicial = aproximacioninicial(inversion, FNE, periodo);

        Random random = new Random();
        double minimo = aproxInicial - 1000;
        double maximo = aproxInicial + 1000;

        List<double> poblacion = new List<double>();

        while (poblacion.Count < poblacionNumero)
        {
            double numeroAleatorio = random.NextDouble() * (maximo - minimo) + minimo;
            if (!poblacion.Contains(numeroAleatorio))
            {
                poblacion.Add(numeroAleatorio);
            }
        }

        int i = 1;
        double porcentajeconvergencia = 0;
        double porcentaje = (((double)100) / poblacionNumero);
        List<double> ResultadosFX;
        Random random2 = new Random();
        do
        {
            ResultadosFX = fx(inversion, FNE, VS, poblacion, periodo);

            List<int> torneo1 = posTorneo(0, poblacion.Count / 2);
            List<int> torneo2 = posTorneo(poblacion.Count / 2, poblacion.Count);
            List<double> padre = Seleccion(torneo1, torneo2, ResultadosFX, poblacion);

            List<int> cruce1 = posTorneo(0, padre.Count / 2);
            List<int> cruce2 = posTorneo(padre.Count / 2, padre.Count);

            List<double> hijos_Generados = new List<double>();

            double probCruz = random2.NextDouble();

            if (probCruz < 0.9)
            {
                hijos_Generados = CruceTotal(padre, cruce1, cruce2, i);
            }
            else
            {
                hijos_Generados = padre;
            }

            poblacion.Clear();
            poblacion = padre.Concat(hijos_Generados).ToList();
            poblacion = DesordenarLista(poblacion);

            var agrupacion = poblacion.GroupBy(x => x).Select(g => g.Count()).ToList();
            agrupacion = agrupacion.OrderByDescending(o => o).ToList();
            var agrupacion2 = agrupacion.GroupBy(x => x).Select(g => new { Text = g.Key, Count = g.Count() }).ToList();
            var agrupacion3 = agrupacion.GroupBy(x => x).Select(g => g.Key).ToList();
            var valormax = agrupacion3.Max();

            foreach (var el in agrupacion2)
            {
                if (el.Text == valormax && el.Count == 1)
                {
                    double valor = Convert.ToDouble(el.Text);
                    porcentajeconvergencia = porcentaje * valor;
                }
                break;
            }
            //  System.Diagnostics.Debug.WriteLine("\tGeneracion: {0} , Convergencia del: {1}\n", i, porcentajeconvergencia);
            i = i + 1;
        } while (porcentajeconvergencia < (double)99.9);
        //tiempo.Stop();
        //System.Diagnostics.Debug.WriteLine("\n******************CONCLUIDA LA BUSQUEDA DE LA TIR.*****************");
        var resultTIR = poblacion.GroupBy(x => x).Select(g => new { Text = g.Key, Count = g.Count() }).ToList();
        resultTIR = resultTIR.OrderByDescending(o => o.Count).ToList();

        var resultTMAR = ResultadosFX.GroupBy(x => x).Select(g => new { Text = g.Key, Count = g.Count() }).ToList();
        resultTMAR = resultTMAR.OrderByDescending(o => o.Count).ToList();

        /*System.Diagnostics.Debug.WriteLine("********RESULTADOS DE LA BUSQUEDA DE LA TIR*************");
        System.Diagnostics.Debug.WriteLine("\tAproximacion inicial es: {0}\n", aproxInicial);
        System.Diagnostics.Debug.WriteLine("\n\tTotal de Generaciones del calculo de la TIR: {0} , Convergencia del: {1}", i, porcentajeconvergencia);
        System.Diagnostics.Debug.WriteLine("\n\t\t RESULTADO TMAR: {0}", resultTMAR[0].Text);
        System.Diagnostics.Debug.WriteLine("\n\t\t RESULTADO TIR: {0}", resultTIR[0].Text);
        System.Diagnostics.Debug.WriteLine($"\n\t\t\tTiempo para la busqueda de la TIR y TMAR: {tiempo.Elapsed.TotalSeconds} segundos");
        System.Diagnostics.Debug.WriteLine("********RESULTADOS DE LA BUSQUEDA DE LA TIR*************");*/
        List<double> resultados = new List<double>();
        resultados.Add(resultTIR[0].Text);
        resultados.Add(resultTMAR[0].Text);

        Thread.Sleep(450);

        return resultados;
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


    /*************************************************ALGORITMO GENETICO***************************************************/
    public static double aproximacioninicial(double Inversion, double[] FNE, int Periodo)
    {
        double resultado, sumasuperior = 0, sumainferior = 0;
        for (int i = 0; i < FNE.Length; i++)
        {
            double t = (FNE[i] * (i + 1));
            sumasuperior = sumasuperior + t;
            sumainferior = sumainferior + FNE[i];
        }
        resultado = sumasuperior / sumainferior;

        double x0;
        double t1 = sumainferior / Inversion;
        t1 = Math.Abs(t1);
        double t2 = 1 / resultado;
        x0 = Math.Pow(t1, t2);
        x0 = (x0 - 1) * 100;
        return x0;
    }

    static List<double> fx(double Inversion, double[] FNE, double VS, List<double> poblacion, int Periodo)
    {
        List<double> ResultadosFX = new List<double>();
        double valorFX = 0;
        foreach (double contenido in poblacion)
        {
            valorFX = CalcularVPN(Inversion, FNE, VS, contenido / 100, Periodo);
            ResultadosFX.Add(valorFX);
        }
        return ResultadosFX;
    }

    static List<int> posTorneo(int inicio, int tamañopoblacion)
    {
        var torneo = new List<int>();
        var resultorneo = new List<int>();
        for (int i = inicio; i < tamañopoblacion; i++)
        {
            torneo.Add(i);
        }
        resultorneo = DesordenarLista(torneo);
        return resultorneo;
    }

    public static List<T> DesordenarLista<T>(List<T> input)
    {
        List<T> arr = input;
        List<T> arrDes = new List<T>();

        Random randNum = new Random();
        while (arr.Count > 0)
        {
            int val = randNum.Next(0, arr.Count - 1);
            arrDes.Add(arr[val]);
            arr.RemoveAt(val);
        }
        return arrDes;
    }

    static List<double> Seleccion(List<int> p1, List<int> p2, List<double> ResultadosFX, List<double> poblacion)
    {
        List<double> padre = new List<double>();
        List<double> padrefx = new List<double>();

        for (int i = 0; i < p1.Count; i++)
        {
            double fx1 = ResultadosFX[p1[i]];
            double fx2 = ResultadosFX[p2[i]];

            double pob1 = poblacion[p1[i]];
            double pob2 = poblacion[p2[i]];

            List<double> tem = new List<double>();
            tem.Add(fx1);
            tem.Add(fx2);

            double ganador = 0;
            int indexganadorPob = 0;

            if (fx1 >= 0 && fx2 >= 0)
            {
                List<double> reorganizacionPos = tem.Where(x => x >= 0).ToList();
                ganador = reorganizacionPos.Min(x => x);
                indexganadorPob = ResultadosFX.FindIndex(x => x == ganador);
                padrefx.Add(ganador);
                padre.Add(poblacion[indexganadorPob]);
            }
            else if (fx1 < -0 && fx2 < -0)
            {
                List<double> reorganizacionNega = tem.Where(x => x < 0).ToList();
                ganador = reorganizacionNega.Max(x => x);
                indexganadorPob = ResultadosFX.FindIndex(x => x == ganador);
                padrefx.Add(ganador);
                padre.Add(poblacion[indexganadorPob]);
            }
            else
            {
                double fx1p, fx2p;
                fx1p = Math.Abs(fx1);
                fx2p = Math.Abs(fx2);

                tem.Clear();

                tem.Add(fx1p);
                tem.Add(fx2p);

                if (fx1 < -0)
                {
                    List<double> reorganizacionPos = tem.Where(x => x >= 0).ToList();
                    ganador = reorganizacionPos.Min(x => x);
                    if (fx1p == ganador)
                    {
                        indexganadorPob = ResultadosFX.FindIndex(x => x == fx1);
                        padrefx.Add(fx1);
                        padre.Add(poblacion[indexganadorPob]);
                    }
                    else
                    {
                        indexganadorPob = ResultadosFX.FindIndex(x => x == fx2p);
                        padrefx.Add(fx2);
                        padre.Add(poblacion[indexganadorPob]);
                    }
                }
                else
                {
                    List<double> reorganizacionPos = tem.Where(x => x > 0).ToList();
                    ganador = reorganizacionPos.Min(x => x);
                    if (fx2p == ganador)
                    {
                        indexganadorPob = ResultadosFX.FindIndex(x => x == fx2);
                        padrefx.Add(fx2);
                        padre.Add(poblacion[indexganadorPob]);
                    }
                    else
                    {
                        indexganadorPob = ResultadosFX.FindIndex(x => x == fx1p);
                        padrefx.Add(fx1);
                        padre.Add(poblacion[indexganadorPob]);
                    }
                }
            }
        }
        return padre;
    }

    static List<double> CruceTotal(List<double> padre, List<int> cruce1, List<int> cruce2, int iteracion)
    {
        Random random = new Random();
        List<double> poblacionnueva1a = Cruce(cruce1, cruce2, padre);
        List<double> poblacionnueva1 = mutacion(poblacionnueva1a, iteracion, random);
        cruce1 = DesordenarLista(cruce1);
        cruce2 = DesordenarLista(cruce2);
        List<double> poblacionnueva2a = Cruce(cruce1, cruce2, padre);
        List<double> poblacionnueva2 = mutacion(poblacionnueva2a, iteracion, random);
        return poblacionnueva1.Concat(poblacionnueva2).ToList();
    }

    static List<double> Cruce(List<int> cruce1, List<int> cruce2, List<double> padre)
    {
        List<double> hijos = new List<double>();
        for (int i = 0; i < cruce1.Count; i++)
        {
            double padre1 = padre[cruce1[i]];
            double padre2 = padre[cruce2[i]];

            double media = (padre1 + padre2) / 2;
            //double media_geometrica = (double)Math.Sqrt((Math.Pow((double)padre1,2) * (Math.Pow((double)padre2,2))));
            //double media_geometrica = (double)Math.Sqrt((double)(padre1*padre2));
            hijos.Add(media);
        }
        return hijos;
    }

    static List<double> mutacion(List<double> poblacion1, int iteracion, Random random)
    {
        ////List<double> mutacionResultado = new List<double>();
        for (int i = 0; i < poblacion1.Count; i++)
        {
            // double numeroAleatorio = random.NextDouble();
            double longitud = Convert.ToString(poblacion1[i]).Length - 1;
            double p = Math.Pow(2 + (((longitud - 2) / (70 - 1)) * iteracion), -1);
            // Console.WriteLine("\n\t\t\t\t\tMUTACION {0}", numeroAleatorio);
            if (p > .1)//AQUI PERMITE LA MUTACION lgo invertido
            {
                double mediageometrica = poblacion1.Sum() / poblacion1.Count;
                double desviasion = desviasionstandar(poblacion1, mediageometrica);
                double z = (poblacion1[i] - mediageometrica) / desviasion;
                poblacion1[i] = poblacion1[i] + z;
            }
            else
            {
                poblacion1[i] = poblacion1[i];
            }
        }
        return poblacion1;
    }

    static double desviasionstandar(List<double> poblacion1, double mediageometrica)
    {
        double sumatoria = 0;
        for (int i = 0; i < poblacion1.Count; i++)
        {
            sumatoria = sumatoria + Math.Pow((poblacion1[0] - mediageometrica), 2);
        }
        return Math.Sqrt(sumatoria / (poblacion1.Count - 1));
    }
    public static double CalcularVPN(double Inversion, double[] FNE, double VS, double TMAR, int Periodo)
    {
        double FNEAcumulado = 0, fVPN = 0;
        int i = 0;
        double DivTMAR = 1 + TMAR;
        for (i = 1; i < Periodo; i++)
        {
            double valorinferior = Math.Pow(DivTMAR, i);
            if (valorinferior == 0 && DivTMAR > 0)
            {
                valorinferior = Double.MaxValue;
            }
            if (valorinferior == 0 && DivTMAR < 0)
            {
                valorinferior = Double.MinValue;
            }
            FNEAcumulado = FNEAcumulado + (FNE[i - 1] / valorinferior);
        }
        double valorinferiorF = Math.Pow(DivTMAR, i);
        if (valorinferiorF == 0 && DivTMAR > 0)
        {
            valorinferiorF = Double.MaxValue;
        }
        if (valorinferiorF == 0 && DivTMAR < 0)
        {
            valorinferiorF = Double.MinValue;
        }
        FNEAcumulado = FNEAcumulado + ((FNE[i - 1] + VS) / valorinferiorF);
        fVPN = -Inversion + FNEAcumulado;
        return fVPN;
    }
    /*************************************************ALGORITMO GENETICO***************************************************/

    /*********************************************ALGORITMO GENETICO FNE***************************************************/
    static List<double> fxFNE(double Inversion, List<List<double>> poblacion, double VS, double tir, int Periodo)
    {
        List<double> ResultadosFX = new List<double>();
        double valorFX = 0;
        foreach (List<double> contenido in poblacion)
        {
            double[] array = contenido.ToArray();
            valorFX = CalcularVPN(Inversion, array, VS, tir / 100, Periodo);
            ResultadosFX.Add(valorFX);
        }
        return ResultadosFX;
    }

    static List<List<double>> SeleccionFNE(List<int> p1, List<int> p2, List<double> ResultadosFX, List<List<double>> poblacion)
    {
        List<List<double>> padre = new List<List<double>>();
        List<double> padrefx = new List<double>();

        for (int i = 0; i < p1.Count; i++)
        {
            double fx1 = ResultadosFX[p1[i]];
            double fx2 = ResultadosFX[p2[i]];

            List<double> pob1 = poblacion[p1[i]];
            List<double> pob2 = poblacion[p2[i]];

            List<double> tem = new List<double>();
            tem.Add(fx1);
            tem.Add(fx2);

            double ganador = 0;
            int indexganadorPob = 0;

            ganador = tem.Max(x => x);
            indexganadorPob = ResultadosFX.FindIndex(x => x == ganador);
            padrefx.Add(ganador);
            padre.Add(poblacion[indexganadorPob]);
        }
        return padre;
    }

    static List<List<double>> CruceTotal2(List<List<double>> padre, List<int> cruce1, List<int> cruce2, int iteracion)
    {
        Random random = new Random();
        List<List<double>> poblacionnueva1a = Cruce2(cruce1, cruce2, padre);
        List<List<double>> poblacionnueva1 = mutacion2(poblacionnueva1a, iteracion, random);
        cruce1 = DesordenarLista(cruce1);
        cruce2 = DesordenarLista(cruce2);
        List<List<double>> poblacionnueva2a = Cruce2(cruce1, cruce2, padre);
        List<List<double>> poblacionnueva2 = mutacion2(poblacionnueva2a, iteracion, random);
        return poblacionnueva1.Concat(poblacionnueva2).ToList();
    }

    static List<List<double>> Cruce2(List<int> cruce1, List<int> cruce2, List<List<double>> padre)
    {
        List<List<double>> hijos = new List<List<double>>();
        for (int i = 0; i < cruce1.Count; i++)
        {
            List<double> padre1 = padre[cruce1[i]];
            List<double> padre2 = padre[cruce2[i]];
            List<double> crucemedias = new List<double>();

            for (int j = 0; j < padre1.Count; j++)
            {
                double media = (padre1[j] + padre2[j]) / 2;
                crucemedias.Add(media);
            }
            //double media = (padre1 + padre2) / 2;
            //double media_geometrica = (double)Math.Sqrt((Math.Pow((double)padre1,2) * (Math.Pow((double)padre2,2))));
            //double media_geometrica = (double)Math.Sqrt((double)(padre1*padre2));
            hijos.Add(crucemedias);
        }
        return hijos;
    }

    static List<List<double>> mutacion2(List<List<double>> poblacion1, int iteracion, Random random)
    {
        List<List<double>> mutacionResultado = new List<List<double>>();
        for (int i = 0; i < poblacion1.Count; i++)
        {
            List<double> poblaciontrabajo = poblacion1[i];

            for (int j = 0; j < poblaciontrabajo.Count; j++)
            {
                double longitud = Convert.ToString(poblaciontrabajo[j]).Length - 1;
                double p = Math.Pow(2 + (((longitud - 2) / (70 - 1)) * iteracion), -1);
                // double numeroAleatorio = random.NextDouble();

                // Console.WriteLine("\n\t\t\t\t\tMUTACION {0}", numeroAleatorio);
                if (p > .1)//AQUI PERMITE LA MUTACION lgo invertido
                {
                    double mediageometrica = poblaciontrabajo.Sum() / poblaciontrabajo.Count;
                    double desviasion = desviasionstandar(poblaciontrabajo, mediageometrica);
                    double z = (poblaciontrabajo[j] - mediageometrica) / desviasion;
                    poblaciontrabajo[j] = poblaciontrabajo[j] + z;
                    //Console.WriteLine("\n\t\t\t\tMUTACION");
                }
                else
                {
                    poblaciontrabajo[j] = poblaciontrabajo[j];
                }
            }
            mutacionResultado.Add(poblaciontrabajo);
        }
        return mutacionResultado;
    }

    public static List<double> medir_convergencia2(List<List<double>> poblacion)
    {
        int[] valida_pos = new int[poblacion.Count];
        List<double> resultadosFinales = new List<double>();

        for (int i = 0; i < poblacion.Count; i++)
        {
            if (valida_pos[i] == 0)
            {
                valida_pos[i] = 1;
                int contador = 1;
                List<double> v1 = poblacion[i];
                for (int j = 0; j < poblacion.Count; j++)
                {
                    if (valida_pos[j] == 0)
                    {
                        List<double> v2 = poblacion[j];
                        if (v1.SequenceEqual(v2))
                        {
                            contador++;
                            valida_pos[j] = 1;
                        }
                    }
                }
                resultadosFinales.Add(contador);
            }
        }
        return resultadosFinales;
    }
    /*********************************************ALGORITMO GENETICO FNE***************************************************/

}