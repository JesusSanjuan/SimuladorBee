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
    [WebMethod]
    public static string Nick(string NickName)
    {
        var db = new Entidades();
        var consulta = db.AspNetUsers.Where(s => s.UserName == NickName);
        List<string> result_nick = new List<string>();
        foreach (AspNetUsers Nick in consulta)
        {
            result_nick.Add(Nick.UserName);
        }
        String json = JsonConvert.SerializeObject(result_nick);
        return json;
    }

    [WebMethod]
    public static string Email(string Mail)
    {
        var db = new Entidades();
        var consulta = db.AspNetUsers.Where(s => s.Email == Mail);
        List<string> result_email = new List<string>();
        foreach (AspNetUsers Email in consulta)
        {
            result_email.Add(Email.Email);
        }
        String json = JsonConvert.SerializeObject(result_email);
        return json;
    }

    [WebMethod]
    public static string Registro(string NickS, string nameS, string AppPaternS, string AppMaterS, string InstitucS, string countrS, string passwoS, string phoS, string emaiS)
    {
        Boolean correcto = false;
        System.Collections.ArrayList veredicto = new System.Collections.ArrayList();
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = NickS };
        IdentityResult result = manager.Create(user, passwoS);
        try
        {
            var db = new Entidades();
            var reg = db.AspNetUsers.FirstOrDefault(x => x.UserName == NickS);
            reg.Name = nameS;
            reg.Apellido_Pat = AppPaternS;
            reg.Apellido_Mat = AppMaterS;
            reg.Institucion = InstitucS;
            reg.Pais = countrS;
            reg.PhoneNumber = phoS;
            reg.Email = emaiS;
            db.SaveChanges();
            correcto = true;
        }
        catch(Exception e)
        {
            correcto = false;
        }

        if (result.Succeeded && correcto)
        {
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            veredicto.Add("SI");
        }
        else
        {
            veredicto.Add("NO");
        }
        String json =JsonConvert.SerializeObject(veredicto);
        return json;
    }
}