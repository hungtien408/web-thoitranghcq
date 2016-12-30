using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        string UserName = Login1.UserName;
        MembershipUser mu = Membership.GetUser(UserName);
        //Session["PWD"] = Login1.Password;
        
        if (Request.QueryString["ReturnURL"] != null)
        {
            Response.Redirect(Request.QueryString["ReturnURL"]);
        }
        else
        {
            string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
            for (int i = 0; i < roleUser.Length; i++)
            {
                if (roleUser[i] == "admin")
                {
                    Response.Redirect("ad/bilingual/");
                }
                else
                {
                    Session["UserName"] = UserName;
                    var oAddressBook = new AddressBook();
                    var a = oAddressBook.AddressBookSelectAll("", "", "", "", "", "", "", UserName, "", "", "", "", "", "", "", "", "", "", "", "member").DefaultView;
                    Session["FullNameUser"] = a[0]["FirstName"].ToString();
                    Response.Redirect("~/");
                }
            }
        }
        //if (Request.QueryString["ReturnURL"] != null)
        //{
        //    Response.Redirect(Request.QueryString["ReturnURL"]);
        //}
        //else
        //{
        //    Response.Redirect("~/");
        //}
    }
}