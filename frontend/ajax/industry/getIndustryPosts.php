<?php
/*
	Файл получает ID категории,	
	ответ в json список постов в данной категории
	список постов должен возвращаться сразу отсортирован по двум критериям: по дате(dateSort) и по рейтингу(rateSort).
	И максимальное кол-во потсов в данной категории.
	
	Дополнительной опцией файл получает нужную страницу постов
	и нужное кол-во постов на странице.

*/

	error_reporting(0);

	$catId = $_POST['catID']; // ID категории
	$catPage = $_POST['catPage']; // Нужная страница
	$catMaxPosts = $_POST['maxPagePosts']; // Максимальное кол-во постов на странице


//---Данный кусок кода нужен для разного кол-ва постов в разных категориях
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

		$id = rand(1,500);

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
			'tags' => array($catId), // ID отрослей к которым относится данный пост
			'title' => 'История #'.$id, // Заголовок поста
			'description' => 'Краткое описание истории #'.$id, // Краткое описание поста
			'text' => 'Текст истории #'.$id, // Текст поста
			'publishDate' => $randDate['day'].'/'.$randDate['month'].'/2013', // Время опубликования поста
			'post_likes' => $id*3, // Сколько у поста лайков,
			'mktime' => mktime(0,0,0,$randDate['month'],$randDate['day'],'2013')
		);

		$loop = $cat;

	};

	function date_to_timestamp($d){
		$arr=explode("-",$d);
		return mktime(0,0,0,$arr[0],$arr[1],$arr[2]);
	}

	$posts = $stories;

	uasort($stories, create_function('$a, $b', 'return ($b[\'post_likes\'] - $a[\'post_likes\']);'));

	$rateSortPosts = array();
	foreach ($stories as $story) { $rateSortPosts[] = $story; }

	uasort($stories, create_function('$a, $b', 'return ($b[\'mktime\'] - $a[\'mktime\']);'));

	//uasort($stories, create_function('$a, $b', '$aval = strtotime($a[\'mktime\']); $bval = strtotime($b[\'mktime\']); if ($aval == $bval) return 0; return $bval < $aval ? -1 : 1; );'));

	$dateSortPosts = array();
	foreach ($stories as $story) { $dateSortPosts[] = $story; }



	echo json_encode(array(
		'posts' => $posts,
		'dateSort' => $dateSortPosts,
		'rateSort' => $rateSortPosts,
		'postsCount' => $catLen
	));


?>