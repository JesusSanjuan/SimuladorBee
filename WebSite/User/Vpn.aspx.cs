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
        
        double P = Convert.ToSingle(Inversion.Text);
        double fFNE = Convert.ToSingle(FNE.Text);
        double fVS = Convert.ToSingle(VdS.Text);
        double fTMAR = Convert.ToSingle(TMAR.Text);
        double FNEAcumulado, fVPN;
        int Periodo= Convert.ToInt32(n.Text);
        int  j;

        FNEAcumulado = 0;
        for (j = 1; j < Periodo; j++)
        {
            FNEAcumulado = FNEAcumulado + (fFNE / Math.Pow((1 + FNEAcumulado), j));
        }
        FNEAcumulado = FNEAcumulado + ((fFNE + fVS) / Math.Pow((1 + FNEAcumulado), j));
        fVPN = FNEAcumulado - P;
       // VPN.Text = Convert.ToString(fVPN);
        Console.WriteLine("You click me ...................");
        theDiv.Visible = true;
        //Button clickedButton = (Button)sender;
        //  clickedButton.Text = "...button clicked...";
        // clickedButton.Enabled = false;

    }

}