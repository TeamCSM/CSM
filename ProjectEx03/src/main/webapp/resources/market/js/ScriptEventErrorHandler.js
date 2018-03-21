
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ScriptEventErrorHandler Javascript Area
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var onErrorInfoSended = false;

/*
$(document).ajaxError(function (event, request, settings, exception) {
	try {
		var domain = url.substring(url.indexOf('//')+2, url.indexOf('/', url.indexOf('//')+2)) ;
		var param = [{ name: 'Url', value: document.location.href },
			{ name: 'Path', value: url + ' line : ' + line },
			{ name: 'EventType', value: '' },
			{ name: 'EventInfo', value: "[" + domain + "] " + msg + " line :" + line },
			{ name: 'Domain', value: domain }
		];

		$.ajax({
			type: "POST",
			cache: false,
			url: MyGUrl("Ajax/AjaxScriptErrorHandler"),
			data: param,
			success: function(result){
				//alert("Report sent about the javascript error");
			}
		})
	} catch (e) {}
});
*/

(function ($) {
	$.fn.jsErrorHandler = function () {
		
		window.onerror = function (msg, url, line) {
			try{
				if (!onErrorInfoSended)
				{
					var domain = url.substring(url.indexOf('//')+2, url.indexOf('/', url.indexOf('//')+2)) ;
					var param = [{ name: 'Url', value: document.location.href },
						{ name: 'Path', value: url + ' line : ' + line },
						{ name: 'EventType', value: '' },
						{ name: 'EventInfo', value: "[" + domain + "] " + msg + " line :" + line },
						{ name: 'Domain', value: domain }
					];

					$.ajax({
						type: "POST",
						cache: false,
						url: ("/AjaxCommon/AjaxScriptErrorHandler"),
						data: param,
						success: function(result){
							//alert("Report sent about the javascript error");
							onErrorInfoSended = true;
						}
					})
				}
			} catch(e) {}

			return true;
		}
	};
})(jQuery);