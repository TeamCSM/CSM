jQuery(function($){
	// Position Y
	(function() {
		var $pluginID = $('#cameron_plugin');
		if($pluginID.length != 0) {
			pluginY = ($(window).height() / 5);
			$pluginID.css({'top' : pluginY});
		}
	})();

	// Language Select
	(function() {
		var $lang = $('#cameron-lang');
		var $langToggle = $lang.find('.langToggle');
		var $langSelect = $lang.find('.selectLang');
		$langToggle.on('click',function(){
			$langSelect.slideToggle(50);
			return false;
		});
		$langSelect.on('mouseleave',function(){
			$langSelect.hide(50);
		});
	})();
});