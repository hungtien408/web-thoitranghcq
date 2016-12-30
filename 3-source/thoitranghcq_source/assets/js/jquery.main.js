(function ($) {
    $(window).load(function () {
        height_pop();
    });
    $(window).resize(function () {
        height_pop();
    });
    $(function () {
        myfunload();
        $('.dn-btn').on('click', function (e) {
            e.preventDefault();
            $('.popup .popup-content').css({ 'top': '-250%' });
            $('.popup_1 .popup-content').css({ 'top': '30px' });
        });
        $('.dk-btn').on('click', function (e) {
            e.preventDefault();
            $('.popup_1 .popup-content').css({ 'top': '-250%' });
            $('.popup .popup-content').css({ 'top': '30px' });
        });
    });
})(jQuery);
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu > li:last-child").addClass("last");
    $("#menu > li:first-child").addClass("fisrt");

    $("#menu > li").find("ul").addClass("menu-level");

    $('#menu li').hover(function () {
        $(this).children('ul').stop(true, false, true).slideToggle(300);
    });
    /*===== set data-img = background =====*/
    var a = $(".it-tm .items-img").attr("data-img");
    var b = $(".it-dv .items-img").attr("data-img");
    $(".it-tm .items-img").css({ "background-image": "url(" + a + ")" });
    $(".it-dv .items-img").css({ "background-image": "url(" + b + ")" });

    /*======= slick =======*/
    $(".partner").slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        autoplay: true,
        dots: false,
        autoplaySpeed: 2000,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 4,
                    slidesToScroll: 3,
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
            }
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    })
    $('#sliderGallery .slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '#sliderGallery .slider-nav'
    });
    $('#sliderGallery .slider-nav').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        asNavFor: '#sliderGallery .slider-for',
        dots: false,
        arrows:true,
        focusOnSelect: true,
        vertical: true,
        responsive: [
            {
                breakpoint: 992,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    vertical: false,
                }
            },
            // You can unslick at a given breakpoint now by adding:
            // settings: "unslick"
            // instead of a settings object
        ]
    });

    $('.search img').click(function () {
        $(this).next('.form').slideToggle(300);
    });

    $('.clean-td').click(function () {
        $(this).parents('tr').remove();
    });


    $('.popup-content').mCustomScrollbar({
        autoHideScrollbar: true,
        theme: "dark-thick",
    });


    /*** each elements to get max height ***/
    var maxHeight = 0;
    $(".art-postcontent .col-md-4 .items, .dich-vu-cate .col-md-4 .thumbnail").each(function () {
        if ($(this).height() > maxHeight) { maxHeight = $(this).height(); }
    });
    $(".art-postcontent .col-md-4 .items, .dich-vu-cate .col-md-4 .thumbnail").height(maxHeight);    
}
/*=========================================================================*/
//================== scroll top
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scroll-to-top').fadeIn();
    } else {
        $('.scroll-to-top').fadeOut();
    }
});

$('.scroll-to-top').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, 800);
    return false;
});

/** popup **/
$('.log img').click(function () {
    $('#main-content').append('<div id="overlay-screen-active">');
    //$('.popup .popup-content').css('top', '30px');
    $('.popup_1 .popup-content').css('top', '30px');
});
$(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
    $('.popup-content').css('top', '-250%');
    $('#overlay-screen-active').fadeOut();
    $('#overlay-screen-active').remove();
    return false;
});
$(document).ready(function () {
    $(window).resize(function () {
        var winwidth = $(window).width();
        $('.log img').click(function () {
            $('#main-content').append('<div id="overlay-screen-active">');
            $('#overlay-screen-active').remove();
            //$('.popup .popup-content').css('top', '30px');
            $('.popup_1 .popup-content').css('top', '30px');
        });
        $(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
            $('.popup-content').css('top', '-250%');
            $('#overlay-screen-active').fadeOut();
            $('#overlay-screen-active').remove();
            return false;
        });
    }).resize();
});

$('.cart img').click(function () {
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.popup_cart .popup-content').css('top', '30px');
});
$(document).ready(function () {
    $(window).resize(function () {
        var winwidth = $(window).width();
        $('.cart img').click(function () {
            $('#main-content').append('<div id="overlay-screen-active">');
            $('#overlay-screen-active').remove();
            $('.popup_cart .popup-content').css('top', '30px');
        });
    }).resize();
});

function height_pop() {
    var n = $(window).height();
    $('.scroll-popup').each(function () {
        var x = $(this).children('.popup-content').height();
        if (x > n) {
            $(this).children('.popup-content').css('max-height', n - 50);
            $(this).children('.popup-content').css('height', 'auto');
        }
        else {
            $(this).children('.popup-content').css('max-height', n - 50);
        }
    })
    //$('.popup-content').css('max-height', n - 50);
}
/// Product Detail

$('.info .color .items').on('click', function () {
    $(".info .color .items").removeClass("active");
    $(this).addClass('active');
});

$(document).on('click', '.info .size .items', function () {
    $(".info .size .items").removeClass("active");
    $(this).addClass('active');
    var productlengthid = $(this).attr("productlengthid");
    var productlengthname = $(this).attr("productlengthname");
    $("[id$='hdnProductLengthID']").val(productlengthid);
    $("[id$='hdnProductLengthName']").val(productlengthname);
});

