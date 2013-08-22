$(function(){
	
	
	$('.open-area').bind('click', function(){
		var _th = $(this),
		item = _th.closest('.postinfo').find('.media-hidden')
		
		_th.toggleClass('up');
		
		if(_th.hasClass('up')){
			item.slideDown('fast');
		}else{
			item.slideUp('fast');
		}
	});
	
	
	var n = $('.postinfo,.left-side'), k = 0, kPage = $('#page-layout');
	
	
	
	
	function getOffsetSum(elem) {
	  var top=0, left=0
	
	  while(elem) {
	    top = top + parseInt(elem.offsetTop)
	    left = left + parseInt(elem.offsetLeft)
	    elem = elem.offsetParent        
	  }
	   
	  return {top: top, left: left}
	}

	
		$(window).scroll(function () {
			x = $(this).width();
			
			if (n.length){
				n.attr('id', 'nt');
				var stJ = document.getElementById('nt'), nTop = getOffsetSum(stJ);
			} if (kPage.length){
				var k = 57;
			}
			
				var posY = nTop.top;

				
				if ($(this).scrollTop() > posY - k && (navigator.userAgent.indexOf('iPhone') == -1 && navigator.userAgent.indexOf('Blackberry') == -1 && navigator.userAgent.indexOf('Android') == -1) ) {
					$('.left-side,.postinfo').addClass("fixed");
				} else {
					$('.left-side,.postinfo').removeClass("fixed");
				}
				
		});
		
})
