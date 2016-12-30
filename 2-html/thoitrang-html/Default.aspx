<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Thời Trang</title>
    <meta name="description" content="Thời Trang" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="slide-default">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
                <div class="item">
                    <img src="assets/images/slide.png" alt="" />
                    <div class="carousel-caption">
                    </div>
                </div>
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
    <div class="hot-pro">
        <div class="container">
            <div class="sec-id">
                <h2>sản phẩm hot</h2>
            </div>
            <div class="pro-cate">
                <div class="item">
                    <div class="item-wrap">
                        <div class="item-img">
                            <a href="#">
                                <img src="assets/images/sp-1.png" alt="" /></a>
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
                            <div class="hot">
                                <p>hot</p>
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
    <div class="cate-thuonghieu">
                    <div class="container">
                        <div class="sec-id"><h2>thương hiệu</h2></div>
                        <div class="cate-item">
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-1.png" alt="" />
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-2.png" alt="" />
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-3.png" alt="" />
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-4.png" alt="" />
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-5.png" alt="" />
                                </a>
                            </div>
                            <div class="item">
                                <a href="#">
                                    <img src="assets/images/th-6.png" alt="" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>

