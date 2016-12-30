using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class product_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProduct = new Product();
                var dv = oProduct.ProductSelectOne(Request.QueryString["pi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTittle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                //hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
            }
            else
            {
                strTitle = strMetaTitle = "Hàng Mới Về";
                strDescription = "";
                strMetaDescription = "";
            }
            Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
            var meta = new HtmlMeta() { Name = "description", Content = !string.IsNullOrEmpty(strMetaDescription) ? strMetaDescription : strDescription };
            Header.Controls.Add(meta);

            lblName.Text = strTitle;
        }
    }
    [WebMethod]
    public static string LoadSize(
        string ProductColorID,
        string ProductID
        )
    {
        var oProductColorSize = new ProductSizeColor();
        var dv = oProductColorSize.ProductSizeColorSelectAll("", ProductColorID, ProductID, "True", "True", "", "True").DefaultView;
        //string s = "<option value='0'>- Chọn -</option>";
        string s = "";
        if (dv.Count > 0)
        {
            foreach (DataRow row in dv.Table.Rows)
                //s += "<option value='" + row["ProductLengthID"] + "'>" + row["ProductLengthName"].ToString().Trim() +
                //     "</option>";
                //s += "<div class='items'><span>" + row["ProductLengthName"].ToString().Trim() + "</span></div>";
                s += "<div productlengthid='" + row["ProductLengthID"].ToString().Trim() + "' productlengthname='" + row["ProductLengthName"].ToString().Trim() + "' class='items'><span>" + row["ProductLengthName"].ToString().Trim() + "</span></div>";
        }
        return s;
    }
    [WebMethod]
    public static string LoadQuantity(
        string ProductSizeID,
        string ProductColorID,
        string ProductID
        )
    {
        string s = "<option value='0'>- Chọn -</option>";
        int SizeColorQuantity = 0;
        int iQuantity = 10;
        var oProductColorSize = new ProductSizeColor();
        var dv = oProductColorSize.ProductSizeColorSelectAll(ProductSizeID, ProductColorID, ProductID, "True", "True", "", "True").DefaultView;

        SizeColorQuantity = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());

        for (int i = 1; i <= iQuantity; i++)
            s += "<option value='" + i + "'>" + i + "</option>";
        return s;
    }
    [WebMethod]
    public static int LoadQuantity1(
        string ProductSizeID,
        string ProductColorID,
        string ProductID
        )
    {
        int s = 0;
        int SizeColorQuantity = 0;
        var oProductColorSize = new ProductSizeColor();
        var dv = oProductColorSize.ProductSizeColorSelectAll(ProductSizeID, ProductColorID, ProductID, "True", "True", "", "True").DefaultView;
        SizeColorQuantity = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
        s = SizeColorQuantity;
        return s;
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }

    protected void lstProductDetail_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        var item = e.Item as ListViewDataItem;
        var cmd = e.CommandName;
        var ProductOptionCategoryID = (item.FindControl("hdnProductOptionCategoryID") as HiddenField).Value;
        var ProductOptionCategoryName = (item.FindControl("hdnProductOptionCategoryName") as HiddenField).Value;
        var ProductID = (item.FindControl("hdnProductID") as HiddenField).Value;
        var ProductName = (item.FindControl("lblProductName") as Label).Text;
        var ProductNameEn = (item.FindControl("lblProductNameEn") as Label).Text;
        var ImageName = (item.FindControl("hdnImageName") as HiddenField).Value;
        var ProductCode = (item.FindControl("hdnProductCode") as HiddenField).Value;
        var ProductLengthID = (item.FindControl("hdnProductLengthID") as HiddenField).Value;
        var ProductLengthName = (item.FindControl("hdnProductLengthName") as HiddenField).Value;
        var Quantity = (item.FindControl("inQuantity") as TextBox).Text;//(item.FindControl("hdnQuantitySale") as HiddenField).Value;
        double Price = Convert.ToDouble((item.FindControl("hdnPrice") as HiddenField).Value);
        string ProductSizeColorID1 = "";
        string QuantityList = "";
        int SizeColorQuantity1 = 0;
        var oProductSizeColor = new ProductSizeColor();
        if (cmd == "AddToCart")
        {
            if (Session["UserName"] != null || Session["IsBookNonLogin"] != null)
            {
                if (ProductID != "" && ProductLengthID != "" && ProductLengthID != "")
                {
                    var dv = oProductSizeColor.ProductSizeColorSelectAll(ProductLengthID, ProductOptionCategoryID, ProductID, "True",
                                                                     "True", "", "True").DefaultView;
                    ProductSizeColorID1 = dv[0]["ProductSizeColorID"].ToString();
                    SizeColorQuantity1 = Convert.ToInt32(dv[0]["Quantity"].ToString()) - Convert.ToInt32(dv[0]["QuantitySale"].ToString());
                    for (int i = 1; i <= SizeColorQuantity1; i++)
                    {
                        QuantityList = QuantityList + i + ",";
                    }
                    //QuantityList = QuantityList.Remove(QuantityList.Length - 1);
                }
                var oShoppingCart = new ShoppingCart2();
                oShoppingCart.CreateCart(ProductID,
                    ImageName,
                    ProductName,
                    ProductNameEn,
                    ProductCode,
                    ProductOptionCategoryID,
                    ProductOptionCategoryName,
                    ProductLengthID,
                    ProductLengthName,
                    ProductSizeColorID1,
                    Quantity,
                    SizeColorQuantity1.ToString(),
                    Price,
                    false
                    );
                //Common.ShowAlert(ProductLengthID);
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", "myconfirmPopup('" + "<strong>" + ProductName + " - " + ProductCode + " - " + ProductOptionCategoryName + "</strong><br/> đã được thêm vào giỏ hàng" + "')", true);
                //ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.cart img').trigger('click');});", true);
                Response.Redirect("dat-hang.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "runtime", " $(document).ready(function () {$('.log img').trigger('click');});", true);
            }
        }
    }
}