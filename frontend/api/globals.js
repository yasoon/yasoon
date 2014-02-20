Date.prototype.daysInMonth = function(month) {
    return 32 - new Date(this.getFullYear(), month-1, 32).getDate();
};

Date.prototype.getShortDayName = function(day){

	switch(day){
		case 1: return 'Пон'; break;
		case 2: return 'Вто'; break;
		case 3: return 'Сре'; break;
		case 4: return 'Чет'; break;
		case 5: return 'Пят'; break;
		case 6: return 'Суб'; break;
		case 7: return 'Вос'; break;
		default: return false; break;
	}
}

Date.prototype.getLongDayName = function(day){

	switch(day){
		case 1: return 'Понидельник'; break;
		case 2: return 'Вторник'; break;
		case 3: return 'Среда'; break;
		case 4: return 'Четверг'; break;
		case 5: return 'Пятница'; break;
		case 6: return 'Суббота'; break;
		case 7: return 'Воскресение'; break;
		default: return false; break;
	}
}

Date.prototype.getMonthName = function(month,needShort){

	var needName = false;

	switch(month){
		case 1: needShort ? needName = 'янв.' : needName = 'Январь'; break;
		case 2: needShort ? needName = 'фев.' : needName = 'Февраль'; break;
		case 3: needShort ? needName = 'мар.' : needName = 'Март'; break;
		case 4: needShort ? needName = 'апр.' : needName = 'Апрель'; break;
		case 5: needShort ? needName = 'мая' : needName = 'Май'; break;
		case 6: needShort ? needName = 'июн.' : needName = 'Июнь'; break;
		case 7: needShort ? needName = 'июл.' : needName = 'Июль'; break;
		case 8: needShort ? needName = 'авг.' : needName = 'Август'; break;
		case 9: needShort ? needName = 'сен.' : needName = 'Сентябрь'; break;
		case 10: needShort ? needName = 'окт.' : needName = 'Октябрь'; break;
		case 11: needShort ? needName = 'ноя.' : needName = 'Ноябрь'; break;
		case 12: needShort ? needName = 'дек.' : needName = 'Декабрь'; break;
		default: return false; break;
	}

	return needName;

}

window.showPreloader = function(){
	$('.popup').addClass('open_popup');
	$('.popup .preloader_box').addClass('open');
}

window.hidePreloader = function(){
	$('.popup').removeClass('open_popup');
	$('.popup .preloader_box').removeClass('open');
}

