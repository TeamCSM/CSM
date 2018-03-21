/*
* Fix sidebar at some point and remove
* fixed position at content bottom
*/
$(window).scroll(function () {
	var headerHeight = $('.site-header').innerHeight();
	var contentHeight = $('.site-main').innerHeight();
	var sidebarHeight = $('.side-navigation').height();
  var sidebarBottomPos = contentHeight - sidebarHeight; 
  var trigger = $(window).scrollTop() - headerHeight;

      	if ($(window).scrollTop() >= headerHeight) {
          	$('.side-navigation').addClass('fixed');
      	} else {
          	$('.side-navigation').removeClass('fixed');
      	}

      	if (trigger >= sidebarBottomPos) {
          	$('.side-navigation').addClass('bottom');
      	} else {
          	$('.side-navigation').removeClass('bottom');
      	}
});
$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});