<?php
/*
	Файл получает ID категории,	
	ответ в json список людей в данной категории
	и максимальное кол-во людей в данной категории.
	
	Дополнительной опцией файл получает нужную страницу людей
	и нужное кол-во людей на странице.

*/

	error_reporting(0);

	$catId = $_POST['catID']; // ID категории
	$catPage = $_POST['catPage']; // Нужная страница
	$catMaxPosts = $_POST['maxPagePosts']; // Максимальное кол-во людей на странице


//---Данный кусок кода нужен для разного кол-ва людей в разных категориях
	switch($catId){
		case 1: $catLen = 5; break;
		case 2: $catLen = 3; break;
		case 3: $catLen = 9; break;
		case 4: $catLen = 24; break;
		case 5: $catLen = 32; break;
		case 6: $catLen = 15; break;
		case 7: $catLen = 0; break;
		case 8: $catLen = 1; break;
		case 9: $catLen = 10; break;
		case 10: $catLen = 11; break;
		case 11: $catLen = 0; break;
		case 12: $catLen = 0; break;
		case 13: $catLen = 0; break;
		case 14: $catLen = 0; break;
		case 15: $catLen = 0; break;
		case 16: $catLen = 0; break;
		case 17: $catLen = 0; break;
		case 18: $catLen = 0; break;
		case 19: $catLen = 0; break;
		case 20: $catLen = 0; break;
		case 0: $catLen = 110; break; // Общее кол-во постов (Все отрасли)
		default: $catLen = 0; break;
	};

	if( $catLen <= (int)$catMaxPosts ){

		$needCatLen = $catLen; 

	} else {

		if( $catPage == 1 ){
			$needCatLen = (int)$catMaxPosts;
		} else {

			for( $p = 0; $p < $catPage; $p++ ){
				$needCatLen = $catLen - (int)$catMaxPosts;
				if( $needCatLen < (int)$catMaxPosts ) break;
			}

			if( $needCatLen >= (int)$catMaxPosts ) $needCatLen = (int)$catMaxPosts;

		}

		

	}
	

//---

	$stories = array();

	for( $cat = 0; $cat < $needCatLen; $cat++ ){

		$id = rand(1,50);

		$autor_post = array();
		$autor_questions = array();

		for( $p = $id*2; $p > 0; $p-- ){
			$autor_post[] = rand(1,99);
			$autor_answers[] = rand(1,99);
		}

		// Нужно для случайного генерирования даты
		$randDate = array(
			'day' => rand(1,25),
			'month' => rand(1,12)
		); 

		$autor[] = 	array(
			'id' => $id,
			'name' => 'Автор #'.$id, 
			'email' => 'vasa@test.ru', 
			'avatarImg' => '/img/noAvatar.jpg',
			'shortBio' => 'Краткое био #'.$id,
			'profession' => 'Профессия #'.$id,
			'dreamProfession' => 'Профессия мечта #'.$id, 
			'self_link' => 'user_link #'.$id,
			'posts' => $autor_post, // Список id постов пользователя
			'answers' => $autor_answers, // Список id вопросов
			'last_publish_date' => $randDate['day'].'/'.$randDate['month'].'/2013', //дата последнео опубликованого поста
			'delights_prof' => 'Профессия которая восхищает #'.$id
		);

	};



	echo json_encode(array(
		'peoples' => $autor,
		'peoplesCount' => $catLen
	));


?>