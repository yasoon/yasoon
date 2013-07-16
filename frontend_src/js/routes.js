// Generated by CoffeeScript 1.6.1

define(function() {
  'use strict';  return function(match) {
    match('people', 'people#listAction');
    match('author/:authorId/posts/new', 'author#newPostAction');
    match('author/:authorId/posts/:postId', 'author#readPostAction');
    match('author/:authorId/posts', 'author#postsAction');
    match('author/:authorId/questions', 'author#questionsAction');
    return match('admin/blank', 'admin#blankAction');
  };
});
