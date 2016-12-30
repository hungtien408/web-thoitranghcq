<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
    <div class="container">
        <div class="camket">
            <div class="item">
                <div class="item-wrap">
                    <h3>cam kết</h3>
                    <p>Sản phẩm như hình</p>
                </div>
            </div>
            <div class="item">
                <div class="item-wrap">
                    <h3>mua hàng miễn phí</h3>
                    <p>Với đơn hàng từ 300k</p>
                </div>
            </div>
            <div class="item">
                <div class="item-wrap">
                    <h3>chuyển khoản</h3>
                    <p>Thanh toán khi nhận hàng</p>
                </div>
            </div>
            <div class="item">
                <div class="item-wrap">
                    <h3>miễn phí trả hàng</h3>
                    <p>Nếu không phù hợp</p>
                </div>
            </div>
        </div>
    </div>
    <div class="new-pro">
        <div class="container">
            <div class="sec-id">
                <h2>hàng mới về</h2>
            </div>
            <div class="pro-cate">
                <asp:ListView ID="lstProductNew" runat="server"
                    DataSourceID="odsProductNew" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="item-wrap">
                                <div class="item-img">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' runat="server" /></a>
                                    <%# Eval("IsNew").ToString()=="True" ? "<div class='new'><p>new</p></div>" : "" %>
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
                <asp:ObjectDataSource ID="odsProductNew" runat="server"
                    SelectMethod="ProductSelectAll1"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter DefaultValue="3" Name="CategoryID" Type="String" />
                        <asp:Parameter Name="ManufacturerID" Type="String" />
                        <asp:Parameter Name="ProductMaterialID" Type="String" />
                        <asp:Parameter Name="ProductStyleID" Type="String" />
                        <asp:Parameter Name="ProductOptionCategoryName" Type="String" />
                        <asp:Parameter Name="ProductColorID" Type="String" />
                        <asp:Parameter Name="OriginID" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="InStock" Type="String" />
                        <asp:Parameter Name="IsHot" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsNew" Type="String" />
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
            </div>
        </div>
    </div>
    <div class="hot-pro">
        <div class="container">
            <div class="sec-id">
                <h2>sản phẩm hot</h2>
            </div>
            <div class="pro-cate">
                <asp:ListView ID="lstProductHot" runat="server"
                    DataSourceID="odsProductHot" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <div class="item-wrap">
                                <div class="item-img">
                                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                                        <img alt='<%# Eval("ImageName") %>' src='<%# "~/res/product/" + Eval("ImageName") %>'
                                            visible='<%# string.IsNullOrEmpty(Eval("ImageName").ToString()) ? false : true %>' runat="server" /></a>
                                    <%# Eval("IsHot").ToString() == "True" ? "<div class='hot'><p>hot</p></div>" : "" %>
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
                <asp:ObjectDataSource ID="odsProductHot" runat="server"
                    SelectMethod="ProductSelectAll1"
                    TypeName="TLLib.Product">
                    <SelectParameters>
                        <asp:Parameter Name="StartRowIndex" Type="String" />
                        <asp:Parameter Name="EndRowIndex" Type="String" />
                        <asp:Parameter Name="Keyword" Type="String" />
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="PriceFrom" Type="String" />
                        <asp:Parameter Name="PriceTo" Type="String" />
                        <asp:Parameter DefaultValue="3" Name="CategoryID" Type="String" />
                        <asp:Parameter Name="ManufacturerID" Type="String" />
                        <asp:Parameter Name="ProductMaterialID" Type="String" />
                        <asp:Parameter Name="ProductStyleID" Type="String" />
                        <asp:Parameter Name="ProductOptionCategoryName" Type="String" />
                        <asp:Parameter Name="ProductColorID" Type="String" />
                        <asp:Parameter Name="OriginID" Type="String" />
                        <asp:Parameter Name="Tag" Type="String" />
                        <asp:Parameter Name="InStock" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsHot" Type="String" />
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
            </div>
        </div>
    </div>
    <div class="cate-thuonghieu">
        <div class="container">
            <div class="sec-id">
                <h2>thương hiệu</h2>
            </div>
            <div class="cate-item">
                <asp:ListView ID="lstThuongHieu" runat="server"
                    DataSourceID="odsThuongHieu" EnableModelValidation="True">
                    <ItemTemplate>
                        <div class="item">
                            <a href='<%# progressTitle(Eval("ManufacturerName")) + "-th-" + Eval("ManufacturerID") + ".aspx" %>'>
                                <img alt='<%# Eval("ManufacturerImage") %>' src='<%# "~/res/manufacturer/" + Eval("ManufacturerImage") %>'
                                    visible='<%# string.IsNullOrEmpty(Eval("ManufacturerImage").ToString()) ? false : true %>'
                                    runat="server" />
                            </a>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsThuongHieu" runat="server" SelectMethod="ManufacturerSelectAll" TypeName="TLLib.Manufacturer1">
                    <SelectParameters>
                        <asp:Parameter Name="ManufacturerName" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                        <asp:Parameter Name="Priority" Type="String" />
                        <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                        <asp:Parameter Name="ProductID" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>

