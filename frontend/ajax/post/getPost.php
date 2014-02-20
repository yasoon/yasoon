<?php

/* 
	Данный файл должен вернуть всю информацию о посте.
	Есть 3 типа запроса к этому файлу:
		1. Запрос на историю дня ( которая на главной ) - $_POST['postType'] = dayStory
		2. Запрос на список лучших историй - $_POST['postType'] = bestStories ( максимум 5 )
		3. Запрос на отделюную историю по id ( их может быть несколько в запросе ) $_POST['postType'] = needPost

		Формат даты опубликования год/месяц/день
*/

	$postType = $_POST['postType'];


	if( $postType == 'dayStory' ){
		$stories = array(
			'id' => 1, // ID поста
			'autorId' => 1, // ID автора поста
			'tags' => array(2,5), // ID отрослей к которым относится данный пост
			'title' => 'История дня', // Заголовок поста
			'description' => 'Краткое описание лучшей истории', // Краткое описание поста
			'text' => 'Текст истории', // Текст поста
			'publishDate' => '5/12/2013', // Время опубликования поста
			'post_likes' => 5, // Сколько у поста лайков
			'question' => array(3, 5, 2) // Спичок ID вопросо посту ( ID ругих постов )
		);
	}

	if( $postType == 'bestStories' ){

		$stories = array(
			array(
				'id' => 2, // ID поста
				'autorId' => 2, // ID автора поста
				'autorName' => 'Петя Ористархович',
				'tags' => array(1,3), // ID отрослей к которым относится данный пост
				'title' => 'Лучшая история 1', // Заголовок поста
				'description' => 'Краткое описание лучшей истории 1' // Краткое описание поста
			),

			array(
				'id' => 3, // ID поста
				'autorId' => 3, // ID автора поста
				'autorName' => 'Энокентий Крапинович',
				'tags' => array(2), // ID отрослей к которым относится данный пост
				'title' => 'Лучшая история 2', // Заголовок поста
				'description' => 'Краткое описание лучшей истории 2' // Краткое описание поста
			),

			array(
				'id' => 4, // ID поста
				'autorId' => 1, // ID автора поста
				'autorName' => 'Вася Пупкин',
				'tags' => array(8), // ID отрослей к которым относится данный пост
				'title' => 'Лучшая история 3', // Заголовок поста
				'description' => 'Краткое описание лучшей истории 3' // Краткое описание поста
			),

			array(
				'id' => 5, // ID поста
				'autorId' => 2, // ID автора поста
				'autorName' => 'Петя Ористархович',
				'tags' => array(5,4), // ID отрослей к которым относится данный пост
				'title' => 'Лучшая история 4', // Заголовок поста
				'description' => 'Краткое описание лучшей истории 4' // Краткое описание поста
			)


		);

	}

	if( $postType == 'needPost' ){

		$postId = $_POST['postId'];

		if( is_array( $postId ) ){
			$stories = array();

			foreach ($postId as $id) {

				// Нужно для случайного генерирования даты
				$randDate = array(
					'day' => rand(1,25),
					'month' => rand(1,12)
				); 

				// Нужно для случайной генирации автора
				$randAutor = rand(1,3);

				$stories[] = array(
					'id' => $id, // id поста
					'autorId' => $randAutor, // ID автора поста
					'autorName' => 'Петя Пупкин',
					'tags' => array(1), // ID отрослей к которым относится данный пост
					'title' => 'История #'.$id, // Заголовок поста
					'description' => 'Краткое описание истории #'.$id, // Краткое описание поста
					'text' => 'Текст истории #'.$id, // Текст поста
					'publishDate' => $randDate['day'].'/'.$randDate['month'].'/2013', // Время опубликования поста
					'post_likes' => $id*4 // Сколько у поста лайков
				);
			};

			/*$rateSortPosts = usort($stories, function($a, $b){
			    return ($a['post_likes'] - $b['post_likes']);
			});*/

		} else {

			if( !empty( $postId ) ){ 

				$stories = array(
					'id' => $postId,
					'autorId' => 3, // ID автора поста
					'autorName' => 'Петя Пупкин',				
					'tags' => array(3), // ID отрослей к которым относится данный пост
					'title' => 'История #'.$postId, // Заголовок поста
					'description' => 'Краткое описание истории #'.$postId, // Краткое описание поста
					'text' => 'Текст истории #'.$postId, // Текст поста
					'publishDate' => '5/11/2013', // Время опубликования поста
					'post_likes' => 1 // Сколько у поста лайков
				);

			} else {
				echo json_encode( array( 'story' => false ) ); die;
			}

		}



	}

	echo json_encode($stories);


?>