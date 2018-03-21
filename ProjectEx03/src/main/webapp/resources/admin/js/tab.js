/*$(function(){

	 $("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide();

	 $("ul.tab li a").click(function(){

	    $("ul.tab li a").removeClass("selected"); 

	    $(this).addClass("selected"); $("ul.panel li").slideUp("fast"); 

	    $($(this).attr("href")).slideDown("fast"); return false; }); 

	 });
 */

$(document).ready(function() {
	// 탭(ul) onoff
	$('.jq_tabonoff>.jq_cont').children().css('display', 'none');
	$('.jq_tabonoff>.jq_cont div:first-child').css('display', 'block');
	$('.jq_tabonoff>.jq_tab li:first-child').addClass('on');
	$('.jq_tabonoff').delegate('.jq_tab>li', 'click', function() {
		var index = $(this).parent().children().index(this);
		$(this).siblings().removeClass();
		$(this).addClass('on');
		$(this).parent().next('.jq_cont').children().hide().eq(index).show();
	});
});
