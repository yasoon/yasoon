define ->
  'use strict'

  (match) ->
    match '', 'index#indexAction'
    match 'author/:id/posts', 'author#postsAction'
    match 'author/:id/questions', 'author#questionsAction'
    match 'posts/new', 'author#newPostAction'
    match 'posts/new_interview', 'author#newPostInterviewAction'
    match 'post/:id', 'post#postAction'

    match 'admin/blank', 'admin#blankAction'
