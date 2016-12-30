<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="product_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function checkQuantitySize() {
            //alert($("[id$='ddlQuantity']").val());
            var color = $('.product-right .info li .color .items');
            var size = $('.product-right .info li .size .items');
            if ($(color).hasClass('active') &&
                $(size).hasClass('active')) {
                //window.location = "gio-hang.aspx" + this.id;
            }
            else if ($(color).not('.active') && $(size).hasClass('active')) {
                $('.check-attribute').addClass('show');
                $('.check-attribute').html("Bạn hãy chọn <b>màu sắc!</b>");
                return false;
            }
            else if ($(size).not('.active') && $(color).hasClass('active')) {
                $('.check-attribute').addClass('show');
                $('.check-attribute').html("Bạn hãy chọn <b>kích thước!</b>");
                return false;
            }
            else {
                $('.check-attribute').addClass('show');
                $('.check-attribute').html("Bạn hãy chọn đầy đủ <b>màu sắc và kích thước!</b>");
                return false;
            }
            //if ($("[id$='hdnProductLengthName']").val() == "0" || $("[id$='hdnProductLengthName']").val() == "") {
            //    alert("Bạn chưa chọn kích thước");
            //    return false;
            //}
            //else if ($("[id$='ddlQuantity']").val() == "0" || $("[id$='ddlQuantity']").val() == "") {
            //    alert("Bạn chưa chọn Số Lượng");
            //    return false;
            //}
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="site">
        <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="product.aspx">Sản phẩm</a> <span class="fa fa-angle-right"></span>
            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="container">
        <div class="product-detail-main">
            <div class="product-left">
                <div id="sliderGallery" class="gallery-slider">
                    <asp:ListView ID="lstImageColor" runat="server"
                        DataSourceID="odsColor1" EnableModelValidation="True">
                        <ItemTemplate>
                            <div id='<%# "small" + Eval("ProductOptionCategoryID") %>' class="img-color">
                                <asp:Label ID="lblProductOptionCategoryID" Visible="False" runat="server" Text='<%# Eval("ProductOptionCategoryID") %>'></asp:Label>
                                <div class="slider-for">
                                    <asp:ListView ID="lstImageBig" runat="server"
                                        DataSourceID="odsImage" EnableModelValidation="True">
                                        <ItemTemplate>
                                            <div class="slider-big">
                                                <div class="gallery-group">
                                                    <div class="gallery-img">
                                                        <img id="Img1" runat="server" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/" + Eval("ImageName") : "" %>'
                                                            alt='<%# Eval("ImageName") %>' />
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <span runat="server" id="itemPlaceholder" />
                                        </LayoutTemplate>
                                    </asp:ListView>
                                </div>
                                <div class="gallery-smalls">
                                    <div class="slider-nav">
                                        <asp:ListView ID="lstImageSmall" runat="server"
                                            DataSourceID="odsImage" EnableModelValidation="True">
                                            <ItemTemplate>
                                                <div class="slider-small">
                                                    <div class="gallery-small">
                                                        <div class="small-box">
                                                            <img id="Img1" runat="server" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/productoption/thumbs/" + Eval("ImageName") : "" %>'
                                                                alt='<%# Eval("ImageName") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <span runat="server" id="itemPlaceholder" />
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </div>
                                </div>
                                <asp:ObjectDataSource ID="odsImage" runat="server" SelectMethod="ProductOptionSelectAll"
                                    TypeName="TLLib.ProductOption">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                        <asp:Parameter Name="ProductOptionTitle" Type="String" />
                                        <asp:Parameter Name="Description" Type="String" />
                                        <asp:ControlParameter ControlID="lblProductOptionCategoryID" Name="ProductOptionCategoryID"
                                            PropertyName="Text" Type="String" />
                                        <asp:Parameter Name="Tag" Type="String" />
                                        <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                        <asp:Parameter Name="IsHot" Type="String" />
                                        <asp:Parameter Name="IsNew" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <span runat="server" id="itemPlaceholder" />
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsColor1" runat="server" SelectMethod="ProductOptionCategorySelectAll"
                        TypeName="TLLib.ProductOptionCategory">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="parentID" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                            <asp:Parameter DefaultValue="" Name="IsShowOnMenu" Type="String" />
                            <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                            <asp:QueryStringParameter DefaultValue="-1" Name="ProductID" QueryStringField="pi"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
            <div class="product-right">
                <asp:ListView ID="lstProductDetail" runat="server"
                    DataSourceID="odsProductDetail" EnableModelValidation="True" OnItemCommand="lstProductDetail_ItemCommand">
                    <ItemTemplate>
                        <h1><%# Eval("ProductName") %></h1>
                        <div class="product-code">
                            Mã sản phẩm: <span><%# Eval("Tag") %></span>
                        </div>
                        <div class="product-price">
                            <span><%# !string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%></span>
                            <%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%>
                        </div>
                        <asp:HiddenField ID="hdnProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                        <div class="info">
                            <ul>
                                <li>
                                    <asp:Label ID="Label1" runat="server" Text="Màu sắc:" CssClass="label"></asp:Label>
                                    <div id="listcolor" class="color">
                                        <asp:ListView ID="lstColor" runat="server" DataSourceID="odsColor" EnableModelValidation="True">
                                            <ItemTemplate>
                                                <div class="items">
                                                    <a productcolorid='<%# Eval("ProductOptionCategoryID") %>' productcolorname='<%# Eval("ProductOptionCategoryName") %>'
                                                        class="link-color" href='<%# "#small" + Eval("ProductOptionCategoryID") %>'>
                                                        <%--<img id="Img2" alt='<%# Eval("ImageName") %>' src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/productoptioncategory/" + Eval("ImageName") : "~/assets/images/color-img-1.gif" %>'
                                                            runat="server" />--%>
                                                        <div style='background: <%#  Eval("ProductOptionCategoryName")%>; width: 100%; height: 100%; display: block;'></div>
                                                    </a>
                                                </div>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <span runat="server" id="itemPlaceholder" />
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <asp:ObjectDataSource ID="odsColor" runat="server" SelectMethod="ProductOptionCategorySelectAll"
                                            TypeName="TLLib.ProductOptionCategory">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="parentID" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32" />
                                                <asp:Parameter DefaultValue="" Name="IsShowOnMenu" Type="String" />
                                                <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                                <asp:QueryStringParameter DefaultValue="-1" Name="ProductID" QueryStringField="pi"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </div>
                                </li>
                                <li>
                                    <asp:Label ID="Label2" runat="server" Text="Kích thước:" CssClass="label"></asp:Label>
                                    <%--<div class="size">
                                        <div class="items active">
                                            <span>S</span>
                                        </div>
                                        <div class="items">
                                            <span>M</span>
                                        </div>
                                        <div class="items">
                                            <span>L</span>
                                        </div>
                                    </div>--%>
                                    <div id="ddlProductLength" runat="server" class="size">
                                    </div>
                                </li>
                                <li>
                                    <asp:Label ID="Label3" runat="server" Text="Số lượng:" CssClass="label"></asp:Label>
                                    <div class="sp-quantity">
                                        <div class="sp-minus fff">
                                            <span class="ddd">-</span>
                                        </div>
                                        <div class="sp-input">
                                            <asp:TextBox ID="inQuantity" CssClass="quntity-input" runat="server" Text="1"></asp:TextBox>
                                            <asp:HiddenField ID="hdnIsQuantity" runat="server" />
                                        </div>
                                        <div class="sp-plus fff">
                                            <span class="ddd">+</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <asp:Label ID="Label4" runat="server" Text="Thương hiệu:" CssClass="label"></asp:Label>
                                    <div class="thuonghieu"><%# Eval("ManufacturerName") %></div>
                                </li>
                                <li><span class="check-attribute"></span></li>
                            </ul>
                            <asp:HiddenField ID="hdnProductOptionCategoryID" runat="server" />
                            <asp:HiddenField ID="hdnProductOptionCategoryName" runat="server" />
                            <asp:HiddenField ID="hdnProductLengthID" runat="server" />
                            <asp:HiddenField ID="hdnProductLengthName" runat="server" />
                            <asp:HiddenField ID="hdnQuantitySale" runat="server" />
                            <asp:HiddenField ID="HiddenField1" Value='<%# Eval("ProductID") %>' runat="server" />
                            <asp:HiddenField ID="hdnImageName" Value='<%# Eval("ImageName") %>' runat="server" />
                            <asp:HiddenField ID="hdnProductCode" Value='<%# Eval("Tag") %>' runat="server" />
                            <asp:HiddenField ID="hdnProductCategory" Value='<%# Eval("CategoryID") %>' runat="server" />
                            <asp:HiddenField ID="hdnPrice" Value='<%# string.IsNullOrEmpty(Eval("Price").ToString()) ? "0" : Eval("Price") %>'
                                runat="server" />
                            <asp:Label ID="lblProductName" Visible="False" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            <asp:Label ID="lblProductNameEn" Visible="False" runat="server" Text='<%# Eval("ProductNameEn") %>'></asp:Label>
                        </div>
                        <div class="btn-mua">
                            <%--<asp:Button ID="btnGui" CssClass="button-mua" runat="server" Text="MUA NGAY" />--%>
                            <asp:LinkButton ID="lkbAddToCart" runat="server" OnClientClick="return checkQuantitySize()"
                                CommandName="AddToCart" CssClass="button-mua">MUA NGAY</asp:LinkButton>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductDetail" runat="server" SelectMethod="ProductSelectOne"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>

            </div>
        </div>
        <asp:ListView ID="lstProductDetail2" runat="server"
            DataSourceID="odsProductDetail" EnableModelValidation="True">
            <ItemTemplate>
                <div class="product-content">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#tab1" aria-controls="home" role="tab" data-toggle="tab">CHI TIẾT</a></li>
                        <li role="presentation"><a href="#tab2" aria-controls="profile" role="tab" data-toggle="tab">CHI TIẾT KÍCH THƯỚC</a></li>
                        <li role="presentation"><a href="#tab3" aria-controls="messages" role="tab" data-toggle="tab">CHÍNH SÁCH HOÀN TRẢ</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="tab1">
                            <div class="tab-main">
                                <%# Eval("Description") %>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab2">
                            <div class="tab-main">
                                <%# Eval("Content") %>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab3">
                            <div class="tab-main">
                                <%# Eval("Policy") %>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>

        <div class="product-all">
            <h2>SẢN PHẨM CÙNG THƯƠNG HIỆU</h2>
            <div class="pro-cate">
                <asp:ListView ID="lstProductSame" runat="server"
                    DataSourceID="odsProductSame" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="item-wrap">
                                <div class="item-img">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>'
                                            runat="server" /></a>
                                    <%# Eval("IsNew").ToString()=="True" ? "<div class='new'><p>new</p></div>" : "" %>
                                </div>
                                <div class="item-content">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") + " - " + Eval("Tag") %></a>
                                    <p><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%> <span><%# !string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%></span></p>
                                    <div class="bnt-mua"><a href="#">MUA</a></div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll1" TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String" />
                        <asp:QueryStringParameter DefaultValue="" Name="ProductID" QueryStringField="pi" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

