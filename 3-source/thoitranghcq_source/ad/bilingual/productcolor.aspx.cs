using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using TLLib;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Data;


public partial class ad_single_ProductColor : System.Web.UI.Page
{
    #region Common Method

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem(""));
    }

    void DeleteImage(string strProductColorImages)
    {
        if (!string.IsNullOrEmpty(strProductColorImages))
        {
            string strOldImagePath = Server.MapPath("~/res/ProductColor/" + strProductColorImages);
            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridCommandItem)
        {
            GridCommandItem commandItem = (e.Item as GridCommandItem);
            PlaceHolder container = (PlaceHolder)commandItem.FindControl("PlaceHolder1");
            Label label = new Label();
            label.Text = "&nbsp;&nbsp;";

            container.Controls.Add(label);

            for (int i = 65; i <= 65 + 25; i++)
            {
                LinkButton linkButton1 = new LinkButton();

                LiteralControl lc = new LiteralControl("&nbsp;&nbsp;");

                linkButton1.Text = "" + (char)i;

                linkButton1.CommandName = "alpha";
                linkButton1.CommandArgument = "" + (char)i;

                container.Controls.Add(linkButton1);
                container.Controls.Add(lc);
            }

            LiteralControl lcLast = new LiteralControl("&nbsp;");
            container.Controls.Add(lcLast);

            LinkButton linkButtonAll = new LinkButton();
            linkButtonAll.Text = "Tất cả";
            linkButtonAll.CommandName = "NoFilter";
            container.Controls.Add(linkButtonAll);
        }
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "alpha" || e.CommandName == "NoFilter")
        {
            String value = null;
            switch (e.CommandName)
            {
                case ("alpha"):
                    {
                        value = string.Format("{0}%", e.CommandArgument);
                        break;
                    }
                case ("NoFilter"):
                    {
                        value = "%";
                        break;
                    }
            }
            ObjectDataSource1.SelectParameters["ProductColorName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "DeleteSelected")
        {
            var oProductColor = new ProductColor();

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                string strProductColorImages = ((HiddenField)item.FindControl("hdnProductColorImages")).Value;

                if (!string.IsNullOrEmpty(strProductColorImages))
                {
                    string strSavePath = Server.MapPath("~/res/productcolor/" + strProductColorImages);
                    if (File.Exists(strSavePath))
                        File.Delete(strSavePath);
                }
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileProductColorImages = (RadUpload)row.FindControl("FileProductColorImages");

            string strProductColorName = ((TextBox)row.FindControl("txtProductColorName")).Text.Trim();
            string strProductColorDescription = ((TextBox)row.FindControl("txtProductColorDescription")).Text.Trim();
            string strConvertedProductColorName = Common.ConvertTitle(strProductColorName);
            string strProductColorImages = FileProductColorImages.UploadedFiles.Count > 0 ? FileProductColorImages.UploadedFiles[0].GetName() : "";
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
         
            var oProductColor = new ProductColor();

            if (e.CommandName == "PerformInsert")
            {
                strProductColorImages = oProductColor.ProductColorInsert(
                    strProductColorName,
                    strProductColorImages,
                    strConvertedProductColorName,
                    strProductColorDescription,
                    strIsAvailable
                    );
                string strFullPath = "~/res/productcolor/" + strProductColorImages;

                if (!string.IsNullOrEmpty(strProductColorImages))
                {
                    FileProductColorImages.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                }
                RadGrid1.Rebind();
            }
            else
            {
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;
                var strProductColorID = row.GetDataKeyValue("ProductColorID").ToString();
                var strOldProductColorImages = ((HiddenField)row.FindControl("hdnProductColorImages")).Value;
                var strOldImagePath = Server.MapPath("~/res/productcolor/" + strOldProductColorImages);
               oProductColor.ProductColorUpdate(
                   strProductColorID,
                  strProductColorName,
                  strProductColorImages,
                  strConvertedProductColorName,
                  strProductColorDescription,
                  strIsAvailable
                  );
                //dsUpdateParam["ProductColorName"].DefaultValue = strProductColorName;
                //dsUpdateParam["ProductColorDescription"].DefaultValue = strProductColorDescription;
                //dsUpdateParam["ConvertedProductColorName"].DefaultValue = strConvertedProductColorName;
                //dsUpdateParam["ProductColorImages"].DefaultValue = strProductColorImages;
                //dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;

                if (!string.IsNullOrEmpty(strProductColorImages))
                {
                    var strFullPath = "~/res/productcolor/" + strConvertedProductColorName + "-" + strProductColorID + strProductColorImages.Substring(strProductColorImages.LastIndexOf('.'));

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);

                    FileProductColorImages.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 200, 200);
                }
            }
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditableItem && e.Item.IsInEditMode)
        {
            var itemtype = e.Item.ItemType;
            var row = itemtype == GridItemType.EditFormItem ? (GridEditFormItem)e.Item : (GridEditFormInsertItem)e.Item;
            var FileProductColorImages = (RadUpload)row.FindControl("FileProductColorImages");

            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileProductColorImages.ClientID));
        }
    }
    #endregion
}