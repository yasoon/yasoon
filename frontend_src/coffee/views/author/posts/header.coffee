define [
  'views/index/header'
], (IndexHeaderView, JST) ->
  'use strict'

  class AuthorPostsHeaderView extends IndexHeaderView
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'author_posts_header'