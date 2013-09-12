// Generated by CoffeeScript 1.6.3
define(function() {
  'use strict';
  return function(match) {
    match('about', 'blog#aboutAction');
    match('blog', 'blog#blogAction');
    match('blog/questions', 'blog#questionsAction');
    match('agreement', 'blog#agreementAction');
    match('register', 'register#indexAction');
    match('editinfo', 'register#editInfoAction');
    match('people', 'people#peopleAction');
    match('people/:catId', 'people#peopleAction');
    match('explore/:mode', 'people#exploreAction');
    match('explore/:mode/:catId', 'people#exploreAction');
    match('author/:authorId/posts/new/blank', 'author#newBlankPostAction');
    match('author/:authorId/posts/new', 'author#newPostAction');
    match('author/:authorId/posts/:postId', 'author#readPostAction');
    match('author/:authorId/posts', 'author#postsAction');
    match('author/:authorId/questions', 'author#questionsAction');
    match('admin/blank', 'admin#blankAction');
    match('admin/stories', 'admin#storiesAction');
    match('admin/timeline', 'admin#timelineAction');
    match('admin/content', 'admin#contentAction');
    match('stories', 'index#storiesAction');
    match('', 'index#indexAction');
    match('timeline', 'timeline#indexAction');
    return match('*notFound', 'index#e404Action');
  };
});
