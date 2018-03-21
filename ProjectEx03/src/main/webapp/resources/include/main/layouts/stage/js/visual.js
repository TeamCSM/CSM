/*! CAMERON Visual v1.0.0 | Copyright 2014 CAMERON, Co. */
jQuery(function($){
	$(function(){
		if(vnum > 2) {
			$vc.css({ top : -$vc.height() });
			$vli.filter(':last-child').prependTo($vc);
			roll.click();
		}else if(vnum == 2) {
			$vc.css({ top : -$vc.height() });
			$vc.find('li.visual1').clone().appendTo($vc);
			$vc.find('li.visual2').clone().prependTo($vc);
			roll.click();
		}else {
			var $sbtn = $vid.find('.sbtn');
			$sbtn.css('display','none');
		}
		
		roll.open(1);

		if(vnum > 1) {
			$(window).on('resize',function(){
				var winH = $vc.height();
				$vc.stop(true, true).animate({ top : "-" + winH }, 500, "easeInExpo");
				roll.open(visualN);
			})
		}
	})

	var $vid = $('#stage-visual'),
		$vc = $vid.find('.visual'),
		$vli = $vc.find('li'),
		vnum = $vli.length,
		vnumc = vnum + 1,
		visualN = 1,
		bool = true,
		roll = {
			slide : function(dec, visual) {
				var winH = $vc.height();
				$vc.stop(true, true).animate({ top : dec + winH }, 500, "easeInExpo", function(){
					if(dec == "+=") {
						$vc.css({ 'top' : '-=' + winH }).find('li').filter(':last-child').prependTo($vc);
					}else {
						$vc.css({ 'top' : '+=' + winH }).find('li').filter(':first-child').appendTo($vc);
					}
					roll.open(visual);
				})
			},
			open : function(visual) {
				$vc.find('li').find('.vtit').removeAttr('style');
				var $vv = $vc.find('.visual' + visual);
				$vv.find('.vtit1').stop(true).delay(100).animate({ opacity : 1, filter : 'alpha(opacity=100)', top : "+=" + 50 }, 700, "easeOutQuart")
					.end().find('.vtit2').stop(true).delay(500).animate({ opacity : 1, filter : 'alpha(opacity=100)', top : "-=" + 50 }, 300, "easeOutQuart", bool=true);
			},
			close : function(visual){
				if (visual == vnumc) visual = 1;
				else if (visual == 0) visual = vnum;
				var $vv = $vc.find('.visual' + visual);
				$vv.find('.vtit1').stop(true).animate({ opacity : 0, filter : 'alpha(opacity=0)', top : "-=" + 50 }, 200)
					.end().find('.vtit2').stop(true).animate({ opacity : 0, filter : 'alpha(opacity=0)', top : "+=" + 50 }, 300);
			},
			click : function(){
				$vid.find('.sbtn a').on('click' ,function(event){
					event.preventDefault();
					if(bool == true) {
						bool = false;
						if($(this).hasClass('up')) {
							(visualN == 1) ? visualN = vnumc : "";
							--visualN;
							roll.slide("+=", visualN);
							roll.close(visualN + 1);
						}else {
							(visualN == vnum) ? visualN = 0 : "";
							++visualN;
							roll.slide("-=", visualN);
							roll.close(visualN - 1);
						}					
					}else {
						return false;
					}
				});
			}
		};

	$(function(){
		var $sWrap = $('#stage-visual'),
			$sBtn = $sWrap.find('.sbtn'),
			sNext = $sBtn.find('.down'),
			sPrev = $sBtn.find('.up');
	
		$sWrap.on('swipeup',function() {
			sNext.trigger('click');
		}).on('swipedown',function() {
			sPrev.trigger('click');
		}).on('mousewheel',function(e,delta) {
			if (delta > 0) sPrev.trigger('click');
			else if (delta < 0) sNext.trigger('click');
		});
	});
});