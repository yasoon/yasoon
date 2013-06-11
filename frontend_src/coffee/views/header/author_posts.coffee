define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class HeaderAuthorPosts extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'header_author_posts'


