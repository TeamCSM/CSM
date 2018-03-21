/*! CAMERON Stage v1.0.6 | Copyright 2015 CAMERON, Co. */
jQuery(function($){
	$(function() {
		// Jump to Content
		$('#skip').on('click', function() {
			var $idf = $("#"+$(this).attr("href").split("#")[1]);
			$idf.attr("tabindex", -1).focus();
		});
	});

	$(function(){
		var $Lighting = $('#lighting'),
			$LNav = $("#lighting-nav"),
			$Lighting2 = $('#lighting2'),
			$LButton = $('#lighting-m');
	
		heightResize();

		// Lighting Height Resize
		function heightResize(){
			var WinHeight = $(window).height(),
				TopHeight = $("#lighting-top").height(),
				LNavHeight = WinHeight - TopHeight;
			$LNav.height(LNavHeight);
		}
	
		// Navigation Reset
		function reset(){
			$LNav.find('.nav1st-li').removeAttr('style').removeClass("active");
		}
		
		function NavActive($tit) {
			var $ActList = $tit.parent("li");
			$ActList.addClass("active");
			var Nav1Count = $nav1i,
				NavHeight = $LNav.height(),
				TotalHeight = (NavHeight - 205) / Nav1Count,
				$Nav1List = $LNav.find('.nav1st-li');
			$Nav1List.css('height', TotalHeight);
		}

		if($nav_event=='mouseover') {
			$LNav.find(".tit").on('mouseover focusin',function(e){
				e.preventDefault();
				reset();
				var $tit = $(this);
				NavActive($tit);
			});
		} else {
			$LNav.find(".tit").on('click',function(e){
				e.preventDefault();
				reset();
				var $tit = $(this);
				NavActive($tit);
			});
		};

		$LNav.on('mouseleave',function(){
			reset();
		});
		
		// Lighting Open
		function LOpen(){
			var LWidth = $Lighting.width(),
				L2Width = $Lighting2.width(),
				LAllWidth = LWidth + L2Width;
			$Lighting.stop(true).animate({marginRight : 0},200,"easeInExpo", function(){
				if($Lighting2.size() == 1) {
					$Lighting2.animate({marginRight : LWidth + 'px'},300,"easeOutExpo");
					$LButton.animate({marginRight : LAllWidth - 20 + 'px'},300,"easeOutExpo");
				} else {
					$LButton.animate({marginRight : LAllWidth - 20 + 'px'},50,"easeOutExpo");
				}
			});
		}

		// Lighting Close
		function LClose(){
			reset();
			$LButton.stop(true).removeAttr('style');
			$Lighting2.stop(true).removeAttr('style');
			$Lighting.stop(true).removeAttr('style');
		}

		// Lighting Button
		var TouchMe=1;
		$LButton.on('click',function(e){
			e.preventDefault();
			if(TouchMe){
				TouchMe=0;
				LOpen();
			}else {
				TouchMe=1;
				LClose();
			}
		});

		// Lighting Swipe
		$Lighting.on('swipeleft',function() {
			TouchMe=0;
			LOpen();
		}).on('swiperight',function() {
			TouchMe=1;
			LClose();
		}).on('swipeup swipedown',function(e) {
			e.preventDefault();
		});

		// Content Swipe
		if($('#stage-visual').length) {
			var $Cont = $(this);
			$Cont.on('swipeleft',function() {
				TouchMe=0;
				LOpen();
			}).on('swiperight',function() {
				TouchMe=1;
				LClose();
			});
		}
		
		// Window Resize
		$(window).on('resize',function(){
			TouchMe=1;
			LClose();
			heightResize();
		});
	});

	// Scroll Top
	$(function() {
		var $sTop = $('#sTop');
		$sTop.on('click', function(e){
			e.preventDefault();
			$('html, body').stop(true).animate({scrollTop:0},800,'swing');
		});

		$(window).on('scroll',function() {
			var position = $(window).scrollTop();
			if(position > 200) {
				$sTop.show();
			} else {
				$sTop.hide();
			}
		});
	});
});