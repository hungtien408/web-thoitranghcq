<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="product_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thời Trang</title>
    <meta name="description" content="Thời Trang" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="site">
        <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span><a href="product.aspx">Sản phẩm</a> <span class="fa fa-angle-right"></span><a href="javascript:void(0)">Sản phẩm chi tiết</a>
        </div>
    </div>
    <div class="container">
        <div class="product-detail-main">
            <div class="product-left">
                <div id="sliderGallery" class="gallery-slider">
                    <div class="slider-for">
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img1-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img2-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                        <div class="slider-big">
                            <div class="gallery-group">
                                <div class="gallery-img">
                                    <img src="assets/images/img3-big.jpg" alt="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gallery-smalls">
                        <div class="slider-nav">
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img1-small.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img2-small.jpg" />
                                    </div>
                                </div>
                            </div>
                            <div class="slider-small">
                                <div class="gallery-small">
                                    <div class="small-box">
                                        <img src="assets/images/img3-small.jpg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-right">
                <h1>Set váy bút chì túi xéo + Áo bèo peplum</h1>
                <div class="product-code">
                    Mã sản phẩm: <span>A0015</span>
                </div>
                <div class="product-price">
                    <span>480.000đ</span>
                    180.000đ
                </div>
                <div class="info">
                    <ul>
                        <li>
                            <asp:Label ID="Label1" runat="server" Text="Màu sắc:" CssClass="label"></asp:Label>
                            <div id="listcolor" class="color">
                                <div class="items active">
                                    <a class="link-color" href="javascript:void(0);">
                                        <img src="assets/images/mau1.jpg" alt="" /></a>
                                </div>
                                <div class="items">
                                    <a class="link-color" href="javascript:void(0);">
                                        <img src="assets/images/mau2.jpg" alt="" /></a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" Text="Kích thướt:" CssClass="label"></asp:Label>
                            <div class="size">
                                <div class="items active">
                                    <span>S</span>
                                </div>
                                <div class="items">
                                    <span>M</span>
                                </div>
                                <div class="items">
                                    <span>L</span>
                                </div>
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
                            <div class="thuonghieu">Honey Fashion</div>
                        </li>
                    </ul>
                </div>
                <div class="btn-mua">
                    <asp:Button ID="btnGui" CssClass="button-mua" runat="server" Text="MUA NGAY" />
                </div>
            </div>
        </div>
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
                        <p>Đầm xòe Leena xanh lá cổ đổ tà xéo được may từ chất liệu cao cấp cùng kiểu dáng trẻ trung, hiện đại sẽ giúp cho bạn gái luôn xinh đẹp và tỏa sáng. Sản phẩm dễ dàng kết hợp cùng các phụ kiện thời trang để tôn lên vẻ đẹp và phong cách riêng của bạn.</p>
                        <p><strong>HƯỚNG DẪN BẢO QUẢN</strong></p>
                        <p>- Ưu tiên giặt bằng tay và ủi ở nhiệt độ thấp.</p>
                        <p>- Không ngâm lâu.</p>
                        <p>- Ủi ở nhiệt đồ vừa.</p>
                        <p>- Phơi bề mặt trái, phơi trong bóng râm.</p>
                        <p>- Không dùng bột giặt có chất tẩy rửa mạnh.</p>
                        <p>- Không dùng chất tẩy rửa mạnh.</p>
                        <p><strong>THÔNG TIN THƯƠNG HIỆU</strong></p>
                        <p>Leena là thương hiệu thời trang công sở và dự tiệc, dành riêng cho phái đẹp có độ tuổi từ 18 đến trung niên. Với mục tiêu chính là mang đến những thiết kế đơn giản nhưng vẫn luôn cập nhật theo xu hướng thời trang mới nhất giúp người mặc khẳng định gu ăn mặc sang trọng, thanh lịch. Hơn thế nữa, thương hiệu Leena còn chú trọng đến chất liệu và kỹ thuật đem đến chất lượng tốt nhất cho các sản phẩm của mình.</p>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab2">
                    <div class="tab-main">
                        <p>Đầm xòe Leena xanh lá cổ đổ tà xéo được may từ chất liệu cao cấp cùng kiểu dáng trẻ trung, hiện đại sẽ giúp cho bạn gái luôn xinh đẹp và tỏa sáng. Sản phẩm dễ dàng kết hợp cùng các phụ kiện thời trang để tôn lên vẻ đẹp và phong cách riêng của bạn.</p>
                        <p><strong>HƯỚNG DẪN BẢO QUẢN</strong></p>
                        <p>- Ưu tiên giặt bằng tay và ủi ở nhiệt độ thấp.</p>
                        <p>- Không ngâm lâu.</p>
                        <p>Leena là thương hiệu thời trang công sở và dự tiệc, dành riêng cho phái đẹp có độ tuổi từ 18 đến trung niên. Với mục tiêu chính là mang đến những thiết kế đơn giản nhưng vẫn luôn cập nhật theo xu hướng thời trang mới nhất giúp người mặc khẳng định gu ăn mặc sang trọng, thanh lịch. Hơn thế nữa, thương hiệu Leena còn chú trọng đến chất liệu và kỹ thuật đem đến chất lượng tốt nhất cho các sản phẩm của mình.</p>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab3">
                    <div class="tab-main">
                        <p>Đầm xòe Leena xanh lá cổ đổ tà xéo được may từ chất liệu cao cấp cùng kiểu dáng trẻ trung, hiện đại sẽ giúp cho bạn gái luôn xinh đẹp và tỏa sáng. Sản phẩm dễ dàng kết hợp cùng các phụ kiện thời trang để tôn lên vẻ đẹp và phong cách riêng của bạn.</p>
                        <p><strong>HƯỚNG DẪN BẢO QUẢN</strong></p>
                        <p><strong>THÔNG TIN THƯƠNG HIỆU</strong></p>
                        <p>Leena là thương hiệu thời trang công sở và dự tiệc, dành riêng cho phái đẹp có độ tuổi từ 18 đến trung niên. Với mục tiêu chính là mang đến những thiết kế đơn giản nhưng vẫn luôn cập nhật theo xu hướng thời trang mới nhất giúp người mặc khẳng định gu ăn mặc sang trọng, thanh lịch. Hơn thế nữa, thương hiệu Leena còn chú trọng đến chất liệu và kỹ thuật đem đến chất lượng tốt nhất cho các sản phẩm của mình.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-all">
            <h2>SẢN PHẨM CÙNG THƯƠNG HIỆU</h2>
            <div class="pro-cate">
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-1.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-2.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-3.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-4.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-5.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-6.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-7.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-8.png" alt="" /></a>
                            <div class="new">
                                <p>new</p>
                            </div>
                        </div>
                        <div class="item-content">
                            <a href="#">Áo sơ mi họa tiết hoa tay ngắn màu Hồng  - A0015</a>
                            <p>180.000đ <span>480.000đ</span></p>
                            <div class="bnt-mua"><a href="#">MUA</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

