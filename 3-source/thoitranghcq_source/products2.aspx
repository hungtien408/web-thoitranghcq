﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="products2.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            //$("[id$='Button1']").trigger("click");
            var PriceFrom = $("[id$='txtAmoutLeft']").val();
            var PriceTo = $("[id$='txtAmoutRight']").val();
            var CategoryID = "3";
            var ManufacturerID = $("[id$='chkManufacturer']").val();
            var ProductMaterialID = $("[id$='chkProductMaterial']").val();
            var ProductStyleID = $("[id$='chkProductStyle']").val();
            var ProductOptionCategoryName = $("[id$='chkProductColor']").val();
            $('#loading1').html('<img src="assets/images/loading.gif">');
            $.ajax({
                type: "POST",
                url: "products2.aspx/LoadProduct",
                data: "{'PriceFrom': '" + PriceFrom + "','PriceTo': '" + PriceTo + "','CategoryID': '" + CategoryID + "','ManufacturerID': '" + ManufacturerID + "','ProductMaterialID': '" + ProductMaterialID + "','ProductStyleID': '" + ProductStyleID + "','ProductOptionCategoryName': '" + ProductOptionCategoryName + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: true,
                cache: false,
                success: function (msg) {
                    if (msg.d != "") {
                        alert(msg.d);
                        $(".pro-cate").html(msg.d);
                        $('#loading').html(msg);
                    }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPham" runat="server" />
    <a class="a-link-sp" href="<%= hdnSanPham.Value %>"></a>

    <div class="site">
        <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="javascript:void(0)">
                <asp:Label ID="lblName2" runat="server" Text=""></asp:Label></a>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="wrap-pro container">
                <div class="aside-left">
                    <section class="filter-price">
                        <h3>Lọc theo giá</h3>
                        <p>
                            <asp:TextBox ID="txtAmoutLeft" CssClass="amount" runat="server" AutoPostBack="true"></asp:TextBox>
                            <asp:TextBox ID="txtAmoutRight" CssClass="amount" runat="server" AutoPostBack="true"></asp:TextBox>
                            <span id="amount-left" class="amount"></span>
                            <span id="amount-right" class="amount"></span>
                        </p>
                        <div class="clr"></div>
                        <div id="slider"></div>
                    </section>
                    <section class="sec-pro">
                        <h3>thương hiệu</h3>
                        <asp:RadioButtonList ID="chkManufacturer" CssClass="check-list" AutoPostBack="true" runat="server" DataSourceID="odsManufacturer" DataTextField="ManufacturerName" DataValueField="ManufacturerID"></asp:RadioButtonList>
                        <asp:ObjectDataSource ID="odsManufacturer" runat="server" SelectMethod="ManufacturerSelectAll" TypeName="TLLib.Manufacturer1">
                            <SelectParameters>
                                <asp:Parameter Name="ManufacturerName" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                <asp:Parameter Name="ProductID" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </section>
                    <section class="sec-pro color">
                        <h3>màu sắc</h3>
                        <asp:RadioButtonList ID="chkProductColor" CssClass="check-list" AutoPostBack="true" runat="server" DataSourceID="odsProductColor" DataTextField="ProductColorDescription" DataValueField="ProductColorName"></asp:RadioButtonList>
                        <asp:ObjectDataSource ID="odsProductColor" runat="server" SelectMethod="ProductColorSelectAll" TypeName="TLLib.ProductColor">
                            <SelectParameters>
                                <asp:Parameter Name="ProductColorName" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </section>
                    <section class="sec-pro">
                        <h3>chất liệu</h3>
                        <asp:RadioButtonList ID="chkProductMaterial" CssClass="check-list" AutoPostBack="true" runat="server" DataSourceID="odsProductMaterial" DataTextField="ProductMaterialName" DataValueField="ProductMaterialID"></asp:RadioButtonList>
                        <asp:ObjectDataSource ID="odsProductMaterial" runat="server"
                            SelectMethod="ProductMaterialSelectAll" TypeName="TLLib.ProductMaterial">
                            <SelectParameters>
                                <asp:Parameter Name="ProductMaterialName" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                <asp:Parameter Name="ProductID" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </section>
                    <section class="sec-pro">
                        <h3>kiểu dáng</h3>
                        <asp:RadioButtonList ID="chkProductStyle" CssClass="check-list" AutoPostBack="true" runat="server" DataSourceID="odsProductStyle" DataTextField="ProductStyleName" DataValueField="ProductStyleID"></asp:RadioButtonList>
                        <asp:ObjectDataSource ID="odsProductStyle" runat="server"
                            SelectMethod="ProductStyleSelectAll" TypeName="TLLib.ProductStyle">
                            <SelectParameters>
                                <asp:Parameter Name="ProductStyleName" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                <asp:Parameter Name="ProductID" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </section>
                    <section class="sec-pro">
                        <h3>giá</h3>
                        <%--<ul>
                    <li>
                        <asp:CheckBox ID="CheckBox45" runat="server" />
                        < 200.000đ</li>
                    <li>
                        <asp:CheckBox ID="CheckBox46" runat="server" />
                        200.000đ - 300.000đ</li>
                    <li>
                        <asp:CheckBox ID="CheckBox47" runat="server" />
                        500.000đ - 1.000.000đ</li>
                </ul>--%>
                        <asp:RadioButtonList ID="chkPrice" runat="server" AutoPostBack="true" OnSelectedIndexChanged="chkPrice_SelectedIndexChanged">
                            <asp:ListItem Text="< 200.000đ" Value="1"></asp:ListItem>
                            <asp:ListItem Text="200.000đ - 300.000đ" Value="2"></asp:ListItem>
                            <asp:ListItem Text="500.000đ - 1.000.000đ" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </section>
                </div>
                <div class="main-pro">
                    <div class="slide-default">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <asp:ListView ID="lstBanner1" runat="server"
                                    DataSourceID="odsBanner" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <li data-target="#carousel-example-generic" data-slide-to='<%# Container.DataItemIndex %>' class='<%# (Container.DataItemIndex) == 0 ? "active" : "" %>'></li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
                                    </LayoutTemplate>
                                </asp:ListView>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <asp:ListView ID="lstBanner2" runat="server"
                                    DataSourceID="odsBanner" EnableModelValidation="True">
                                    <ItemTemplate>
                                        <div class='<%# (Container.DataItemIndex) == 0 ? "item active" : "item" %>'>
                                            <img alt='<%# Eval("FileName") %>' src='<%# "~/res/advertisement/" + Eval("FileName") %>'
                                                visible='<%# string.IsNullOrEmpty(Eval("FileName").ToString()) ? false : true %>' runat="server" />
                                            <div class="carousel-caption">
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <span runat="server" id="itemPlaceholder" />
                                    </LayoutTemplate>
                                </asp:ListView>
                                <asp:ObjectDataSource ID="odsBanner" runat="server"
                                    SelectMethod="AdsBannerSelectAll"
                                    TypeName="TLLib.AdsBanner">
                                    <SelectParameters>
                                        <asp:Parameter Name="StartRowIndex" Type="String" />
                                        <asp:Parameter Name="EndRowIndex" Type="String" />
                                        <asp:Parameter Name="AdsCategoryID" Type="String" />
                                        <asp:Parameter Name="CompanyName" Type="String" />
                                        <asp:Parameter Name="Website" Type="String" />
                                        <asp:Parameter Name="FromDate" Type="String" />
                                        <asp:Parameter Name="ToDate" Type="String" />
                                        <asp:Parameter DefaultValue="True"
                                            Name="IsAvailable" Type="String" />
                                        <asp:Parameter Name="Priority" Type="String" />
                                        <asp:Parameter DefaultValue="True"
                                            Name="SortByPriority" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                    <div class="wrap-pro-cate">

                        <div class="pro-cate-id">
                            <h3>
                                <asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3>
                            <div class="filter">
                                <span>Sắp xếp theo</span>
                                <%--<select>
                    <option value="value" selected="selected">Sản phẩm ưa chuộng</option>
                    <option value="value">Sản phẩm mới</option>
                    <option value="value">Sản phẩm mua nhiều</option>
                </select>--%>
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem Value="1">--Săp xếp--</asp:ListItem>
                                    <asp:ListItem Value="2">Sản phẩm ưa chuộng</asp:ListItem>
                                    <asp:ListItem Value="3">Sản phẩm mới</asp:ListItem>
                                    <asp:ListItem Value="4">Sản phẩm mua nhiều</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="pro-cate">
                            <%--<asp:ListView ID="lstProducts" runat="server"
                                DataSourceID="odsProducts" EnableModelValidation="True">
                                <ItemTemplate>
                                    <div class="item">
                                        <div class="item-wrap">
                                            <div class="item-img">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                                    <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                                        visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>'
                                                        runat="server" /></a>
                                                <%# Eval("IsNew").ToString()=="True" ? "<div class='new'><p>new</p></div>" : "" %>
                                                <%# Eval("IsHot").ToString()=="True" ? "<div class='hot'><p>hot</p></div>" : "" %>
                                            </div>
                                            <div class="item-content">
                                                <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'><%# Eval("ProductName") + " - " + Eval("Tag") %></a>
                                                <p><%# !string.IsNullOrEmpty(Eval("Price").ToString()) ? (string.Format("{0:##,###.##}", Eval("Price")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%> <span><%# !string.IsNullOrEmpty(Eval("SavePrice").ToString()) ? (string.Format("{0:##,###.##}", Eval("SavePrice")).Replace('.', '*').Replace(',', '.').Replace('*', ',') + " đ") : "0"%></span></p>
                                                <div class="bnt-mua"><a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>MUA</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>--%>
                            <asp:ObjectDataSource ID="odsProducts" runat="server"
                                SelectMethod="ProductSelectAll1"
                                TypeName="TLLib.Product">
                                <SelectParameters>
                                    <asp:Parameter Name="StartRowIndex" Type="String" />
                                    <asp:Parameter Name="EndRowIndex" Type="String" />
                                    <asp:Parameter Name="Keyword" Type="String" />
                                    <asp:Parameter Name="ProductName" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:ControlParameter ControlID="txtAmoutLeft" Name="PriceFrom" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txtAmoutRight" Name="PriceTo" PropertyName="Text" Type="String" />
                                    <asp:QueryStringParameter QueryStringField="pci" DefaultValue="3" Name="CategoryID" Type="String" />
                                    <asp:ControlParameter ControlID="chkManufacturer" Name="ManufacturerID" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="chkProductMaterial" Name="ProductMaterialID" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="chkProductStyle" Name="ProductStyleID" PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="chkProductColor" Name="ProductOptionCategoryName" PropertyName="SelectedValue" Type="String" />
                                    <asp:Parameter Name="OriginID" Type="String" />
                                    <asp:Parameter Name="Tag" Type="String" />
                                    <asp:Parameter Name="InStock" Type="String" />
                                    <asp:Parameter Name="IsHot" Type="String" />
                                    <asp:Parameter Name="IsNew" Type="String" />
                                    <asp:Parameter Name="IsBestSeller" Type="String" />
                                    <asp:Parameter Name="IsPopular" Type="String" />
                                    <asp:Parameter Name="IsSaleOff" Type="String" />
                                    <asp:Parameter Name="IsShowOnHomePage" Type="String" />
                                    <asp:Parameter Name="FromDate" Type="String" />
                                    <asp:Parameter Name="ToDate" Type="String" />
                                    <asp:Parameter Name="Priority" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <div class="clr"></div>
                            <asp:ListView ID="lstProducts" runat="server"
                                DataSourceID="odsProducts" EnableModelValidation="True" Visible="false">
                                <ItemTemplate>
                                    </ItemTemplate>
                                <LayoutTemplate>
                                    <span runat="server" id="itemPlaceholder" />
                                </LayoutTemplate>
                            </asp:ListView>
                            <div class="pager">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12" PagedControlID="lstProducts">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="true" ShowNextPageButton="false"
                                            ShowPreviousPageButton="false" ButtonCssClass="first fa fa-backward" RenderDisabledButtonsAsLabels="true"
                                            FirstPageText="" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowNextPageButton="false"
                                            ShowPreviousPageButton="true" ButtonCssClass="prev fa fa-caret-left" RenderDisabledButtonsAsLabels="true"
                                            PreviousPageText="" />
                                        <asp:NumericPagerField ButtonCount="5" NumericButtonCssClass="numer-paging" CurrentPageLabelCssClass="current" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="false" ButtonCssClass="next fa fa-caret-right"
                                            ShowNextPageButton="true" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                            NextPageText="" />
                                        <asp:NextPreviousPagerField ButtonType="Link" ShowLastPageButton="True" ButtonCssClass="last fa fa-forward"
                                            ShowNextPageButton="false" ShowPreviousPageButton="false" RenderDisabledButtonsAsLabels="true"
                                            LastPageText="" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

