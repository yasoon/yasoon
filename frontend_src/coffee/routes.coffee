define ->
  'use strict'

  (match) ->

    #match 'author/:authorId/posts/:id', 'post#postAction'

    match 'people', 'people#listAction'

    match 'author/:authorId/posts/new', 'author#newPostAction'
    match 'author/:authorId/posts/:postId', 'author#readPostAction'

    match 'author/:authorId/posts', 'author#postsAction'
    match  'author/:authorId/questions', 'author#questionsAction'


    #match 'posts/new', 'author#newPostAction'
    #match 'posts/new_interview', 'author#newPostInterviewAction'

    #admin
    match 'admin/blank', 'admin#blankAction'
