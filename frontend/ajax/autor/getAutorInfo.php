<?php

/*
	Этот файл отвечает за запорос данных о пользователе
	В запросе приходит только id пользователя или массив с id пользователей	
*/


$autor_id = $_POST['autor_id']; // ID нужного пользователя или массив айдишников

	if( is_array($autor_id) ){
		$autor = array();

		foreach ($autor_id as $id) {

			$autor_post = array();
			$autor_questions = array();

			for( $p = $id; $p > 0; $p-- ){
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
				'posts' => $autor_post, // Список id постов пользователя отсортированых по дате
				'answers' => $autor_answers, // Список id вопросов отсортированых по дате
				'last_publish_date' => $randDate['day'].'/'.$randDate['month'].'/2013', //дата последнео опубликованого поста
				'delights_prof' => 'Профессия которая восхищает #'.$id
			);

		}

	} else {

		$autor_post = array();
		$autor_questions = array();

		for( $p = $autor_id; $p > 0; $p-- ){
			$autor_post[] = rand(1,99);
			$autor_answers[] = rand(1,99);
		}

		// Нужно для случайного генерирования даты
		$randDate = array(
			'day' => rand(1,25),
			'month' => rand(1,12)
		); 

		$autor = array(
			'id' => $autor_id,
			'name' => 'Автор #'.$autor_id, 
			'email' => 'vasa@test.ru', 
			'avatarImg' => '/img/noAvatar.jpg',
			'shortBio' => 'Краткое био #'.$autor_id,
			'profession' => 'Профессия #'.$autor_id,
			'dreamProfession' => 'Профессия мечта #'.$autor_id, 
			'self_link' => 'user_link #'.$autor_id,
			'posts' => $autor_post, // Список id постов пользователя отсортированых по дате
			'answers' => $autor_answers, // Список id вопросов отсортированых по дате
			'last_publish_date' => $randDate['day'].'/'.$randDate['month'].'/2013', //дата последнео опубликованого поста
			'delights_prof' => 'Профессия которая восхищает #'.$autor_id
		);


	}

	echo json_encode($autor);


?>