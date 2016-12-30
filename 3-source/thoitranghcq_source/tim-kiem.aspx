<%@ Page Title="" Language="C#" MasterPageFile="~/site-products.master" AutoEventWireup="true" CodeFile="tim-kiem.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sitemain" runat="Server">
    <div class="container">
        <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="javascript:void(0)">
            <asp:Label ID="lblName2" runat="server" Text=""></asp:Label></a>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPham" runat="server" />
    <a class="a-link-sp" href="<%= hdnSanPham.Value %>"></a>
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="pro-cate-id">
                    <h3>
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label></h3>
                    <div class="filter">
                        <span>Sắp xếp theo</span>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem Value="1">--Săp xếp--</asp:ListItem>
                            <asp:ListItem Value="2">Sản phẩm ưa chuộng</asp:ListItem>
                            <asp:ListItem Value="3">Sản phẩm mới</asp:ListItem>
                            <asp:ListItem Value="4">Sản phẩm mua nhiều</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="pro-cate">
                    <asp:ListView ID="lstProducts" runat="server"
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
                    </asp:ListView>
                    <asp:ObjectDataSource ID="odsProducts" runat="server"
                        SelectMethod="ProductSelectAll1"
                        TypeName="TLLib.Product">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String" />
                            <asp:Parameter Name="EndRowIndex" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                            <asp:QueryStringParameter Name="ProductName" QueryStringField="kw" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:QueryStringParameter Name="PriceFrom" QueryStringField="pf" Type="String" />
                            <asp:QueryStringParameter Name="PriceTo" QueryStringField="pt" Type="String" />
                            <asp:QueryStringParameter QueryStringField="pci" DefaultValue="3" Name="CategoryID" Type="String" />
                            <asp:QueryStringParameter QueryStringField="mans" Name="ManufacturerID" Type="String" />
                            <asp:QueryStringParameter QueryStringField="matr" Name="ProductMaterialID" Type="String" />
                            <asp:QueryStringParameter QueryStringField="prot" Name="ProductStyleID" Type="String" />
                            <asp:Parameter Name="ProductOptionCategoryName" Type="String" />
                            <asp:QueryStringParameter QueryStringField="color" Name="ProductColorID" Type="String" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

