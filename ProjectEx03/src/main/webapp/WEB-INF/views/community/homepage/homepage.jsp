<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resources/include/header.jsp"%>
    <link rel="stylesheet" href="/resources/community/css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/resources/community/css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="/resources/community/css/grid.css" type="text/css" media="screen">   
	<script src="/resources/community/js/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="/resources/community/js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="/resources/community/js/jcarousellite_1.0.1.js" type="text/javascript"></script>
    <script src="/resources/community/js/jquery.galleriffic.js" type="text/javascript"></script>
    <script src="/resources/community/js/jquery.opacityrollover.js" type="text/javascript"></script> 
    <script type="text/javascript">
		$(document).ready(function() { 
			$(".jCarouselLite").jCarouselLite({
				  btnNext: ".next",
				  btnPrev: ".prev",		  
				  speed: 400,		  
				  vertical: false,
				  circular: true,
				  easing:'easeOutQuart',
				  visible: 4,
				  start: 0,
				  scroll: 1
			 });
		});
	</script>    
	<style>
.navbar-fixed-top.navbar-shrink {
    padding: 10px 0;
  }
  .navbar-fixed-top.navbar-shrink .navbar-brand {
    font-size: 1.5em;
  }
  .fa-fw {
    width: 1.28571429em;
    text-align: center;
    margin-top: 13px;
}
.jCarouselLite {
    visibility: visible;
    overflow: hidden;
    position: relative;
    z-index: 2;
    left: 0px;
    width: 764px;
}
nav.navbar.navbar-default.navbar-fixed-top{
	padding-bottom: 30px;	
}
</style>
<section id="page3">
	<!--==============================header=================================-->
   <br /><br /><br />    
<!-- content -->
    <section id="content">
        <div class="bg-top">
        	<div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="gallery p3">
                            	<div class="wrapper indent-bot">
                                    <div id="gallery" class="content">
                                       <div class="wrapper">
                                           <div class="slideshow-container">
                                                <div id="slideshow" class="slideshow"></div>
                                            </div>
                                        </div>
                                    </div>
                                   <div id="thumbs" class="navigation">
                                        <ul class="thumbs noscript">
                                            <li>
                                                <a class="thumb" href="/resources/community/images/main.png" title=""> <img src="/resources/community/images/smain.png" alt="" /><span></span> </a>
                                            </li> 
                                            <li>
                                                <a class="thumb" href="/resources/community/images/admin.png" title=""> <img src="/resources/community/images/sadmin.png" alt="" /> <span></span></a>
                                            </li> 
                                            <li>
                                                <a class="thumb" href="/resources/community/images/myPage1.png" title=""> <img src="/resources/community/images/smallMyPage.png" alt="" /> <span></span></a>
                                            </li> 
                                            <li>
                                                <a class="thumb" href="/resources/community/images/myPage2.png" title=""> <img src="/resources/community/images/smallMyPage2.png" alt="" /> <span></span></a>
                                            </li> 
                                            <li>
                                                <a class="thumb" href="/resources/community/images/market.png" title=""> <img src="/resources/community/images/smarket.png" alt="" /> <span></span></a>
                                            </li> 
                                            <li>
                                                <a class="thumb" href="/resources/community/images/board.png" title=""> <img src="/resources/community/images/sboard.png" alt="" /> <span></span></a>
                                            </li>           
                                        </ul>
                                    </div>
                                </div>
                                <div class="inner-2">
                                    <div class="wrapper">
                                        <span class="title t2 img-indent3">CSM</span>
                                        <div class="extra-wrap indent-top2">
                                        	<span style="font-size: 2em;">프로그래머와 디자이너를 매칭시켜주는 사이트 입니다.</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>	
        </div>

    </section>
    
	
    <script type="text/javascript">
			$(window).load(function() {
			// We only want these styles applied when javascript is enabled
			$('div.navigation').css({'width' : '320px', 'float' : 'right'});
			$('div.content').css('display', 'block');
	
			// Initially set opacity on thumbs and add
			// additional styling for hover effect on thumbs
			var onMouseOutOpacity = 0.5;
			$('#thumbs ul.thumbs li span').opacityrollover({
				mouseOutOpacity:   onMouseOutOpacity,
				mouseOverOpacity:  0.0,
				fadeSpeed:         'fast',
				exemptionSelector: '.selected'
			});
			
			// Initialize Advanced Galleriffic Gallery
			var gallery = $('#thumbs').galleriffic({
				delay:                     7000,
				numThumbs:                 12,
				preloadAhead:              6,
				enableTopPager:            false,
				enableBottomPager:         false,
				imageContainerSel:         '#slideshow',
				controlsContainerSel:      '',
				captionContainerSel:       '',
				loadingContainerSel:       '',
				renderSSControls:          true,
				renderNavControls:         true,
				playLinkText:              'Play Slideshow',
				pauseLinkText:             'Pause Slideshow',
				prevLinkText:              'Prev',
				nextLinkText:              'Next',
				nextPageLinkText:          'Next',
				prevPageLinkText:          'Prev',
				enableHistory:             true,
				autoStart:                 7000,
				syncTransitions:           true,
				defaultTransitionDuration: 900,
				onSlideChange:             function(prevIndex, nextIndex) {
					// 'this' refers to the gallery, which is an extension of $('#thumbs')
					this.find('ul.thumbs li span')
						.css({opacity:0.5})
				},
				onPageTransitionOut:       function(callback) {
					this.find('ul.thumbs li span').css({display:'block'});
				},
				onPageTransitionIn:        function() {
					this.find('ul.thumbs li span').css({display:'none'});
				}
			});
		});
	</script>
</section>
<%@include file="/resources/include/footer.jsp"%>

