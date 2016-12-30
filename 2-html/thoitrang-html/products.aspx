<%@ Page Title="" Language="C#" MasterPageFile="~/site-products.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Thời Trang</title>
    <meta name="description" content="Thời Trang" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="sitemain" runat="Server">
     <div class="container">
            <a href="./">Trang chủ</a> <span class="fa fa-angle-right"></span> <a href="javascript:void(0)">Hàng mới về</a>
        </div>
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

    <div class="wrap-pro-cate">
        <div class="pro-cate-id">
            <h3>hàng mới về</h3>
            <div class="filter">
                <span>Sắp xếp theo</span>
                <select>
                    <option value="value" selected="selected">Sản phẩm ưa chuộng</option>
                    <option value="value">Sản phẩm mới</option>
                    <option value="value">Sản phẩm mua nhiều</option>
                </select>
            </div>
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

            <div class="clr"></div>
            <div class="pager">
                <a href="#" class="prev fa fa-caret-left"></a>
                <a href="#" class="current">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#" class="next fa fa-caret-right"></a>
                <a href="#" class="last fa fa-forward"></a>
            </div>
        </div>
    </div>
</asp:Content>

