define ->
  'use strict'

  (match) ->
    match '', 'index#indexAction'
    match 'author/:id/posts', 'author#postsAction'
