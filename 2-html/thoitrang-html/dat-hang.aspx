<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="dat-hang.aspx.cs" Inherits="dat_hang" %>

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
                                <asp:TextBox ID="txtFullName" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-w">
                            <label class="contact-lb">Họ &amp; Tên đệm <span>*</span></label>
                            <div class="input-form" style="width: 315px;">
                                <asp:TextBox ID="TextBox1" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>
                            <label class="contact-lb" style="width: 50px; margin-left: 25px;">Tên <span>*</span></label>
                            <div class="input-form" style="width: 175px;">
                                <asp:TextBox ID="TextBox2" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-w">
                            <label class="contact-lb">Địa chỉ <span>*</span></label>
                            <div class="input-form">
                                <asp:TextBox ID="TextBox3" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>
                            <label class="contact-lb" style="opacity: 0;">Địa chỉ <span>*</span></label>
                            <div class="select">
                                <select>
                                    <option value="">Tỉnh/TP</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <div class="select">
                                <select>
                                    <option value="">Quận/Huyện</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                            <div class="select">
                                <select>
                                    <option value="">Phường/Xã</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-w">
                            <label class="contact-lb">Điện thoại di động <span>*</span></label>
                            <div class="input-form">
                                <asp:TextBox ID="TextBox4" CssClass="contact-textbox" runat="server" placeholder=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="order2">
                    <h1>HÌNH THỨC THANH TOÁN</h1>
                    <div class="radio-form">
                        <div class="radio-left">
                            <input type="radio" name="gender" value="male">
                            <div class="text-radio">
                                <h2>THANH TOÁN KHI NHẬN HÀNG</h2>
                            </div>
                        </div>
                        <div class="radio-right">
                            <input type="radio" name="gender" value="male">
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
                    <div class="box1">
                        <h1>Set váy bút chì túi xéo + Áo bèo peplum</h1>
                        <ul>
                            <li>
                                <asp:Label ID="Label1" runat="server" Text="Màu sắc:" CssClass="label"></asp:Label>
                                <div class="color-img">
                                    <img src="assets/images/mau1.jpg" alt="" />
                                </div>
                            </li>
                            <li>
                                <asp:Label ID="Label2" runat="server" Text="Kích thướt:" CssClass="label"></asp:Label>
                                <div class="size-img">
                                    <span>S</span>
                                </div>
                            </li>
                            <li>
                                <asp:Label ID="Label3" runat="server" Text="Số lượng:" CssClass="label"></asp:Label>
                                <div class="number">
                                    <span>1</span>
                                </div>
                                <div class="gia">x360.000đ</div>
                            </li>
                        </ul>
                    </div>
                    <div class="box2">
                        <p>Tổng đơn hàng: <span>360.000đ</span></p>
                    </div>
                    <div class="box3">
                        <p>Sử dụng Voucher<span><img src="assets/images/icon5.png" alt="" /></span></p>
                         <div class="input-1"><asp:TextBox ID="TextBox5" CssClass="contact-textbox1" runat="server" placeholder="NHẬP MÃ GIẢM GIÁ"></asp:TextBox></div>
                    </div>
                     <div class="box4">
                        <p>Phí vận chuyển: <span>0đ</span></p>
                    </div>
                     <div class="box5">
                        <p>Tổng thành tiền: <span>360.000đ</span></p>
                    </div>
                    <div class="box6">
                        <asp:Button ID="btnGui" CssClass="button-mua1" runat="server" Text="THANH TOÁN" />
                    </div>
                    <div class="box7">
                        <asp:Label ID="Label4" runat="server" Text="Ghi chú:" CssClass="label"></asp:Label>
                        <asp:TextBox ID="TextBox6" CssClass="contact-area" runat="server" TextMode="MultiLine" placeholder=""></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