$(".ddd").on("click", function () {
    var $button = $(this),
        $input = $button.closest('.sp-quantity').find("input.quntity-input");
    var oldValue = $input.val(),
        newVal;
    if ($.trim($button.text()) == "+") {
        newVal = parseFloat(oldValue) + 1;
    } else {
        // Don't allow decrementing below zero
        if (oldValue > 1) {
            newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 1;
        }
    }
    $input.val(newVal);
});

$('.buy-btn').on('click', function () {
    var color = $('.right-detail-sp .info li .color .items');
    var size = $('.right-detail-sp .info li .size .items');
    if ($(color).hasClass('active') &&
        $(size).hasClass('active')) {
        //window.location = "gio-hang.aspx" + this.id;
    }
    else if ($(color).not('.active') && $(size).hasClass('active')) {
        $('.check-attribute').addClass('show');
        $('.check-attribute').html("Bạn hãy chọn <b>màu sắc!</b>");
    }
    else if ($(size).not('.active') && $(color).hasClass('active')) {
        $('.check-attribute').addClass('show');
        $('.check-attribute').html("Bạn hãy chọn <b>kích thước!</b>");
    }
    else {
        $('.check-attribute').addClass('show');
        $('.check-attribute').html("Bạn hãy chọn đầy đủ <b>màu sắc và kích thước!</b>");
    }
})

$("#listcolor .link-color:first").addClass("current");
$("#listcolor .items:first").addClass("active");
$("#listcolor .link-color").click(function () {
    $("[id$='ddlQuantity']").html("<option value='0'>- Chọn -</option>");
    $("#listcolor .link-color").removeClass("current");
    $(this).addClass("current");
    $("#listcolor .items").removeClass("active");
    $(this).parents().addClass("active");
    $("#sliderGallery .img-color").hide();
    //
    var produtcolorid = $(this).attr("productcolorid");
    var productcolorname = $(this).attr("productcolorname");
    var productid = $("[id$='hdnProductID']").attr("value");
    $('#loading').html('<img src="assets/images/loading.gif">');
    $.ajax({
        type: "POST",
        url: "product-detail.aspx/LoadSize",
        data: "{'ProductColorID': '" + produtcolorid + "','ProductID': '" + productid + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: true,
        cache: false,
        success: function (msg) {
            if (msg.d != "") {
                $("[id$='ddlProductLength']").html(msg.d);
                $('#loading').html(msg);
            }
        }
    });
    $("[id$='hdnProductOptionCategoryID']").val(produtcolorid);
    $("[id$='hdnProductOptionCategoryName']").val(productcolorname);
    //End
    var idopen = $(this).attr("href");
    $(idopen).show();
    $(idopen).find(".img-color:first").trigger("click");
    return false;
});
$("#listcolor .link-color:first").trigger("click");
$("[id$='hdnIsQuantity']").val($("#inQuantity").val());
function myFunction(val) {
    $("[id$='hdnIsQuantity']").val(val);
}
$(document).ready(function () {
    $("[id$='ddlProductLength']").change(function () {
        var productid = $("[id$='hdnProductID']").val();
        var sizeid = $("[id$='ddlProductLength'] ").val();
        var sizename = $("[id$='ddlProductLength'] option:selected").text();
        //alert(sizename);
        var colorid = $("#listcolor a.current").attr("productcolorid");
        $('#loading1').html('<img src="assets/images/loading.gif">');
        $.ajax({

            type: "POST",

            url: "product-detail.aspx/LoadQuantity",

            data: "{'ProductID': '" + productid + "','ProductSizeID': '" + sizeid + "','ProductColorID': '" + colorid + "'}",

            contentType: "application/json; charset=utf-8",

            dataType: "json",

            async: true,

            cache: false,

            success: function (msg) {
                if (msg.d != "") {
                    $("[id$='inQuantity']").html(msg.d);
                    $('#loading1').html(msg);
                }
                //$("[id$='hdnProductLengthName']").val(sizename);
                //alert(hdn.val());
            }
        });
        $.ajax({

            type: "POST",

            url: "product-detail.aspx/LoadQuantity1",

            data: "{'ProductID': '" + productid + "','ProductSizeID': '" + sizeid + "','ProductColorID': '" + colorid + "'}",

            contentType: "application/json; charset=utf-8",

            dataType: "json",

            async: true,

            cache: false,

            success: function (msg) {
                if (msg.d != "") {
                    $("[id$='hdnIsQuantity']").val(msg.d);
                    $('#loading1').html(msg);
                }
                //$("[id$='hdnProductLengthName']").val(sizename);
                //alert(hdn.val());
            }
        });
        $("[id$='hdnProductLengthID']").val(sizeid);
        $("[id$='hdnProductLengthName']").val(sizename);
    });
    $("[id$='inQuantity']").change(function () {
        var quantitysale = $("[id$='inQuantity']").val();
        var hdnquantitysale = $("[id$='hdnQuantitySale']").val(quantitysale);
        //alert(hdnquantitysale.val());
    });

});
/// End Product Detail