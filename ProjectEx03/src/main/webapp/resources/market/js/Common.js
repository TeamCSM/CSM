
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Common Javascript Area
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var jjjj_ie6 = navigator.appVersion.indexOf("MSIE 6.0") > -1; //ie6 2012-05-14 추가 

// ie6 png24 
function setPng24(obj) {
	obj.width = obj.height = 1;
	obj.className = obj.className.replace(/\bpng24\b/i, '');
	obj.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader(src="' + obj.src + '",sizingMethod="image");';
	obj.src = ImageUrl("images/lotte/blank.gif");
	return '';
}

//레이어 오버시 layer
function overLayer(self, idLayer) {
	var $self = $(self),
		evType = 'inline',
		idLayer = idLayer;

	if (!(idLayer.split("#")[1])) {
		idLayer = '#' + idLayer;
	}
	var $shopDiv = $(idLayer);

	$shopDiv.css('display', evType);
	$self.addClass('on');
	$self.bind('mouseout', function () {
		$shopDiv.hide();
		$self.removeClass('on');
	});
	$shopDiv
		.bind('mouseover', function () {
			$shopDiv.css('display', evType);
			$self.addClass('on');
		})
		.bind('mouseout', function () {
			$shopDiv.hide();
			$self.removeClass('on');
		});
}
//layer
function openLay(id) {
	var layer = document.getElementById(id);
	layer.style.display = 'block';
}
function closeLay(id) {
	var layer = document.getElementById(id);
	layer.style.display = 'none';
}

// 전체 카테고리 보기 
function openCate(self, cateDiv) {
	var $self = $(self),
		$cateLayer = $(document).find(cateDiv);

	if ($cateLayer.css('display') == 'none') {
		$self.addClass('selected');
		$cateLayer.slideDown('500', function () {
			$cateLayer.css('overflow', 'visible');
		});
	} else {
		$self.removeClass('selected');
		$cateLayer.slideUp('500');
	}
}
/*
function openCate(self, cateDiv) {
var $self = $(self),
$cateLayer = $(document).find(cateDiv);

if($cateLayer.css('display') == 'none') {
$self.addClass('selected');
$cateLayer.css('display','block');
} else {
$self.removeClass('selected');
$cateLayer.css('display','none');
}
}*/

//quick 레이어
function overQu(self) {
	var $self = $(self),
		evType = 'block',
		addClass = 'on',
		$shopDiv = $self.next();

	if ($shopDiv.attr('class') == 'overlyr') {
		$shopDiv.css('display', evType);
		$self.bind('mouseout', function () {
			$shopDiv.hide();
		});
		$shopDiv
			.bind('mouseover', function () {
				$shopDiv.css('display', evType);
				$self.addClass(addClass);
			})
			.bind('mouseout', function () {
				$shopDiv.hide();
				$self.removeClass(addClass);
			});
	}
}

