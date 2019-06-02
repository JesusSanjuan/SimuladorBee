using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using WebSite;
using System.Web.Services;
using System.Collections.Generic;
using Newtonsoft.Json;

public partial class Account_Register : Page
{
    /*protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {

            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }*/

    [WebMethod]
    public static string Nick(string NickName)
    {
        // Validacion del usario
        var db = new Entidades();   /* Crear la instancia a las tablas de la BD */
        var consulta = db.AspNetUsers
                          .Where(s => s.UserName == NickName);

        List<string> result_nick = new List<string>();

        foreach (AspNetUsers Nick in consulta)
        {
            result_nick.Add(Nick.UserName);
        }


        //var consulta1 = db.AspNetUsers.OrderByDescending(indice => indice.);

        String json = JsonConvert.SerializeObject(result_nick);
        return json;
    }

}