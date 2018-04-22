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
        theDiv.Visible = true;

        //Button clickedButton = (Button)sender;
        //  clickedButton.Text = "...button clicked...";
        // clickedButton.Enabled = false;

    }

}