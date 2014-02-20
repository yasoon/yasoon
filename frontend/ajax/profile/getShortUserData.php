<?php

/*
	Этому файлу будет идти запрос на получение краткой информации
	о тепершнем залогиненом пользователе,
	если пользователь не залогинен то возвращает false.
*/	

	//if( isset($_SESSION['user_login_id']) ){

		$userData = array(
			'id' => '31',
			'name' => 'Vasa',
			'email' => 'EMAIL@test.ru',
			'avatarImg' => '/img/noAvatar.jpg',
			'shortBio' => 'Краткое био',
			'profession' => 'Программист',
			'self_link' => 'user_link',
			'delights_prof' => 'Хакер',
			'last_publish_date' => '2013/11/8', //дата последнео опубликованого поста
			'dreamProfession' => 'Шахтер'
		);

		echo json_encode( array( 'userData' => $userData ) );

	//} else {

	//	echo json_encode(array( 'userData' => false ));

	//}


?>