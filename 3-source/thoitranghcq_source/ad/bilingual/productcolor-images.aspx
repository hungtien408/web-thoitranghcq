﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/inside.master" AutoEventWireup="true"
    CodeFile="productcolor-images.aspx.cs" Inherits="ad_single_productphotoalbum" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style type="text/css">
        .myClass:hover
        {
            background-color: #a1da29 !important;
        }
        .txt
        {
            border: 0px !important;
            background: #eeeeee !important;
            color: Black !important;
            margin-left: 25%;
            margin-right: auto;
            width: 100%;
            filter: alpha(opacity=50); /* IE's opacity*/
            opacity: 0.50;
            text-align: center;
            display: block;
        }
    </style>
    <script type="text/javascript">
        // <![CDATA[
        //On insert and update buttons click temporarily disables ajax to perform upload actions
        function conditionalPostback(sender, eventArgs) {
            var theRegexp = new RegExp("\.lnkUpdate$|\.lnkUpdateTop$|\.PerformInsertButton$", "ig");
            if (eventArgs.get_eventTarget().match(theRegexp)) {
                var upload = $find(window['UploadId']);

                //AJAX is disabled only if file is selected for upload
                if (upload.getFileInputs()[0].value != "") {
                    eventArgs.set_enableAjax(false);
                }
            }
            else if (eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToWordButton") >= 0 || eventArgs.get_eventTarget().indexOf("ExportToPdfButton") >= 0)
                eventArgs.set_enableAjax(false);
        }

        function validateRadUpload(source, e) {
            e.IsValid = false;

            var upload = $find(source.parentNode.getElementsByTagName('div')[0].id);
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                //check for empty string or invalid extension
                if (upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }

        function containerMouseover(sender) {
            sender.getElementsByTagName("div")[0].style.display = "";
        }
        function containerMouseout(sender) {
            sender.getElementsByTagName("div")[0].style.display = "none";
        }
            // ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <fieldset>
        <h3 class="searchTitle">
            Thông Tin Màu Sắc</h3>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource2" EnableModelValidation="True"
            Width="100%">
            <ItemTemplate>
                <div class="mInfo" style="min-width: 800px">
                    <table class="search" style="border: 0">
                        <tr>
                            <td class="left">
                                Mã Màu:
                            </td>
                            <td style="min-width: 100px">
                                <asp:Label ID="lblProductOptionCategoryName" runat="server" Text='<%# Eval("ProductOptionCategoryName")%>'></asp:Label>
                            </td>
                            <td>
                                <img id="Img1" alt="" src='<%# "~/res/productoptioncategory/" + Eval("ImageName") %>'
                                    runat="server" visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' />
                                <div style='background: <%#  Eval("ProductOptionCategoryName")%>; width: 30px; height: 30px;'></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="ProductOptionCategorySelectOne"
            TypeName="TLLib.ProductOptionCategory">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductOptionCategoryID" QueryStringField="poi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </fieldset>
    <br />
    <asp:RadAjaxPanel runat="server" ID="RadAjaxPanel1" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadListView runat="server" ID="RadListView1" PageSize="21" DataSourceID="ObjectDataSource1"
            AllowPaging="True" DataKeyNames="ProductOptionID" OverrideDataSourceControlSorting="True"
            OnItemCreated="RadListView1_ItemCreated" OnItemCommand="RadListView1_ItemCommand">
            <LayoutTemplate>
                <div id="list">
                    <asp:Panel runat="server" ID="Panel1" Style="float: left; margin-left: 160px" Visible="<%#Container.PageCount > 1 %>">
                        <asp:RadButton runat="server" ID="PrevButton" CommandName="Page" CommandArgument="Prev"
                            Text="Trang trước" Enabled="<%#Container.CurrentPageIndex > 0 %>" />
                        <asp:RadButton runat="server" ID="NextButton" CommandName="Page" CommandArgument="Next"
                            Text="Trang kế" Enabled="<%#Container.CurrentPageIndex < Container.PageCount - 1 %>" />
                    </asp:Panel>
                    <table width="100%" class="command" style="border-collapse: collapse">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkAdd" runat="server" CommandName="InitInsert" CssClass="item"
                                    ForeColor="Green"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                                <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" CssClass="item"
                                    ForeColor="Green"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>|
                                <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa tất cả dòng đã chọn?')"
                                    runat="server" CommandName="DeleteSelected" CssClass="item" ForeColor="Green"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                                <%--<asp:CheckBox ID="chkSelectAll" Text="Chọn tất cả" runat="server" CssClass="checkbox selectall"
                                    onchange="if($(this).find('input:checkbox').attr('checked') == true) $('.select > input:checkbox').attr('checked','checked');else $('.select > input:checkbox').removeAttr('checked');" />--%>
                                <input id="chkSelectAll" type="checkbox" class="checkbox selectall" onchange="if($(this).attr('checked') == true) $('.select > input:checkbox').attr('checked','checked');else $('.select > input:checkbox').removeAttr('checked');" />Chọn
                                tất cả
                            </td>
                            <td align="right">
                                <asp:RadSlider runat="server" ID="RadSlider1" MaximumValue="3" MinimumValue="1" Value="1"
                                    LiveDrag="false" SmallChange="1" AutoPostBack="true" OnValueChanged="RadSlider1_ValueChanged"
                                    Width="150px" CausesValidation="false" Skin="Office2007" />
                            </td>
                        </tr>
                    </table>
                    <div style="clear: both;">
                    </div>
                    <fieldset runat="server" id="itemPlaceholder" />
                    <div style="clear: both;">
                    </div>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                <fieldset style="float: left; margin: 5px 5px 50px 5px; padding: 2px 2px 2px 2px;
                    position: relative; background: #eeeeee" class="myClass" onmouseover="containerMouseover(this)"
                    onmouseout="containerMouseout(this)">
                    <%--<img alt="" src='<%# "~/res/productoption/" + Eval("ImageName") %>' width='<%#ImageWidth %>'
                            height='<%#ImageHeight %>' title="Click xem ảnh lớn" runat="server" />--%>
                    <a href='<%# "~/res/productoption/" + Eval("ImageName") %>' runat="server" class="lightbox">
                        <asp:RadBinaryImage Style="cursor: pointer; display: block;" runat="server" ID="RadBinaryImage1"
                            ImageUrl='<%# "~/res/productoption/" + Eval("ImageName") %>' Height='<%#ImageHeight %>'
                            Width="<%#ImageWidth %>" ResizeMode="Fit" AlternateText="Click xem ảnh lớn" ToolTip="Click xem ảnh lớn"
                            CssClass="aaa" />
                    </a>
                    <div style="margin-top: -30px; position: absolute; display: none; width: <%#ImageHeight.Value/1.5 %>px;">
                        <asp:Label ID="lblProductOptionTitle" runat="server" Text='<%# Eval("ProductOptionTitle") %>'
                            CssClass="txt"></asp:Label>
                    </div>
                    <table style="bottom: -25px; position: absolute; width: <%#ImageHeight.Value %>px;
                        border-collapse: collapse; font-size: 8pt" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="Chọn" CssClass="select vam checkbox"
                                    onchange="if($(this).find('input:checkbox').attr('checked') == false) $('.selectall').removeAttr('checked');" />
                                <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="60px" Text='<%# Eval("Priority") %>'
                                    EmptyMessage="Thứ tự..." Type="Number" ToolTip="Thứ tự">
                                    <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                </asp:RadNumericTextBox>
                                <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# string.IsNullOrEmpty(Eval("IsAvailable").ToString()) ? false : Eval("IsAvailable") %>'
                                    ToolTip="Hiển thị" TextAlign="Left" CssClass="checkbox vam" />
                            </td>
                            <td align="right">
                                <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="Edit" CssClass="item"><img width="14px" class="vam" alt="" title="Sửa" src="../assets/images/tools.png" /></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Xóa ảnh?')" runat="server"
                                    CommandName="Delete" CssClass="item"><img width="14px" class="vam" alt="" title="Xóa ảnh" src="../assets/images/trash.png" /></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </ItemTemplate>
            <InsertItemTemplate>
                <asp:Panel ID="Panel2" runat="server" DefaultButton="btnUpload">
                    <h3 class="searchTitle clear">
                        Thêm Ảnh Mới</h3>
                    <table class="search">
                        <tr>
                            <td class="left">
                                File ảnh
                            </td>
                            <td>
                                <asp:RadAsyncUpload ID="FileImageAlbum" runat="server" MultipleFileSelection="Automatic"
                                    TargetFolder="~/res/productoption/" TemporaryFolder="~/res/TempAsync/" Width="100%"
                                    AllowedFileExtensions="jpg,jpeg,gif,png" Localization-Select="Chọn" Localization-Cancel="Hủy"
                                    Localization-Remove="Xóa" OnFileUploaded="FileImageAlbum_FileUploaded">
                                </asp:RadAsyncUpload>
                                <span class="required">(Kích thước 486px x 487px)</span>
                            </td>
                        </tr>
                    </table>
                    <table class="search invisible">
                        <tr>
                            <td class="left">
                                File ảnh
                            </td>
                            <td>
                                <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                    Culture="vi-VN" Language="vi-VN" InputSize="70" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                    ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="left">
                                Tiêu đề ảnh
                            </td>
                            <td>
                                <asp:RadTextBox ID="txtTitle" EmptyMessage="Tiêu đề..." Width="500px" runat="server">
                                </asp:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="left" valign="top">
                                Mô tả
                            </td>
                            <td>
                                <asp:RadTextBox ID="txtDescription" EmptyMessage="Mô tả..." runat="server" Width="500px">
                                </asp:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="left">
                                Tiêu đề ảnh(En)
                            </td>
                            <td>
                                <asp:RadTextBox ID="txtTitleEn" Width="500px" EmptyMessage="Tiêu đề(En)..." runat="server">
                                </asp:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="left" valign="top">
                                Mô tả (En)
                            </td>
                            <td>
                                <asp:RadTextBox ID="txtDescriptionEn" runat="server" EmptyMessage="Mô tả (En)..."
                                    Width="500px">
                                </asp:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="left">
                                Thứ tự
                            </td>
                            <td>
                                <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                    EmptyMessage="Thứ tự..." Type="Number">
                                    <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                </asp:RadNumericTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="left" colspan="2">
                                <asp:CheckBox ID="chkAddIsAvailable" runat="server" Checked='<%# (Container is RadListViewInsertItem) ? true : Eval("IsAvailable")%>'
                                    Text="Hiển thị" CssClass="checkbox" />
                            </td>
                        </tr>
                    </table>
                    <div class="edit">
                        <hr />
                        <asp:RadButton ID="lnkUpdate" runat="server" Visible="False" CommandName='PerformInsert'
                            Text='Thêm'>
                            <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                        </asp:RadButton>
                        <asp:RadButton ID="btnUpload" runat="server" Text="Tải lên">
                            <Icon PrimaryIconUrl="~/ad/assets/images/up.png" />
                        </asp:RadButton>
                        &nbsp;&nbsp;
                        <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                            <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                        </asp:RadButton>
                    </div>
                    <div class="clear">
                    </div>
                </asp:Panel>
            </InsertItemTemplate>
            <EditItemTemplate>
                <asp:HiddenField ID="hdnProductOptionID" runat="server" Value='<%# Eval("ProductOptionID") %>' />
                <asp:HiddenField ID="hdnImageName" runat="server" Value='<%# Eval("ImageName") %>' />
                <asp:Panel ID="Panel2" runat="server" DefaultButton="lnkUpdate">
                    <h3 class="searchTitle clear">
                        Cập Nhật Ảnh</h3>
                    <table class="search">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="left">
                                            File ảnh
                                        </td>
                                        <td>
                                            <asp:RadUpload ID="FileImageName" runat="server" ControlObjectsVisibility="None"
                                                Culture="vi-VN" Language="vi-VN" InputSize="70" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                                ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            Tiêu đề ảnh
                                        </td>
                                        <td>
                                            <asp:RadTextBox ID="txtTitle" Width="500px" EmptyMessage="Tiêu đề..." runat="server"
                                                Text='<%# Bind("ProductOptionTitle") %>'>
                                            </asp:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr class="invisible">
                                        <td class="left" valign="top">
                                            Mô tả
                                        </td>
                                        <td>
                                            <asp:RadTextBox ID="txtDescription" Width="500px" EmptyMessage="Mô tả..." runat="server"
                                                Text='<%# Bind("Description") %>'>
                                            </asp:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr class="invisible">
                                        <td class="left">
                                            Tiêu đề ảnh(En)
                                        </td>
                                        <td>
                                            <asp:RadTextBox ID="txtTitleEn" Width="500px" runat="server" EmptyMessage="Tiêu đề (En)..."
                                                Text='<%# Bind("ProductOptionTitleEn") %>'>
                                            </asp:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr class="invisible">
                                        <td class="left" valign="top">
                                            Mô tả(En)
                                        </td>
                                        <td>
                                            <asp:RadTextBox ID="txtDescripttionEn" Width="500px" runat="server" EmptyMessage="Mô tả (En)..."
                                                Text='<%# Bind("DescriptionEn") %>'>
                                            </asp:RadTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                            Thứ tự
                                        </td>
                                        <td>
                                            <asp:RadNumericTextBox ID="txtPriority" runat="server" Width="500px" Text='<%# Bind("Priority") %>'
                                                EmptyMessage="Thứ tự..." Type="Number">
                                                <NumberFormat AllowRounding="false" DecimalDigits="0" GroupSeparator="." />
                                            </asp:RadNumericTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left" colspan="2">
                                            <asp:CheckBox ID="chkAddIsAvailable" runat="server" Checked='<%# (Container is RadListViewInsertItem) ? true : Eval("IsAvailable")%>'
                                                Text="Hiển thị" CssClass="checkbox" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td rowspan="5" valign="top">
                                <asp:RadBinaryImage Style="display: block;" runat="server" ID="RadBinaryImage1" ImageUrl='<%# "~/res/productoption/" + Eval("ImageName") %>'
                                    Height='150' Width="150" ResizeMode="Fit" />
                            </td>
                        </tr>
                    </table>
                    <div class="edit">
                        <hr />
                        <asp:RadButton ID="lnkUpdate" runat="server" CommandName='Update' Text='Cập nhật'>
                            <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                        </asp:RadButton>
                        &nbsp;&nbsp;
                        <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                            <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                        </asp:RadButton>
                    </div>
                    <div class="clear">
                    </div>
                </asp:Panel>
            </EditItemTemplate>
        </asp:RadListView>
        <asp:RadInputManager ID="RadInputManager1" runat="server">
            <asp:TextBoxSetting EmptyMessage="Tiêu đề ảnh ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtTitle" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Tiêu đề ảnh(En) ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtTitleEn" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Mô tả ảnh ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtDescription" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:TextBoxSetting EmptyMessage="Mô tả ảnh(En) ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtDescriptionEn" />
                </TargetControls>
            </asp:TextBoxSetting>
            <asp:NumericTextBoxSetting AllowRounding="false" Type="Number" DecimalDigits="0"
                EmptyMessage="Thứ tự ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtPriority" />
                </TargetControls>
            </asp:NumericTextBoxSetting>
        </asp:RadInputManager>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="ProductOptionDelete"
            SelectMethod="ProductOptionSelectAll" TypeName="TLLib.ProductOption" UpdateMethod="ProductOptionUpdate">
            <DeleteParameters>
                <asp:Parameter Name="ProductOptionID" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="StartRowIndex" Type="String" />
                <asp:Parameter Name="EndRowIndex" Type="String" />
                <asp:Parameter Name="Keyword" Type="String" />
                <asp:Parameter Name="ProductOptionTitle" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:QueryStringParameter Name="ProductOptionCategoryID" QueryStringField="poi" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter Name="IsHot" Type="String" />
                <asp:Parameter Name="IsNew" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter DefaultValue="" Name="SortByPriority" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ImageName" Type="String" />
                <asp:Parameter Name="ProductOptionID" Type="String" />
                <asp:Parameter Name="MetaTittle" Type="String" />
                <asp:Parameter Name="MetaDescription" Type="String" />
                <asp:Parameter Name="ProductOptionTitle" Type="String" />
                <asp:Parameter Name="ConvertedProductOptionTitle" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Content" Type="String" />
                <asp:Parameter Name="Tag" Type="String" />
                <asp:Parameter Name="MetaTittleEn" Type="String" />
                <asp:Parameter Name="MetaDescriptionEn" Type="String" />
                <asp:Parameter Name="ProductOptionTitleEn" Type="String" />
                <asp:Parameter Name="DescriptionEn" Type="String" />
                <asp:Parameter Name="ContentEn" Type="String" />
                <asp:Parameter Name="TagEn" Type="String" />
                <asp:Parameter Name="ProductOptionCategoryID" Type="String" />
                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                <asp:Parameter Name="IsHot" Type="String" />
                <asp:Parameter Name="IsNew" Type="String" />
                <asp:Parameter Name="IsAvailable" Type="String" />
                <asp:Parameter Name="ProductID" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </asp:RadAjaxPanel>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important;
        left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
