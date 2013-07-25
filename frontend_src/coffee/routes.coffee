define ->
  'use strict'

  (match) ->

    match 'register', 'register#indexAction'

    #match 'author/:authorId/posts/:id', 'post#postAction'

    match 'people', 'people#peopleAction'
    match 'people/:catId', 'people#peopleAction'

    match 'explore/:mode', 'people#exploreAction'
    match 'explore/:mode/:catId', 'people#exploreAction'

    match 'author/:authorId/posts/new', 'author#newPostAction'
    match 'author/:authorId/posts/:postId', 'author#readPostAction'

    match 'author/:authorId/posts', 'author#postsAction'
    match  'author/:authorId/questions', 'author#questionsAction'

    #match 'posts/new', 'author#newPostAction'
    #match 'posts/new_interview', 'author#newPostInterviewAction'

    #admin
    match 'admin/blank', 'admin#blankAction'
    match 'admin/stories', 'admin#storiesAction'

    match 'stories', 'index#storiesAction'
    match '', 'index#indexAction'

    match 'timeline', 'timeline#indexAction'
