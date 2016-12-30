<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="dat-hang.aspx.cs" Inherits="dat_hang" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=3.5.40412.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thời Trang</title>
    <meta name="description" content="Thời Trang" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="site">
        <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="#">Giỏ hàng</a> <span class="fa fa-angle-right"></span><a href="javascript:void(0)">Đặt hàng</a>
        </div>
    </div>
    <div class="container">
        <div class="order-main">
            <div class="order-left">
                <div class="order1">
                    <h1>THÔNG TIN NGƯỜI NHẬN</h1>
                    <div class="order-form">
                        <div class="form-w">
                            <label class="contact-lb">Email <span>*</span></label>
                            <div class="input-form">
                                <asp:TextBox ID="txtEmail" CssClass="contact-textbox" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                                    runat="server" ValidationGroup="Payment" ControlToValidate="txtEmail"
                                    ErrorMessage="Sai định dạng email!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                                    Display="Dynamic" ValidationGroup="Payment" ControlToValidate="txtEmail"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-w">
                            <label class="contact-lb">Họ &amp; Tên <span>*</span></label>
                            <div class="input-form">
                                <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                                    Display="Dynamic" ValidationGroup="Payment" ControlToValidate="txtFullName"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <%--<label class="contact-lb" style="width: 50px; margin-left: 25px;">Tên <span>*</span></label>
                            <div class="input-form" style="width: 175px;">
                                <asp:TextBox ID="TextBox2" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>--%>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-w">
                                    <label class="contact-lb">Địa chỉ <span>*</span></label>
                                    <div class="input-form">
                                        <asp:TextBox ID="txtAddress" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                                        <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                                            Display="Dynamic" ValidationGroup="Payment" ControlToValidate="txtAddress"
                                            ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <label class="contact-lb" style="opacity: 0;">Địa chỉ <span>*</span></label>
                                    <div class="select">
                                        <asp:DropDownList ID="ddlProvince" AutoPostBack="true" DataSourceID="OdsProvince"
                                            DataTextField="ProvinceName" DataValueField="ProvinceID" CssClass="box-select"
                                            runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsProvince" runat="server" SelectMethod="ProvinceSelectAll"
                                            TypeName="TLLib.Province">
                                            <SelectParameters>
                                                <asp:Parameter Name="ProvinceID" Type="String" />
                                                <asp:Parameter Name="ProvinceName" Type="String" />
                                                <asp:Parameter Name="ShortName" Type="String" />
                                                <asp:Parameter Name="CountryID" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                    <div class="select">
                                        <asp:DropDownList ID="ddlDistrict" DataSourceID="OdsDistrict" DataTextField="DistrictName"
                                            DataValueField="DistrictID" CssClass="box-select" runat="server">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OdsDistrict" runat="server" SelectMethod="DistrictSelectAll"
                                            TypeName="TLLib.District">
                                            <SelectParameters>
                                                <asp:Parameter Name="DistrictName" Type="String" />
                                                <asp:ControlParameter ControlID="ddlProvince" Name="ProvinceIDs"
                                                    PropertyName="SelectedValue" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                                <asp:Parameter Name="Priority" Type="String" />
                                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                    <%--<div class="select">
                                <select>
                                    <option value="">Phường/Xã</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>--%>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="form-w">
                            <label class="contact-lb">Điện thoại di động <span>*</span></label>
                            <div class="input-form">
                                <asp:TextBox ID="txtPhone" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                                    Display="Dynamic" ValidationGroup="Payment" ControlToValidate="txtPhone"
                                    ErrorMessage="Thông tin bắt buộc!" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="order2">
                    <h1>HÌNH THỨC THANH TOÁN</h1>
                    <div class="radio-form">
                        <div class="radio-left">
                            <asp:RadioButton ID="rbtMoney" runat="server" CssClass="payment paywith-money" GroupName="checkradio" Checked="true" />
                            <div class="text-radio">
                                <h2>THANH TOÁN KHI NHẬN HÀNG</h2>
                            </div>
                        </div>
                        <div class="radio-right">
                            <asp:RadioButton ID="rbtEmail" runat="server" CssClass="payment paywith-email" GroupName="checkradio" />
                            <div class="text-radio">
                                <h2>CHUYỂN KHOẢN NGÂN HÀNG</h2>
                            </div>
                            <div class="radio-box">
                                <p><strong>Tài khoản Đông Á</strong> 0102574070 </p>
                                <p>(Chi nhánh Bình Thạnh)</p>
                                <p>Chủ TK: Lưu Lam Sơn</p>
                                <p style="color: #df0000">Quý khách lưu ý:</p>
                                <p>- Khi chuyển khoản quý khách vui lòng ghi rõ mã số đơn hàng.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="oder-right">
                <h1>THÔNG TIN ĐƠN HÀNG</h1>
                <div class="form-right">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="odsCart" EnableModelValidation="True"
                        OnItemCommand="ListView1_ItemCommand" OnDataBound="ListView1_DataBound" OnItemDataBound="ListView1_ItemDataBound">
                        <ItemTemplate>
                            <div class="box1">
                                <h1><%# Eval("ProductName") %></h1>
                                <ul>
                                    <li>
                                        <asp:Label ID="Label1" runat="server" Text="Màu sắc:" CssClass="label"></asp:Label>
                                        <div class="color-img">
                                            <div style='background: <%#  Eval("ProductOptionCategoryName")%>; width: 30px; height: 30px;'></div>
                                        </div>
                                    </li>
                                    <li>
                                        <asp:Label ID="Label2" runat="server" Text="Kích thước:" CssClass="label"></asp:Label>
                                        <div class="size-img">
                                            <span><%# Eval("ProductLengthName") %></span>
                                        </div>
                                    </li>
                                    <li>
                                        <asp:Label ID="Label3" runat="server" Text="Số lượng:" CssClass="label"></asp:Label>
                                        <div class="number">
                                            <%--<span><%# Eval("Quantity") %></span>--%>
                                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="dh-quantity" Text='<%# Eval("Quantity") %>' OnTextChanged="txtQuantity_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                        <div class="gia">x<%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%></div>
                                    </li>
                                    <li>
                                        <asp:LinkButton CssClass="delete" CommandName="Remove" OnClientClick="return confirm('Bạn muốn xóa sản phẩm này?')"
                                            ID="lkbRemove" runat="server">Xóa</asp:LinkButton></li>
                                </ul>
                                <asp:HiddenField ID="hdnQuantityList" runat="server" Value='<%# Eval("QuantityList") %>' />
                                <asp:HiddenField ID="hdnQuantity" runat="server" Value='<%# Eval("Quantity") %>' />
                                <asp:HiddenField ID="hdnCartProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                                <asp:HiddenField ID="hdnCartProductOptionCategoryID" Value='<%# Eval("ProductOptionCategoryID") %>'
                                    runat="server" />
                                <asp:HiddenField ID="hdnCartProductLengthID" Value='<%# Eval("ProductLengthID") %>'
                                    runat="server" />
                                <asp:HiddenField ID="hdnCartPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                    runat="server" />
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsCart" runat="server" SelectMethod="Cart" TypeName="ShoppingCart"></asp:ObjectDataSource>
                    <div class="box2">
                        <p>
                            Tổng đơn hàng:
                            <asp:Label ID="lblTotalPrice" runat="server"></asp:Label>
                            <asp:HiddenField ID="hdnTotalPrice" runat="server" />
                        </p>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="box3">
                                <p>Sử dụng Voucher<span><img src="assets/images/icon5.png" alt="" /></span></p>
                                <div class="input-1">
                                    <asp:TextBox ID="txtInputVoucher" CssClass="contact-textbox1" runat="server" OnTextChanged="txtInputVoucher_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    <asp:TextBoxWatermarkExtender ID="txtInputVoucher_WatermarkExtender" runat="server" Enabled="True"
                                        WatermarkText="NHẬP MÃ GIẢM GIÁ" TargetControlID="txtInputVoucher">
                                    </asp:TextBoxWatermarkExtender>
                                    <asp:CustomValidator ID="validateVoucher" runat="server"
                                        Display="Dynamic" CssClass="lb-error"></asp:CustomValidator>
                                </div>
                            </div>

                            <div class="box4">
                                <p>
                                    Phí vận chuyển: <span>
                                        <asp:Label ID="lblShippingPrice" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnShippingPrice" runat="server" />
                                    </span>
                                </p>
                            </div>
                            <div class="box5">
                                <p>
                                    Giảm: <span>
                                        <asp:Label ID="lblSavePrice" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnSavePrice" runat="server" />
                                    </span>
                                </p>
                            </div>
                            <div class="box4">
                                <p>
                                    Tổng thành tiền: <span>
                                        <asp:Label ID="lblSumTotalPrice" runat="server"></asp:Label>
                                        <asp:HiddenField ID="hdnSumTotalPrice" runat="server" />
                                    </span>
                                </p>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="box6">
                        <asp:Button ID="btnGui" CssClass="button-mua1" runat="server" Text="THANH TOÁN" ValidationGroup="Payment" OnClick="btnGui_Click" />
                    </div>
                    <div class="box7">
                        <asp:Label ID="Label4" runat="server" Text="Ghi chú:" CssClass="label"></asp:Label>
                        <asp:TextBox ID="txtNote" CssClass="contact-area" runat="server" TextMode="MultiLine" placeholder=""></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

