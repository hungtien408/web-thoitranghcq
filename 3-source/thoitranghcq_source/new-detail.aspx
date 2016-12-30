<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="new-detail.aspx.cs" Inherits="product_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="site">
        <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span>
            <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="container">

        <asp:ListView ID="lstNewDetail" runat="server"
            DataSourceID="odsNewDetail" EnableModelValidation="True">
            <ItemTemplate>
                <h2><%# Eval("ProductName") %></h2>
                <div class="content">
                    <%# Eval("Content") %>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsNewDetail" runat="server"
            SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID"
                    QueryStringField="tt" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

