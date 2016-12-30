<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="hoan-thanh-dat-hang.aspx.cs" Inherits="hoan_thanh_dat_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="hoanthanh-dathang">
            <h2>Đặt hàng thành công</h2>
            <p>Quý khách vừa đặt thành công sản phẩm của LADYfashion, mã đơn hàng của quý khách là: <b><%= Session["OrderNumber"].ToString() %></b>.            Sau khi shop xác nhận có hàng, sản phẩm sẽ được giao hàng đến địa chỉ của quý khách tại trong 2 ngày. Mọi thông tin về đơn hàng sẽ được gửi tới email             của quý khách, vui lòng kiểm tra email để biết thêm chi tiết.            </p>
            <div class="tieptuc">
                <a href="~/" runat="server">Tiếp tục mua sắm</a>
            </div>
        </div>
    </div>
</asp:Content>

