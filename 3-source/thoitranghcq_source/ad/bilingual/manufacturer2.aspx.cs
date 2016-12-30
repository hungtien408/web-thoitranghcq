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

public partial class ad_single_province : System.Web.UI.Page
{
    #region Common Method

    void DeleteImage(string strImageName)
    {
        if (!string.IsNullOrEmpty(strImageName))
        {
            var strImagePath = Server.MapPath("~/res/manufacturer/" + strImageName);
            var strThumbImagePath = Server.MapPath("~/res/manufacturer/thumbs/" + strImageName);

            if (File.Exists(strImagePath))
                File.Delete(strImagePath);
            if (File.Exists(strThumbImagePath))
                File.Delete(strThumbImagePath);
        }
    }

    #endregion

    #region Event

    protected void DropDownList_DataBound(object sender, EventArgs e)
    {
        var cbo = (RadComboBox)sender;
        cbo.Items.Insert(0, new RadComboBoxItem("--Chọn--"));
    }

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
        else if (e.Item is GridPagerItem)
        {
            GridPagerItem gridPager = e.Item as GridPagerItem;
            Control numericPagerControl = gridPager.GetNumericPager();

            Control placeHolder = gridPager.FindControl("NumericPagerPlaceHolder");
            placeHolder.Controls.Add(numericPagerControl);
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
            ObjectDataSource1.SelectParameters["ManufacturerName"].DefaultValue = value;
            ObjectDataSource1.DataBind();
            RadGrid1.Rebind();
        }
        else if (e.CommandName == "QuickUpdate")
        {
            string ManufacturerID, Priority, IsAvailable;
            var oManufacturer = new Manufacturer();

            foreach (GridDataItem item in RadGrid1.Items)
            {
                ManufacturerID = item.GetDataKeyValue("ManufacturerID").ToString();
                Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();

                oManufacturer.ManufacturerQuickUpdate(
                    ManufacturerID,
                    IsAvailable,
                    Priority
                    );
            }
        }
        else if (e.CommandName == "PerformInsert" || e.CommandName == "Update")
        {
            var command = e.CommandName;
            var row = command == "PerformInsert" ? (GridEditFormInsertItem)e.Item : (GridEditFormItem)e.Item;
            var FileImageName = (RadUpload)row.FindControl("FileImageName");

            string ManufacturerID = ((HiddenField)row.FindControl("hdnManufacturerID")).Value;
            string OldImageName = ((HiddenField)row.FindControl("hdnOldImageName")).Value;
            string ImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
            string ManufacturerName = ((RadTextBox)row.FindControl("txtManufacturerName")).Text.Trim();
            string ConvertedManufacturerName = Common.ConvertTitle(ManufacturerName);
            string strIsAvailable = ((CheckBox)row.FindControl("chkIsAvailable")).Checked.ToString();
            string ManufacturerNameEn = "";
            string Priority = ((RadNumericTextBox)row.FindControl("txtPriority")).Text.Trim();

            if (e.CommandName == "PerformInsert")
            {
                Manufacturer oManufacturer = new Manufacturer();
                ImageName = oManufacturer.ManufacturerInsert(ImageName, ConvertedManufacturerName, ManufacturerName, ManufacturerNameEn, strIsAvailable, Priority);
                ManufacturerID = oManufacturer.ManufacturerID;

                string strFullPath = "~/res/manufacturer/" + ImageName;
                if (!string.IsNullOrEmpty(ImageName))
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 277, 230);
                    ResizeCropImage.CreateThumbNailByCondition("~/res/manufacturer/", "~/res/manufacturer/thumbs/", ImageName, 120, 120);
                }

                //ObjectDataSource1.InsertParameters["IsAvailable"].DefaultValue = strIsAvailable;
                //ObjectDataSource1.InsertParameters["ManufacturerNameEn"].DefaultValue = ManufacturerNameEn;
            }
            else
            {
                var strOldImagePath = Server.MapPath("~/res/manufacturer/" + OldImageName);
                var strOldThumbImagePath = Server.MapPath("~/res/manufacturer/thumbs/" + OldImageName);

                ObjectDataSource1.UpdateParameters["ConvertedProductName"].DefaultValue = ConvertedManufacturerName;
                ObjectDataSource1.UpdateParameters["ImageName"].DefaultValue = ImageName;
                ObjectDataSource1.UpdateParameters["ManufacturerName"].DefaultValue = ManufacturerName;
                ObjectDataSource1.UpdateParameters["IsAvailable"].DefaultValue = strIsAvailable;
                ObjectDataSource1.UpdateParameters["ManufacturerNameEn"].DefaultValue = ManufacturerNameEn;

                if (!string.IsNullOrEmpty(ImageName))
                {
                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);
                    if (File.Exists(strOldThumbImagePath))
                        File.Delete(strOldThumbImagePath);

                    ImageName = (string.IsNullOrEmpty(ConvertedManufacturerName) ? "" : ConvertedManufacturerName + "-") + ManufacturerID + ImageName.Substring(ImageName.LastIndexOf('.'));

                    string strFullPath = "~/res/manufacturer/" + ImageName;

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 277, 230);
                    ResizeCropImage.CreateThumbNailByCondition("~/res/manufacturer/", "~/res/manufacturer/thumbs/", ImageName, 120, 120);
                }
            }
        }
        else if (e.CommandName == "DeleteSelected")
        {
            string OldImageName;
            var oManufacturer = new Manufacturer();
            string errorList = "", ManufacturerName = "";

            foreach (GridDataItem item in RadGrid1.SelectedItems)
            {
                try
                {
                    var ManufacturerID = item.GetDataKeyValue("ManufacturerID").ToString();
                    ManufacturerName = item["ManufacturerName"].Text;
                    oManufacturer.ManufacturerDelete(ManufacturerID);

                    OldImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;
                    DeleteImage(OldImageName);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                    if (ex.Message == ((int)ErrorNumber.ConstraintConflicted).ToString())
                        errorList += ", " + ManufacturerName;
                }
            }
            if (!string.IsNullOrEmpty(errorList))
            {
                e.Canceled = true;
                string strAlertMessage = "Tỉnh/Thành <b>\"" + errorList.Remove(0, 1).Trim() + " \"</b> đang chứa Quận/Huyện.<br /> Xin xóa Quận/Huyện trong Tỉnh/Thành này hoặc thiết lập hiển thị = \"không\".";
                lblError.Text = strAlertMessage;
            }
        }
        else if (e.CommandName == "DeleteImage")
        {
            var oManufacturer = new Manufacturer();
            var lnkDeleteImage = (LinkButton)e.CommandSource;
            var s = lnkDeleteImage.Attributes["rel"].ToString().Split('#');
            var strManufacturerID = s[0];
            var ImageName = s[1];

            oManufacturer.ManufacturerImageDelete(strManufacturerID);
            DeleteImage(ImageName);
            RadGrid1.Rebind();
        }
    }

    #endregion
}