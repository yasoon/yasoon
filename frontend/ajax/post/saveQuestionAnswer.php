<?php
/* 
	Данный файл должен сохранять ответ пользователя на вопрос, или удалить вопрос.
	Все данные вопроса приходя в $questionData = json_decode(file_get_contents('php://input')); Используется метод PUT, DELETE
	Файл дожен вернуть json 
	{error: false, errorText: ''} - Если ответ успешно сохранен
	{error: true, errorText: 'Текст ошибки'} - Если произошла ошибка

*/

	$questionData = json_decode(file_get_contents('php://input'),true);

	$returnArr = array('error' => false, 'errorText' => '');

/*
	Если в запросе приходит type = delete - нужно удалить вопрос
	в данном случае при успешном удалении,
	файл должен вернуть - {type: 'delete', id: id поста который удаляется} 
*/

	if( isset( $questionData['type'] ) ){
		if( $questionData['type'] == 'delete' ){
			$deleteQuestionId = $questionData['id'];
			$returnArr = array('type' => 'delete', 'id' => $deleteQuestionId );
		}
	}





	echo json_encode($returnArr);

?>