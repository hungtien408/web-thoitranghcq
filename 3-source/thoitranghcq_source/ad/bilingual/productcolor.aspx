<%@ Page Title="" Language="C#" MasterPageFile="~/ad/template/adminEn.master" AutoEventWireup="true"
    CodeFile="productcolor.aspx.cs" Inherits="ad_single_ProductColor" %>

<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <link href="../assets/styles/sreenshort.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/sreenshort.js" type="text/javascript"></script>
    <script type="text/javascript">
        var tableView = null;
        function RowDblClick(sender, eventArgs) {
            sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
        }

        function RowMouseOver(sender, eventArgs) {
            var selectedRows = sender.get_masterTableView().get_selectedItems();
            var elem = $get(eventArgs.get_id());
            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();

                    if (selectedID != eventArgs.get_id())
                        elem.className += (" rgSelectedRow");
                }
            else
                elem.className += (" rgSelectedRow");
        }

        function RowMouseOut(sender, eventArgs) {
            var className = "rgSelectedRow";
            var elem = $get(eventArgs.get_id());

            var selectedRows = sender.get_masterTableView().get_selectedItems();

            if (selectedRows.length > 0)
                for (var i = 0; i < selectedRows.length; i++) {
                    var selectedID = selectedRows[i].get_id();
                    if (selectedID != eventArgs.get_id())
                        removeCssClass(className, elem);
                }
            else
                removeCssClass(className, elem);
        }

        function removeCssClass(className, element) {
            element.className = element.className.replace(className, "").replace(/^\s+/, '').replace(/\s+$/, '');
        }

        function pageLoad(sender, args) {
            tableView = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
        }

        function RadComboBox1_SelectedIndexChanged(sender, args) {
            tableView.set_pageSize(sender.get_value());
        }

        function changePage(argument) {
            tableView.page(argument);
        }

        function RadNumericTextBox1_ValueChanged(sender, args) {
            tableView.page(sender.get_value());
        }

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
    </script>
    <script type="text/javascript">
        function ClientValidationFunction(sender, arguments) {
            var data = arguments.Value;
            if (data.length > 7) {
                arguments.IsValid = false;
            }
            else {
                arguments.IsValid = true;
            }
        }
        function HandleColorChange(sender, eventArgs) {
            someString = sender._clientStateFieldID;
            var o = $('[id="' + someString.substring(0, someString.lastIndexOf('_')) + '"]');
            o.prev().attr('value', sender.get_selectedColor());
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="Server">
    <h3 class="mainTitle">
        <img alt="" src="../assets/images/category.png" class="vam" />
        Màu Sắc</h3>
    <asp:RadAjaxPanel ID="RadAjaxPanel1" runat="server" ClientEvents-OnRequestStart="conditionalPostback">
        <asp:Panel ID="pnlSearch" DefaultButton="btnSearch" runat="server">
            <h4 class="searchTitle">Tìm kiếm
            </h4>
            <table class="search">
                <tr>
                    <td class="left">Màu Sắc
                    </td>
                    <td>
                        <asp:RadTextBox ID="txtSearchProductColorName" runat="server" Width="200px">
                        </asp:RadTextBox>
                    </td>
                </tr>
            </table>
            <div align="right" style="padding: 5px 0 5px 0; border-bottom: 1px solid #ccc; margin-bottom: 10px">
                <asp:RadButton ID="btnSearch" runat="server" Text="Tìm kiếm">
                    <Icon PrimaryIconUrl="~/ad/assets/images/find.png" />
                </asp:RadButton>
            </div>
        </asp:Panel>
        <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
        <asp:RadGrid ID="RadGrid1" runat="server" Culture="vi-VN" AllowMultiRowSelection="True"
            DataSourceID="ObjectDataSource1" GridLines="Horizontal" AutoGenerateColumns="False"
            AllowAutomaticDeletes="True" ShowStatusBar="True" OnItemCommand="RadGrid1_ItemCommand"
            OnItemDataBound="RadGrid1_ItemDataBound" CssClass="grid"
            OnItemCreated="RadGrid1_ItemCreated" CellSpacing="0">
            <ClientSettings EnableRowHoverStyle="true">
                <Selecting AllowRowSelect="True" UseClientSelectColumnOnly="true"  />
                <ClientEvents OnRowDblClick="RowDblClick" />
                <Resizing AllowColumnResize="true" ClipCellContentOnResize="False" />
            </ClientSettings>
            <ExportSettings IgnorePaging="true" OpenInNewWindow="true" ExportOnlyData="true"
                Excel-Format="ExcelML" Pdf-AllowCopy="true">
            </ExportSettings>
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="ObjectDataSource1"
                InsertItemPageIndexAction="ShowItemOnCurrentPage" AllowMultiColumnSorting="True"
                DataKeyNames="ProductColorID">
                <PagerStyle AlwaysVisible="true" Mode="NextPrevNumericAndAdvanced" PageButtonCount="10"
                    FirstPageToolTip="Trang đầu" LastPageToolTip="Trang cuối" NextPagesToolTip="Trang kế"
                    NextPageToolTip="Trang kế" PagerTextFormat="Đổi trang: {4} &nbsp;Trang <strong>{0}</strong> / <strong>{1}</strong>, Kết quả <strong>{2}</strong> - <strong>{3}</strong> trong <strong>{5}</strong>."
                    PageSizeLabelText="Kết quả mỗi trang:" PrevPagesToolTip="Trang trước" PrevPageToolTip="Trang trước" />
                <CommandItemTemplate>
                    <div class="command">
                        <div style="float: right">
                            <asp:Button ID="ExportToExcelButton" runat="server" CssClass="rgExpXLS" CommandName="ExportToExcel"
                                AlternateText="Excel" ToolTip="Xuất ra Excel" />
                            <asp:Button ID="ExportToPdfButton" runat="server" CssClass="rgExpPDF" CommandName="ExportToPdf"
                                AlternateText="PDF" ToolTip="Xuất ra PDF" />
                            <asp:Button ID="ExportToWordButton" runat="server" CssClass="rgExpDOC" CommandName="ExportToWord"
                                AlternateText="Word" ToolTip="Xuất ra Word" />
                        </div>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'
                            CssClass="item"><img class="vam" alt="" src="../assets/images/add.png" /> Thêm mới</asp:LinkButton>|
                        <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Thêm</asp:LinkButton>&nbsp;&nbsp;
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'><img class="vam" alt="" src="../assets/images/delete-icon.png" /> Hủy</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="btnEditSelected" runat="server" CommandName="EditSelected" Visible='<%# RadGrid1.EditIndexes.Count == 0 %>'
                            CssClass="item"><img width="12px" class="vam" alt="" src="../assets/images/tools.png" /> Sửa</asp:LinkButton>|
                        <%--<asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'><img class="vam" alt="" src="../assets/images/accept.png" /> Cập nhật</asp:LinkButton>&nbsp;&nbsp;--%>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="javascript:return confirm('Xóa tất cả dòng đã chọn?')"
                            runat="server" CommandName="DeleteSelected" CssClass="item"><img class="vam" alt="" title="Xóa tất cả dòng được chọn" src="../assets/images/delete-icon.png" /> Xóa</asp:LinkButton>|
                        <asp:LinkButton ID="LinkButton6" runat="server" CommandName="QuickUpdate" Visible="false"
                            CssClass="item"><img class="vam" alt="" src="../assets/images/accept.png" /> Sửa nhanh</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" runat="server" CommandName="RebindGrid" CssClass="item"><img class="vam" alt="" src="../assets/images/reload.png" /> Làm mới</asp:LinkButton>
                    </div>
                    <div class="clear">
                    </div>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </CommandItemTemplate>
                <Columns>
                    <asp:GridClientSelectColumn FooterText="CheckBoxSelect footer" HeaderStyle-Width="1%"
                        UniqueName="CheckboxSelectColumn" />
                    <asp:GridTemplateColumn HeaderStyle-Width="1%" HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.DataSetIndex + 1 %>
                            <asp:HiddenField ID="hdnProductColorID" runat="server" Value='<%# Eval("ProductColorID") %>' />
                            <asp:HiddenField ID="hdnProductColorImages" runat="server" Value='<%# Eval("ProductColorImages") %>' />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Màu Sắc" DataField="ProductColorName" SortExpression="ProductColorName">
                        <ItemTemplate>
                            <asp:Label ID="lblProductColorName" runat="server" Text='<%# Eval("ProductColorName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Mô Tả" DataField="ProductColorDescription" SortExpression="ProductColorDescription">
                        <ItemTemplate>
                            <asp:Label ID="lblProductColorDescription" runat="server" Text='<%# Eval("ProductColorDescription")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Ngày tạo" SortExpression="ProductColorCreateDate" HeaderStyle-Width="1%">
                        <ItemTemplate>
                            <%# string.Format("{0:dd/MM/yyyy hh:mm tt}", Eval("ProductColorCreateDate"))%>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Hiển thị" DataField="IsAvailable" SortExpression="IsAvailable">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkIsAvailable" runat="server" Checked='<%# Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))%>'
                                CssClass="checkbox" />
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn HeaderText="Màu Sắc" DataField="ProductColorName" SortExpression="ProductColorName">
                        <ItemTemplate>
                            <div style='background: <%#  Eval("ProductColorName")%>; width: 30px; height: 30px;'></div>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                    <asp:GridTemplateColumn Visible="false" DataField="ProductColorImages" HeaderText="Ảnh" SortExpression="ProductColorImages">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server" Visible='<%# string.IsNullOrEmpty( Eval("ProductColorImages").ToString()) ? false : true %>'
                                Width="95">
                                <img alt="" src='<%# "~/res/ProductColor/" + Eval("ProductColorImages") %>' width="80" runat="server"
                                    visible='<%# string.IsNullOrEmpty(Eval("ProductColorImages").ToString()) ? false : true %>' />

                            </asp:Panel>
                        </ItemTemplate>
                    </asp:GridTemplateColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkUpdate">
                            <h3 class="searchTitle">Thông Tin Màu Sắc</h3>
                            <table class="search">
                                <tr class="invisible">
                                    <td class="left" valign="top">Ảnh đại diện
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hdnProductColorID" runat="server" Value='<%# Eval("ProductColorID") %>' />
                                        <asp:HiddenField ID="hdnProductColorImages" runat="server" Value='<%# Eval("ProductColorImages") %>' />
                                        <asp:RadUpload ID="FileProductColorImages" runat="server" ControlObjectsVisibility="None"
                                            Culture="vi-VN" Language="vi-VN" InputSize="69" AllowedFileExtensions=".jpg,.jpeg,.gif,.png" />
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Sai định dạng ảnh (*.jpg, *.jpeg, *.gif, *.png)"
                                            ClientValidationFunction="validateRadUpload" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left">Màu Sắc
                                    </td>
                                    <td>

                                        <asp:TextBox ID="txtProductColorName" runat="server" Text='<%# Bind("ProductColorName") %>'
                                            Width="500px"></asp:TextBox>
                                        <%--<input type="text" value='<%# Eval("ProductColorCode") %>' runat="server" id="txtProductColorCode" style="width: 70px;" />--%>
                                        <telerik:RadColorPicker ShowIcon="true" ID="RadColorPicker1" SelectedColor='<%# System.Drawing.ColorTranslator.FromHtml(Eval("ProductColorName").ToString()) %>' runat="server" PaletteModes="WebPalette" OnClientColorChange="HandleColorChange">
                                        </telerik:RadColorPicker>
                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtProductColorName" ClientValidationFunction="ClientValidationFunction" ErrorMessage="VD: #cfcfcf"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr class="invisible">
                                    <td class="left" valign="top">Màu Sắc Gọng
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtProductColorName1" runat="server" Text='<%# Bind("ProductColorName") %>'
                                            Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" valign="top">Mô tả</td>
                                    <td>
                                        <asp:TextBox ID="txtProductColorDescription" TextMode="MultiLine" runat="server" Text='<%# Bind("ProductColorDescription") %>' Width="500px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="left" colspan="2">
                                        <asp:CheckBox ID="chkIsAvailable" runat="server" CssClass="checkbox" Text=" Hiển thị"
                                            Checked='<%# (Container is GridEditFormInsertItem) ? true : (Eval("IsAvailable") == DBNull.Value ? false : Convert.ToBoolean(Eval("IsAvailable"))) %>' />
                                    </td>
                                </tr>
                            </table>
                            <div class="edit">
                                <hr />
                                <asp:RadButton ID="lnkUpdate" runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Thêm" : "Cập nhật" %>'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/ok.png" />
                                </asp:RadButton>
                                &nbsp;&nbsp;
                                <asp:RadButton ID="btnCancel" runat="server" CommandName='Cancel' Text='Hủy'>
                                    <Icon PrimaryIconUrl="~/ad/assets/images/cancel.png" />
                                </asp:RadButton>
                            </div>
                        </asp:Panel>
                        <asp:RadInputManager ID="RadInputManager1" runat="server">
                            <asp:NumericTextBoxSetting AllowRounding="False" Culture="vi-VN" EmptyMessage="Thứ tự ..."
                                Type="Number" DecimalDigits="0">
                                <TargetControls>
                                    <asp:TargetInput ControlID="txtPriority" />
                                </TargetControls>
                            </asp:NumericTextBoxSetting>
                        </asp:RadInputManager>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <HeaderStyle Font-Bold="True" />
            <HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default">
            </HeaderContextMenu>
        </asp:RadGrid>
        <asp:RadInputManager ID="RadInputManager1" runat="server">
            <asp:TextBoxSetting EmptyMessage="Màu Sắc ...">
                <TargetControls>
                    <asp:TargetInput ControlID="txtProductColorName" />
                </TargetControls>
            </asp:TextBoxSetting>
        </asp:RadInputManager>
    </asp:RadAjaxPanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="ProductColorDelete" SelectMethod="ProductColorSelectAll" TypeName="TLLib.ProductColor">
        <DeleteParameters>
            <asp:Parameter Name="ProductColorID" Type="String" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearchProductColorName" Name="ProductColorName" PropertyName="Text"
                Type="String" />
            <asp:Parameter Name="IsAvailable" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:RadProgressManager ID="RadProgressManager1" runat="server" />
    <asp:RadProgressArea ID="ProgressArea1" runat="server" Culture="vi-VN" DisplayCancelButton="True"
        HeaderText="Đang tải" Skin="Office2007" Style="position: fixed; top: 50% !important; left: 50% !important; margin: -93px 0 0 -188px;" />
</asp:Content>
