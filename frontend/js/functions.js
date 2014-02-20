$.fn.onAvailable = function(fn){
    var sel = this.selector;
    var timer;
    var self = this;
    if (this.length > 0) {
        fn.call(this);   
    }
    else {
        timer = setInterval(function(){
            if ($(sel).length > 0) {
                fn.call($(sel));
                clearInterval(timer);  
            }
        },50);  
    }
};

Date.prototype.getMonthName = function() {
	var month = ['Января','Февраля','Марта','Апреля','Мая','Июня',
	'Июля','Августа','Сентября','Октября','Ноября','Декабря'];
	return month[this.getMonth()];
}

String.prototype.validateEmail = function(){
	return 	/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,6})+$/.test(this);
}


jQuery.fn.multiselect = function() {

    $(this).each(function() {

    	var checkCount = 0;
        var checkboxes = $(this).find("[type='checkbox']");
        $(this).wrap('<div class="selectBox"></div>');
        $selectTitle = $('<p class="selectTile" data-field="select">Выберите нужные отрасли</p>');
        $(this).before($selectTitle);
        $(this).hide();

        $selectTitle.on('click',function(){ $(this).next().slideToggle(200); });

        checkboxes.each(function() {
            var checkbox = $(this);
            // Highlight pre-selected checkboxes
            if (checkbox.attr("checked")){
                checkbox.parent().addClass("multiselect-on");
                checkCount++;
            }
 
            // Highlight checkboxes that the user selects
            checkbox.click(function() {
                if (checkbox.attr("checked")){
                    
                    if( checkCount < 3 ){
                    	checkbox.parent().addClass("multiselect-on");
                    	checkCount++;
                    	return;
                    }
                    checkbox.removeAttr('checked');
                   
                } else {
                    checkbox.parent().removeClass("multiselect-on");
                    checkCount--;          
                }
            });
        });

    });

};



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
		
});

function getOffsetSum(elem) {
  var top=0, left=0

  while(elem) {
    top = top + parseInt(elem.offsetTop)
    left = left + parseInt(elem.offsetLeft)
    elem = elem.offsetParent        
  }
   
  return {top: top, left: left}
}

window.updateScrolling = function(){
	var _w = document.getElementById('page-layout'), _m = document.getElementById('main-layout'), jw = $('#page-layout'), jm = $('#main-layout'), n = $('.navigate');
		
	$(window).unbind('scroll').scroll(function () {
		x = $(this).width(), st = false;
		if(jm.length){
			var jTop = getOffsetSum(_m);
		} else if(jw.length){
			var jTop = getOffsetSum(_w);
		} if (n.length){
			st = true;
		}
		
		
			var posY = jTop.top;
			
			if ($(this).scrollTop() > posY && (navigator.userAgent.indexOf('iPhone') == -1 && navigator.userAgent.indexOf('Blackberry') == -1 && navigator.userAgent.indexOf('Android') == -1) ) {
				if(st == true){
					$('.left-side,.postinfo').addClass("fixed st");
				} else {
					$('.left-side,.postinfo').addClass("fixed");
				}
			} else {
				if(st == true){
					$('.left-side,.postinfo').removeClass("fixed st");
				} else {
					$('.left-side,.postinfo').removeClass("fixed");
				}
			}
			
			if ($(this).scrollTop() > posY && st == true && (navigator.userAgent.indexOf('iPhone') == -1 && navigator.userAgent.indexOf('Blackberry') == -1 && navigator.userAgent.indexOf('Android') == -1) ) {
				$('.navigate').addClass("fixed");
			} else {
				$('.navigate').removeClass("fixed");
			}
	});
}
