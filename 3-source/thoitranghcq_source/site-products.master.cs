using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class site_products : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strPriceFrom = Request.QueryString["pf"];
            string strPriceTo = Request.QueryString["pt"];
        }
    }

    protected void cblManufacturer_DataBound(object sender, EventArgs e)
    {
        string strManufacturerIDs = Request.QueryString["mans"];

        if (!string.IsNullOrEmpty(strManufacturerIDs))
        {
            var selectedManufacturer = from ListItem item in cblManufacturer.Items
                                       where strManufacturerIDs.Contains(item.Value)
                                       select item;

            foreach (ListItem item in selectedManufacturer)
                item.Selected = true;
        }
    }
    protected void cblProductColor_DataBound(object sender, EventArgs e)
    {
        string strProductColorIDs = Request.QueryString["color"];

        if (!string.IsNullOrEmpty(strProductColorIDs))
        {
            var selectedProductColor = from ListItem item in cblProductColor.Items
                                       where strProductColorIDs.Contains(item.Value)
                                       select item;

            foreach (ListItem item in selectedProductColor)
                item.Selected = true;
        }
    }
    protected void cblProductMaterial_DataBound(object sender, EventArgs e)
    {
        string strProductMaterialIDs = Request.QueryString["matr"];

        if (!string.IsNullOrEmpty(strProductMaterialIDs))
        {
            var selectedProductMaterial = from ListItem item in cblProductMaterial.Items
                                       where strProductMaterialIDs.Contains(item.Value)
                                       select item;

            foreach (ListItem item in selectedProductMaterial)
                item.Selected = true;
        }
    }
    protected void cblProductStyle_DataBound(object sender, EventArgs e)
    {
        string strProductStyleIDs = Request.QueryString["prot"];

        if (!string.IsNullOrEmpty(strProductStyleIDs))
        {
            var selectedProductStyle = from ListItem item in cblProductStyle.Items
                                          where strProductStyleIDs.Contains(item.Value)
                                          select item;

            foreach (ListItem item in selectedProductStyle)
                item.Selected = true;
        }
    }
    protected void cblManufacturer_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string page = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/") + 1);
        string strManufacturerIDs = "";
        string strProductColorIDs = string.IsNullOrEmpty(Request.QueryString["color"]) ? "" : Request.QueryString["color"];
        string strProductMaterialIDs = string.IsNullOrEmpty(Request.QueryString["matr"]) ? "" : Request.QueryString["matr"];
        string strProductStyleIDs = string.IsNullOrEmpty(Request.QueryString["prot"]) ? "" : Request.QueryString["prot"];
        var strProductCategory = string.IsNullOrEmpty(Request.QueryString["pci"]) ? "" : Request.QueryString["pci"];

        var selectedManufacturer = from ListItem item in cblManufacturer.Items
                                   where item.Selected
                                   select item.Value;
        foreach (string strManufacturerID in selectedManufacturer)
            strManufacturerIDs += "," + strManufacturerID;
        strManufacturerIDs = string.IsNullOrEmpty(strManufacturerIDs) ? "" : strManufacturerIDs.Remove(0, 1);

        Response.Redirect("~/tim-kiem.aspx?search=1&mans=" + strManufacturerIDs + "&color=" + strProductColorIDs + "&matr=" + strProductMaterialIDs + "&prot=" + strProductStyleIDs + "&pci=" + strProductCategory);
    }
    protected void cblProductColor_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strManufacturerIDs = string.IsNullOrEmpty(Request.QueryString["mans"]) ? "" : Request.QueryString["mans"]; ;
        string strProductColorIDs = "";
        string strProductMaterialIDs = string.IsNullOrEmpty(Request.QueryString["matr"]) ? "" : Request.QueryString["matr"];
        string strProductStyleIDs = string.IsNullOrEmpty(Request.QueryString["prot"]) ? "" : Request.QueryString["prot"];
        var strProductCategory = string.IsNullOrEmpty(Request.QueryString["pci"]) ? "" : Request.QueryString["pci"];

        var selectedProductColor = from ListItem item in cblProductColor.Items
                                   where item.Selected
                                   select item.Value;
        foreach (string strProductColor in selectedProductColor)
            strProductColorIDs += "," + strProductColor;
        strProductColorIDs = string.IsNullOrEmpty(strProductColorIDs) ? "" : strProductColorIDs.Remove(0, 1);

        Response.Redirect("~/tim-kiem.aspx?search=1&mans=" + strManufacturerIDs + "&color=" + strProductColorIDs + "&matr=" + strProductMaterialIDs + "&prot=" + strProductStyleIDs + "&pci=" + strProductCategory);
    }
    protected void cblProductMaterial_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strManufacturerIDs = string.IsNullOrEmpty(Request.QueryString["mans"]) ? "" : Request.QueryString["mans"]; ;
        string strProductColorIDs = string.IsNullOrEmpty(Request.QueryString["color"]) ? "" : Request.QueryString["color"];
        string strProductMaterialIDs = "";
        string strProductStyleIDs = string.IsNullOrEmpty(Request.QueryString["prot"]) ? "" : Request.QueryString["prot"];
        var strProductCategory = string.IsNullOrEmpty(Request.QueryString["pci"]) ? "" : Request.QueryString["pci"];

        var selectedProductMaterial = from ListItem item in cblProductMaterial.Items
                                   where item.Selected
                                   select item.Value;
        foreach (string strProductMaterial in selectedProductMaterial)
            strProductMaterialIDs += "," + strProductMaterial;
        strProductMaterialIDs = string.IsNullOrEmpty(strProductMaterialIDs) ? "" : strProductMaterialIDs.Remove(0, 1);

        Response.Redirect("~/tim-kiem.aspx?search=1&mans=" + strManufacturerIDs + "&color=" + strProductColorIDs + "&matr=" + strProductMaterialIDs + "&prot=" + strProductStyleIDs + "&pci=" + strProductCategory);
    }
    protected void cblProductStyle_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strManufacturerIDs = string.IsNullOrEmpty(Request.QueryString["mans"]) ? "" : Request.QueryString["mans"]; ;
        string strProductColorIDs = string.IsNullOrEmpty(Request.QueryString["color"]) ? "" : Request.QueryString["color"];
        string strProductMaterialIDs = string.IsNullOrEmpty(Request.QueryString["matr"]) ? "" : Request.QueryString["matr"]; ;
        string strProductStyleIDs = "";
        var strProductCategory = string.IsNullOrEmpty(Request.QueryString["pci"]) ? "" : Request.QueryString["pci"];

        var selectedProductStyle = from ListItem item in cblProductStyle.Items
                                      where item.Selected
                                      select item.Value;
        foreach (string strProductStyle in selectedProductStyle)
            strProductStyleIDs += "," + strProductStyle;
        strProductStyleIDs = string.IsNullOrEmpty(strProductStyleIDs) ? "" : strProductStyleIDs.Remove(0, 1);

        Response.Redirect("~/tim-kiem.aspx?search=1&mans=" + strManufacturerIDs + "&color=" + strProductColorIDs + "&matr=" + strProductMaterialIDs + "&prot=" + strProductStyleIDs + "&pci=" + strProductCategory);
    }
}
