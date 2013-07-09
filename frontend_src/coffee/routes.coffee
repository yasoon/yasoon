define ->
  'use strict'

  (match) ->

    match 'author/:authorId/posts/:id', 'post#postAction'

    match 'author/:id/posts', 'author#postsAction'
    match 'author/:id/questions', 'author#questionsAction'


    match 'posts/new', 'author#newPostAction'
    match 'posts/new_interview', 'author#newPostInterviewAction'

    #admin
    match 'admin/blank', 'admin#blankAction'
