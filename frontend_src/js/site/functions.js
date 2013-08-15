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


    var _w = document.getElementById('page-layout'), _m = document.getElementById('main-layout'), jw = $('#page-layout'), jm = $('#main-layout'), n = $('.navigate');

    function getOffsetSum(elem) {
        var top=0, left=0

        while(elem) {
            top = top + parseInt(elem.offsetTop)
            left = left + parseInt(elem.offsetLeft)
            elem = elem.offsetParent
        }

        return {top: top, left: left}
    }

//    $(window).scroll(function () {
//        x = $(this).width(), st = false;
//        if(jm.length){
//            var jTop = getOffsetSum(_m);
//        } else if(jw.length){
//            var jTop = getOffsetSum(_w);
//        } if (n.length){
//            st = true;
//        }
//
//
//        var posY = jTop.top;
//
//        if ($(this).scrollTop() > posY && (navigator.userAgent.indexOf('iPhone') == -1 && navigator.userAgent.indexOf('Blackberry') == -1 && navigator.userAgent.indexOf('Android') == -1) ) {
//            if(st == true){
//                $('.left-side,.postinfo').addClass("fixed st");
//            } else {
//                $('.left-side,.postinfo').addClass("fixed");
//            }
//        } else {
//            if(st == true){
//                $('.left-side,.postinfo').removeClass("fixed st");
//            } else {
//                $('.left-side,.postinfo').removeClass("fixed");
//            }
//        }
//
//        if ($(this).scrollTop() > posY && st == true && (navigator.userAgent.indexOf('iPhone') == -1 && navigator.userAgent.indexOf('Blackberry') == -1 && navigator.userAgent.indexOf('Android') == -1) ) {
//            $('.navigate').addClass("fixed");
//        } else {
//            $('.navigate').removeClass("fixed");
//        }
//    });
})