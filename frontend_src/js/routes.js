// Generated by CoffeeScript 1.6.1

define(function() {
  'use strict';  return function(match) {
    match('', 'index#indexAction');
    match('author/:id/posts', 'author#postsAction');
    match('author/:id/questions', 'author#questionsAction');
    match('posts/new', 'author#newPostAction');
    match('posts/new_interview', 'author#newPostInterviewAction');
    match('post/:id', 'post#postAction');
    return match('admin/blank', 'admin#blankAction');
  };
});
