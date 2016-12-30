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

public partial class products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (((DataView)odsProducts.Select()).Count <= DataPager1.PageSize)
            {
                DataPager1.Visible = false;
            }

            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["pci"]))
            {
                var oProductCategory = new ProductCategory();
                var dv = oProductCategory.ProductCategorySelectOne(Request.QueryString["pci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];

                strTitle = Server.HtmlDecode(row["ProductCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

                hdnSanPham.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-pci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
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
            lblName2.Text = strTitle;
            //lblSanPham1.Text = strTitle;
            //lblSanPham2.Text = strTitle;
        }
    }
    protected string progressTitle(object input)
    {
        return TLLib.Common.ConvertTitle(input.ToString());
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int liStartIndex = DropDownList1.SelectedItem.Value.IndexOf(":") + 1;
        //int liLength = DropDownList1.SelectedItem.Value.Length - liStartIndex;
        var dsSelectParam = odsProducts.SelectParameters;

        if (DropDownList1.SelectedItem.Value == "2")
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsPopular"].DefaultValue = "True";

        }
        else if (DropDownList1.SelectedItem.Value == "3")
        {
            dsSelectParam["IsNew"].DefaultValue = "True";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsPopular"].DefaultValue = "";
        }
        else if (DropDownList1.SelectedItem.Value == "4")
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "True";
            dsSelectParam["IsPopular"].DefaultValue = "";
        }
        else
        {
            dsSelectParam["IsNew"].DefaultValue = "";
            dsSelectParam["IsBestSeller"].DefaultValue = "";
            dsSelectParam["IsPopular"].DefaultValue = "";
        }

        if (((DataView)odsProducts.Select()).Count <= DataPager1.PageSize)
        {
            DataPager1.Visible = false;
        }
        else
        {
            DataPager1.Visible = true;
        }
    }
    protected void chkPrice_SelectedIndexChanged(object sender, EventArgs e)
    {
        var dsSelectParam = odsProducts.SelectParameters;

        if (chkPrice.SelectedItem.Value == "1")
        {
            dsSelectParam["PriceFrom"].DefaultValue = "0";
            dsSelectParam["PriceTo"].DefaultValue = "200000";
        }
        else if (chkPrice.SelectedItem.Value == "2")
        {
            dsSelectParam["PriceFrom"].DefaultValue = "200000";
            dsSelectParam["PriceTo"].DefaultValue = "300000";
        }
        else if (chkPrice.SelectedItem.Value == "3")
        {
            dsSelectParam["PriceFrom"].DefaultValue = "500000";
            dsSelectParam["PriceTo"].DefaultValue = "1000000";
        }
    }

}