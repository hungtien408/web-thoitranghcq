using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using TLLib;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Header.DataBind();
            string page = Request.Url.PathAndQuery.ToLower();

            string startScript = "<script type='text/javascript'>";
            string endScript = "')</script>";
            string activePage = "";

            if (page.Contains("-pci-"))
                activePage = "san-pham.aspx";
            else if (page.Contains("chi-tiet-tin-tuc.aspx?id="))
                activePage = "tin-tuc.aspx";
            else if (!page.EndsWith("default.aspx"))
                activePage = Path.GetFileName(page);

            if (!string.IsNullOrEmpty(activePage))
                runScript.InnerHtml = startScript + "changeActiveMenu('" + activePage + endScript;

            runScript.InnerHtml += startScript + "changeSubActiveMenu('" + Path.GetFileName(page) + endScript;
        }
    }

    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Session["Cart"] != null)
        {
            var oShoppingCart = new ShoppingCart();
            var dt = oShoppingCart.Cart();
            if (dt.Rows.Count == 0)
            {
                lblSummary.Text = "0";
            }
            else
            {
                int quantity = 0;
                double Total = 0;

                foreach (DataRow dr in dt.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? "0" : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    Total += Quantity * Price;
                    quantity += Quantity;
                }
                lblSummary.Text = quantity.ToString();
                //lblTotal.Text = string.IsNullOrEmpty(Total.ToString()) ? "0.000" : (string.Format("{0:##,###.##}", Total.ToString().Replace('.', '*').Replace(',', '.').Replace('*', ',')));
                //lblTotalPrice.Text = string.Format("{0:##,###.##}", Total).Replace('.', '*').Replace(',', '.').Replace('*', ',') + "đ";
            }

            ListView1.DataBind();
        }
        //if (Session["IsLogin"] != null)
        //{
        //    var oWishList = new WishList();
        //    var dv = oWishList.WishListSelectAll("", "", Session["UserName"].ToString(), "", "", "", "").DefaultView;
        //    //lblWishList.Text = dv.Count.ToString();
        //}
    }

    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        var dtCart = Session["Cart"] as DataTable;
        if (dtCart != null)
        {
            //var lblTotalPrice = ListView1.FindControl("lblTotalPrice") as Label;
            //var hdnTotalPrice = ListView1.FindControl("hdnTotalPrice") as HiddenField;

            //var lblSumTotalPrice = ListView1.FindControl("lblSumTotalPrice") as Label;
            //var hdnSumTotalPrice = ListView1.FindControl("hdnSumTotalPrice") as HiddenField;

            //var lblShippingPrice = ListView1.FindControl("lblShippingPrice") as Label;
            //var hdnShippingPrice = ListView1.FindControl("hdnShippingPrice") as HiddenField;
            //var odsProvince = ListView1.FindControl("odsProvince") as ObjectDataSource;
            //var dv = (DataView)odsProvince.Select();
            var iShippingPrice = "0";// Convert.ToDouble(string.IsNullOrEmpty(dv[0]["ShippingPrice"].ToString()) ? "0" : dv[0]["ShippingPrice"].ToString());
            double TotalPrice = 0;
            double SumTotalPrice = 0;
            double ShippingPrice = 0;

            if (lblTotalPrice != null)
            {
                foreach (DataRow dr in dtCart.Rows)
                {
                    var Quantity = Convert.ToInt32(string.IsNullOrEmpty(dr["Quantity"].ToString()) ? 0 : dr["Quantity"]);
                    var Price = Convert.ToDouble(string.IsNullOrEmpty(dr["Price"].ToString()) ? 0 : dr["Price"]);
                    TotalPrice += Quantity * Price;
                }

                ShippingPrice = Convert.ToDouble(iShippingPrice);
                //ShippingPrice = 20000;
                SumTotalPrice = TotalPrice + ShippingPrice;
                hdnTotalPrice.Value = TotalPrice.ToString();
                //hdnSumTotalPrice.Value = SumTotalPrice.ToString();
                lblTotalPrice.Text = string.IsNullOrEmpty(TotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", TotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                //lblSumTotalPrice.Text = string.IsNullOrEmpty(SumTotalPrice.ToString()) ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", SumTotalPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                //lblShippingPrice.Text = iShippingPrice.ToString() == "0" ? "<strong>0</strong> đ" : "<strong>" + (string.Format("{0:##,###.##}", iShippingPrice).Replace('.', '*').Replace(',', '.').Replace('*', ',')) + "</strong> đ";
                //hdnShippingPrice.Value = ShippingPrice.ToString();
            }
        }
    }

    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        var textbox = (TextBox)sender;
        var parent = textbox.NamingContainer;
        var oShoppingCart = new ShoppingCart();
        var Quantity = (parent.FindControl("txtQuantity") as TextBox).Text.Trim();
        var ProductID = (parent.FindControl("hdnCartProductID") as HiddenField).Value;
        int Quantity1 = Int32.Parse(Quantity);
        if (Quantity1 > 0 && Quantity1 < 1000)
        {
            oShoppingCart.UpdateQuantity(ProductID, Quantity);
            ListView1.DataBind();
        }
        else
        {
            Quantity = "1";
            ScriptManager.RegisterClientScriptBlock((TextBox)sender, sender.GetType(), "runtime", "alert('Bạn nhập quá số lượng cho phép (1 - 12)')", true);
        }

        ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.cart img').trigger('click');});", true);
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        if (cmd == "Remove")
        {
            var ProductID = (item.FindControl("hdnCartProductID") as HiddenField).Value;
            var ProductOptionCategoryID = (item.FindControl("hdnCartProductOptionCategoryID") as HiddenField).Value;
            var ProductLengthID = (item.FindControl("hdnCartProductLengthID") as HiddenField).Value;

            var oShoppingCart = new ShoppingCart2();
            oShoppingCart.DeleteItem(ProductID, ProductOptionCategoryID, ProductLengthID);
            ListView1.DataBind();
        }
    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {
        var txtEmail = (TextBox)sender;
        var strEmail = txtEmail.Text;
        //var CustomValidator2 = (CustomValidator)txtEmail.Parent.FindControl("CustomValidator2");
        //var lblMessage = (Label)txtEmail.Parent.FindControl("lblEmailMessage");

        if (!string.IsNullOrEmpty(strEmail))
        {
            if (Membership.FindUsersByEmail(strEmail).Count > 0)
            {
                CustomValidator2.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> đã tồn tại!";
                CustomValidator2.IsValid = false;
                lblEmailMessage.Text = "";
            }
            else
            {
                string[] stringArray = strEmail.Split(Convert.ToChar(";"));
                foreach (string s in stringArray)
                {
                    if (!Regex.IsMatch(s, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"))
                    {
                        CustomValidator1.IsValid = false;
                        CustomValidator1.ErrorMessage = "Email <b>\"" + strEmail + "\"</b> sai định dạng email.";
                        lblEmailMessage.Text = "";
                    }
                    else
                    {
                        CustomValidator2.IsValid = true;
                        //CustomValidator2.ForeColor = Color.Green;
                        CustomValidator1.IsValid = true;
                        lblEmailMessage.Text = "Email <b>\"" + strEmail + "\"</b> có thể sử dụng.";
                    }
                }
            }
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
        }
        else
            lblEmailMessage.Text = "";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            var oAddressBook = new AddressBook();
            var FirstName = txtFullNameRegister.Text.Trim();
            var Email = txtEmailRegister.Text.Trim();
            var UserName = txtEmailRegister.Text.Trim();
            var Password = txtPasswordRegister.Text.Trim();
            var IsPrimary = "True";
            var IsPrimaryBilling = "True";
            var IsPrimaryShipping = "True";
            var RoleName = "member";
            //var Gender = rdbGender.SelectedValue;
            //DateTime strDateOfBirth = new DateTime(Convert.ToInt32(ddlYear.SelectedItem.Text), Convert.ToInt32(ddlMonth.SelectedItem.Text), Convert.ToInt32(ddlDay.SelectedItem.Text));
            //string Birthday = strDateOfBirth.ToString("MM/dd/yyyy");
            bool bError = false;
            if (!string.IsNullOrEmpty(UserName))
            {
                if (Membership.GetUser(UserName) != null)
                {
                    CustomValidator2.ErrorMessage = "<b>+ Tên truy cập " + UserName + " đã được đăng ký sử dụng, vui lòng chọn tên khác</b>";
                    CustomValidator2.IsValid = false;
                    bError = true;
                }
                else
                    CustomValidator2.IsValid = true;
            }
            if (!bError)
            {
                Membership.CreateUser(UserName, Password, Email);
                Roles.AddUserToRole(UserName, RoleName);
                //var oUser = new User();
                //oUser.UserInsert(UserName, Password, Email, Role);
                oAddressBook.AddressBookInsert(
                    FirstName,
                    "",
                    Email,
                    "",
                    "",
                    "",
                    //ReceiveEmail,
                    UserName,
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    IsPrimary,
                    IsPrimaryBilling,
                    IsPrimaryShipping,
                    RoleName
                    );
                if (ckbNewsletter.Checked)
                {
                    var oNewletter = new Newsletter();
                    oNewletter.NewsletterInsert(Email);
                }
                FormsAuthentication.SetAuthCookie(UserName, true);
                //pnlSuccess.Visible = true;
                Session["UserName"] = UserName;
                //var CC = "order@pandemos.vn";
                var Subject = "Đăng ký tài khoản thành công/Thanks for Registering";
                //var OrderCode = OrderID;
                string Host = "118.69.199.203";
                int Port = 25;
                string From = "customerservice@pandemos.vn";
                string mPassword = "pandemos@2014";
                string Body = "<div style='width: 100%; font-size: 11px; font-family: Arial;'>";
                Body += "<h3 style='color: rgb(204,102,0); font-size: 22px; border-bottom-color: gray; border-bottom-width: 1px;border-bottom-style: dashed; margin-bottom: 20px; font-family: Times New Roman;'>";
                Body += "Cảm ơn bạn đã đăng ký tài khoản/Thanks for Registering";
                Body += "</h3>";
                Body += "<div style='font-family: Verdana; font-size: 11px; margin-bottom: 20px;'>";
                Body += "<p>Xin chào " + FirstName + "/Hi " + FirstName + ",</p>";
                Body += "<p>Cảm ơn bạn đã đăng ký tài khoản tại EZStore/ Many thanks for registering at EZStore</p>";
                Body += "<p>Thông tin đăng nhập của bạn như sau/ Your login detail is as follow:</p>";
                Body += "<p>Email: <b>" + Email + "</b></p>";
                Body += "<p>Mật khẩu/Password: <b>" + Password + "</b></p>";
                Body += "<p>Mọi thắc mắc, xin vui lòng liên hệ với chúng tôi qua email: <a href='mailto:support@zanado.com'>support@zanado.com</a> /If you have any enquiries, please email us on <a href='mailto:support@zanado.com'>support@zanado.com</a></p>";
                Body += "<p>Chúc bạn có những thời khắc ngọt ngào với Lady fashion/ We hope you have great expericences with Lady fashion</p>";
                Body += "</div>";
                Body += "<div style='font-family:Verdana;font-size:12px;margin-top:10px;'>";
                Body += "<div style='font-size:16px;font-weight:bold;'>=================</div>";
                Body += "<h4 style='font-size:14px;font-family:Verdana;margin:0;padding:0;'>Lady fashion</h4>";
                Body += "<div style='font-size:11px;font-family:Verdana;margin-top:5px;padding:0;margin:0;'>";
                Body += "<p>Add: 1278 Quang Trung, Phường 14, Quận Gò Vấp, TP.HCM</p>";
                Body += "<p>Tel: 08 386 569 - 0906 211 611</p>";
                //Body += "<p>M: +84 908 xxx xxx>";

                //Body += "<p>W: <a href='http://www.pandemos.vn'>www.pandemos.vn</a></p>";
                //Body += "<p>E: <a href='mailto:support@zanado.com'>support@zanado.com</a></p>";
                Body += "</div>";
                Body += "</div>";
                Body += "</div>";
                Common.SendMail(Host, Port, From, mPassword, Email, "", Subject, Body, false);

                //txtUserNameRegister.Text =

                txtEmailRegister.Text = "";
                txtPasswordRegister.Text = "";
                txtVerifyCode.Text = "";
                txtConfirmPassWordRegister.Text = "";
                //ddlYear.SelectedIndex = ddlDay.SelectedIndex = ddlMonth.SelectedIndex = -1;
                lblEmailMessage.Text = "";
                ckbSuccess.Checked = false;
                ckbNewsletter.Checked = false;
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "alert('Bạn đã đăng ký thành công!')", true);
                Response.Redirect("~/Default.aspx");
            }
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
        }
    }
    //protected void Login1_LoggedIn(object sender, EventArgs e)
    //{
    //    string UserName = Login1.UserName;
    //    MembershipUser mu = Membership.GetUser(UserName);
    //    bool bValid = Membership.ValidateUser(Login1.UserName, Login1.Password);
    //    var oAddressBook = new AddressBook();
    //    //Session["PWD"] = Login1.Password;
    //    if (UserName != null)
    //    {
    //        if (bValid)
    //        {
    //            Session["UserName"] = UserName;
    //            var a = oAddressBook.AddressBookSelectAll("", "", "", "", "", "", "", UserName, "", "", "", "", "", "", "", "", "", "", "", "member").DefaultView;
    //            Session["FullNameUser"] = a[0]["FirstName"].ToString();

    //            //if (Request.QueryString["ReturnURL"] != null)
    //            //{
    //            //    Response.Redirect(Request.QueryString["ReturnURL"]);
    //            //}
    //            //else
    //            //{
    //            //    string[] roleUser = Roles.GetRolesForUser(UserName.ToString());
    //            //    for (int i = 0; i < roleUser.Length; i++)
    //            //    {
    //            //        if (roleUser[i] == "admin")
    //            //        {
    //            //            Response.Redirect("ad/bilingual/");
    //            //        }
    //            //        else
    //            //        {
    //            //            Response.Redirect("~/");
    //            //        }
    //            //    }
    //            //}
    //            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
    //        }
    //        else
    //        {
    //            ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
    //        }
    //    }
    //}

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session["UserName"] = null;
        Session["Cart"] = null;
        FormsAuthentication.SignOut();
        Response.Redirect(Page.Request.Url.AbsolutePath);
    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        string UserName = txtUserName.Text;
        MembershipUser mu = Membership.GetUser(UserName);
        bool bValid = Membership.ValidateUser(UserName, txtPassword.Text);
        var oAddressBook = new AddressBook();
        //Session["PWD"] = Login1.Password;
        if (radioNon.Checked == true)
        {
            Session["IsBookNonLogin"] = "True";
            if (Session["Cart"] == null) { 
                Response.Redirect("~/");
            }
            else
            {
                Response.Redirect("dat-hang.aspx");
            }
        }
        else if (UserName != null)
        {
            if (bValid)
            {
                Session["UserName"] = UserName;
                var a = oAddressBook.AddressBookSelectAll("", "", "", "", "", "", "", UserName, "", "", "", "", "", "", "", "", "", "", "", "member").DefaultView;
                Session["FullNameUser"] = a[0]["FirstName"].ToString();

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
                            Response.Redirect("~/");
                        }
                    }
                }
            }
            else
            {
                lblErrorLogin.Text = "Đăng nhập không thành công, vui lòng thử lại.";
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
            }
        }
    }
    protected void btnNhanVoucher_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtEmailVoucher.Text))
        {
            var productVoucher = new ProductVoucher();

            if (productVoucher.ProductVoucherSelectByEmail(txtEmailVoucher.Text).DefaultView.Count > 0)
            {
                CustomValidator3.ErrorMessage = "Email <b>\"" + txtEmailVoucher.Text + "\"</b> đã nhận voucher!";
                CustomValidator3.IsValid = false;
                lblMessageVoucher.Text = "";
            }
            else if (productVoucher.ProductVoucherSelectAll("", "", "", "", "", "", "", "", "", "0", "0").DefaultView.Count > 0)
            {
                var voucherCon = productVoucher.ProductVoucherSelectAll("", "", "", "", "", "", "", "", "", "0", "0").DefaultView;
                string msg = "<h3>LADY Fashion: VOUCHER</h3><br/>";
                msg += "<b>Mã Voucher: </b>" + voucherCon[0]["VoucherCode"].ToString() + "<br />";
                Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", txtEmailVoucher.Text, "", "Voucher LADY Fashion", msg, true);
                productVoucher.ProductVoucherQuickUpdate(voucherCon[0]["VoucherCode"].ToString(), txtEmailVoucher.Text, "True", "False");
                CustomValidator3.IsValid = true;
            }
            else
            {
                CustomValidator3.ErrorMessage = "Đã hết voucher!";
                CustomValidator3.IsValid = false;
                lblMessageVoucher.Text = "";
            }

            txtEmailVoucher.Text = "";
        }
    }
    protected void btnSubmitSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("tim-kiem.aspx?kw=" + txtTextSearch.Text.Trim());
    }
}
