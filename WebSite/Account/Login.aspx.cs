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
        /*Aqui se podria llegar a generar error de login*/
        RegisterHyperLink.NavigateUrl = "Register";
        OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        referencia = OpenAuthLogin.ReturnUrl;
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
        /*Aqui se podria llegar a generar error de login*/
    }

    [WebMethod]
    public static string Iniciosecion(string UserName, String Password, Boolean Checked)
    {
        // Validacion del usario
        var manager = new UserManager();

        System.Collections.ArrayList veredicto = new System.Collections.ArrayList();
        try
        {
            ApplicationUser user = manager.Find(UserName, Password);//Aqui se podria llegar a generar error de login
            if (user != null)
            {
                IdentityHelper.SignIn(manager, user, Checked);
                veredicto.Add("SI");
            }
            else
            {
                veredicto.Add("NO");
            }
            veredicto.Add(referencia);
        }
        catch (Exception e)
        {

            veredicto.Add(e);
        }

        String json = JsonConvert.SerializeObject(veredicto);
        return json;
    }

}