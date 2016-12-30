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

    /* slider jqueru ui */
    $("#slider").slider({
        range: true,
        min: 155000,
        max: 2890000,
        values: [155000, 2890000],
        slide: function (event, ui) {
            $("#amount-left").html(ui.values[0] + " đ");
            $("#amount-right").html(ui.values[1] + " đ");

            $('.amount').text(function () {
                var str = $(this).html() + '';
                x = str.split('.');
                x1 = x[0]; x2 = x.length > 1 ? '.' + x[1] : '';
                var rgx = /(\d+)(\d{3})/;
                while (rgx.test(x1)) {
                    x1 = x1.replace(rgx, '$1' + '.' + '$2');
                }
                $(this).html(x1 + x2);
            });
        }
    });
    $("#amount-left").html($("#slider").slider("values", 0) + " đ");
    $("#amount-right").html($("#slider").slider("values", 1) + " đ");

    /* format number */
    $('.amount').text(function () {
        var str = $(this).html() + '';
        x = str.split('.');
        x1 = x[0]; x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
        }
        $(this).html(x1 + x2);
    });

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
    $('.popup .popup-content').css('top', '30px');
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
            $('.popup .popup-content').css('top', '30px');
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