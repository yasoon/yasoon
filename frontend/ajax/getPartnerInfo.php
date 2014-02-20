<?php 

/*
	Данный файл дожен вернуть иформацию которая отбражаеться на главной странице в шапке
*/

	$partnerInfo = array(
		'partnerBgImg' => '/img/i6.jpg', // задний фон на главной
		'parnterText' => 'Sheremetiveo airoport work stories<br/> Only for today', // текст на главной 
		'parnterLink' => 'www.google.ru' // сылка насайт партнера
	);


	echo json_encode( $partnerInfo );


?>