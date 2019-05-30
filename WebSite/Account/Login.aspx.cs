using System;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System.Web;
using System.Web.UI;
using WebSite;
using System.Web.Services;
using Newtonsoft.Json;

public partial class Account_Login : System.Web.UI.Page
{
    static String referencia = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            referencia = OpenAuthLogin.ReturnUrl;
            System.Diagnostics.Debug.WriteLine("Prueba111" + referencia);
            System.Diagnostics.Debug.WriteLine("Prueba de "+returnUrl);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
    // http://localhost:52712/Account/Login?ReturnUrl=%2FSimulador%2Fvan.aspx
        }

    /*    protected void LogIn(object sender, EventArgs e)
        {
           /* if (IsValid)
            {
                // Validacion del usario
                var manager = new UserManager();
                ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                if (user != null)
                {
                    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    FailureText.Text = "Usuario  invalido o contraseña incorrecta.";
                    ErrorMessage.Visible = true;
                }
            }*/
       // }*/

    [WebMethod]
    public static string Iniciosecion(string UserName, String Password, Boolean Checked)
    {
        // Validacion del usario
       // Account_Login myobject = new Account_Login();
        var manager = new UserManager();
        
        System.Collections.ArrayList veredicto = new System.Collections.ArrayList();
        ApplicationUser user = manager.Find(UserName, Password);
        if (user != null)
        {
            IdentityHelper.SignIn(manager, user, Checked);
            veredicto.Add("SI");
            //myobject.prueba();
            // IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            // Response.Redirect("~/DashBoard.aspx");
            // IdentityHelper.RedirectToReturnUrl("~/DashBoard.aspx", Response);
        }
        else
        {
            veredicto.Add("NO");
            /* ENvia modal
            FailureText.Text = "Usuario  invalido o contraseña incorrecta.";
            ErrorMessage.Visible = true;*/
        }
        veredicto.Add(referencia);
        String json = JsonConvert.SerializeObject(veredicto);
        return json;
    }

}