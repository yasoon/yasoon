define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'author_posts_header'


