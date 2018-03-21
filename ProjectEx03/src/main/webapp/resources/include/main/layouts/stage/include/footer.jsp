<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="text-center" >
    <div class="footer-above" style="padding-top: 30px; padding-right: 520px; padding-left: 45px;">
        <div class="container">
            <div class="row">
                <div class="footer-col col-md-4" style="margin-bottom: 30px;">
                    <h3>LOCATION</h3>
                    <p>서울시 금천구 가산동<br>426-5 월드메르디앙 2차 14층</p>
                </div>
                <div class="footer-col col-md-4" style="margin-bottom: 30px;">
                    <ul class="list-inline">
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                        </li>
                        <li>
                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="footer-col col-md-4" style="margin-bottom: 30px;">
                    <h3>CONTACT</h3>
                    <p>Tel 010-8323-9068</p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12" style="width: 59.6%;">
                    Copyright &copy;  CSM (코드로 사람을 만나다.)
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-top page-scroll visible-xs visible-sm">
    <a class="btn btn-primary" href="#page-top">
        <i class="fa fa-chevron-up"></i>
    </a>
</div>
<script src="http://witch02.dothome.co.kr/01/theme/01/js/bootstrap.min.js"></script>
<script src="http://witch02.dothome.co.kr/01/theme/01/js/jquery.easing.min.js"></script>
<script src="http://witch02.dothome.co.kr/01/theme/01/js/wow.min.js"></script>
    <!-- Contact Form JavaScript --> 
<script src="http://witch02.dothome.co.kr/01/theme/01/js/jqBootstrapValidation.js"></script> 
<script src="http://witch02.dothome.co.kr/01/theme/01/js/contact_me.js"></script> 
<script>
(function($) {
    'use strict';
    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $(function() {
        $('body').on('click', '.page-scroll a', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
            }, 1500, 'easeInOutExpo');
            event.preventDefault();
        });
    });

    // Floating label headings for the contact form
    $(function() {
        $("body").on("input propertychange", ".floating-label-form-group", function(e) {
            $(this).toggleClass("floating-label-form-group-with-value", !! $(e.target).val());
        }).on("focus", ".floating-label-form-group", function() {
            $(this).addClass("floating-label-form-group-with-focus");
        }).on("blur", ".floating-label-form-group", function() {
            $(this).removeClass("floating-label-form-group-with-focus");
        });
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    })

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a:not(.dropdown-toggle)').click(function() {
        $('.navbar-toggle:visible').click();
    });
    $('[data-toggle="popover"]').popover();
    $('[data-toggle="tooltip"]').tooltip();
    if ($().lightSlider) {
        $('#main-slider').lightSlider({
            item: 1,
            auto:true,
            loop: true,
            slideMove: 1,
            slideMargin:0,
            speed: 1000,
            pause: 4000,
            keyPress: true,
            pager: false
        });
    }
    if($().imagesLoaded) {
        $('#container').imagesLoaded( { background: true }, function() {
            $('#loader').fadeOut('slow');
        });
    }
    $(window).resize(function() {
        var width = $(this).width();
        var height = $(this).height();

        $('.full-height').height(height);
        $('.half-height').height(height / 2);
        $('.aThird-height').height(height / 3);
    }).trigger('resize');
    $(window).scroll(function() {
        var st = $(this).scrollTop();
        if(st > 10) {
            $('#header').addClass('st-active');
        } else {
            $('#header').removeClass('st-active');
        }
    });
})(jQuery);

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem, c ) {
    return elem.classList.contains( c );
  };
  addClass = function( elem, c ) {
    elem.classList.add( c );
  };
  removeClass = function( elem, c ) {
    elem.classList.remove( c );
  };
}
else {
  hasClass = function( elem, c ) {
    return classReg( c ).test( elem.className );
  };
  addClass = function( elem, c ) {
    if ( !hasClass( elem, c ) ) {
      elem.className = elem.className + ' ' + c;
    }
  };
  removeClass = function( elem, c ) {
    elem.className = elem.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem, c ) {
  var fn = hasClass( elem, c ) ? removeClass : addClass;
  fn( elem, c );
}

var classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

// transport
if ( typeof define === 'function' && define.amd ) {
  // AMD
  define( classie );
} else {
  // browser global
  window.classie = classie;
}

})( window );

var cbpAnimatedHeader = (function() {

    var docElem = document.documentElement,
        header = document.querySelector( '.navbar-fixed-top' ),
        didScroll = false,
        changeHeaderOn = 300;

    function init() {
        window.addEventListener( 'scroll', function( event ) {
            if( !didScroll ) {
                didScroll = true;
                setTimeout( scrollPage, 250 );
            }
        }, false );
    }

    function scrollPage() {
        var sy = scrollY();
        if ( sy >= changeHeaderOn ) {
            classie.add( header, 'navbar-shrink' );
            $('.scroll-top').removeClass('hidden-sm hidden-xs');
            $('.scroll-top').fadeIn(500);
            }
        else {
            classie.remove( header, 'navbar-shrink' );
            $('.scroll-top').fadeOut(500,  function() {
            $('.scroll-top').addClass('hidden-sm hidden-xs');
            });

        }
        didScroll = false;
    }

    function scrollY() {
        return window.pageYOffset || docElem.scrollTop;
    }

    init();

})();

/* IE8 이하 브라우저는 에니메이션 스크립트 실행 막아야함 */
var IE = -1;
if (navigator.appName == 'Microsoft Internet Explorer') {
    var ua = navigator.userAgent;
    var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
    if (re.exec(ua) != null) {
        IE = parseFloat(RegExp.$1);
    }
}
if(IE > 9 || IE == -1) new WOW().init();
</script>


<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>