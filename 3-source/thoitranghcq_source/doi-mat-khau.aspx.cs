using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class doi_mat_khau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] == null)
                //Response.Redirect("~/login.aspx?returnurl=" + Request.Url.PathAndQuery);
                Response.Redirect("~/login.aspx");
        }
    }
    protected void ChangePassword1_ContinueButtonClick(object sender, EventArgs e)
    {
        var roles = Roles.GetRolesForUser(User.Identity.Name);
        //if (roles[0] == "admin")
        //   //Response.Redirect("");
        //else if (roles[0] == "member")
        //    Response.Redirect("~/tai-khoan.aspx");
        //else
        //    Response.Redirect("~/");
    }
}