<?php

$questionsIds = $_POST['question_id'];

	foreach ($questionsIds as $id) {

		// Нужно для случайного генерирования даты
		$randDate = array(
			'day' => rand(1,25),
			'month' => rand(1,12)
		); 

		// Нужно для случайной генирации автора
		$randAutor = rand(30,31);

		// Нужно для случайной генирации есть ли ответ на вопрос
		$randAnswer = rand(0,1);
		$randAnswer = $randAnswer == 0 ? false : true;

		$questions[] = array(
			'id' => $id, // id поста
			'autorId' => $randAutor, // ID автора которому был задан вопрос
			'ask_autorId' => $randAutor, // ID пользователя который спросил вопрос
			'ask_autorName' => 'Чудо Степан', // Имя автора который спросил вопрос
			'ask_autorProf' => 'моряк', // Профессия автора который спросил вопрос
			'questionText' => 'Текст вопроса #'.$id, // Текст вопрос
			'questionAnswerText' => 'Ответ на вопрос #'.$id, // Текс ответа на вопрос
			'hasAnswer' => $randAnswer, // на этот вопрос есть ответ ? //true, false
			'publishDate' => $randDate['day'].'/'.$randDate['month'].'/2013', // Время когда был задан вопрос
		);
	}


echo json_encode($questions);




?>