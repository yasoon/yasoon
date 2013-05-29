define [
         'views/base/view'
         'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsView extends View
  # Automatically render after initialize.
    autoRender: true
    className: 'authorPosts'
    container: '#center'
    regions:
      '#newPost': 'newPost'
      '#postsQueue': 'queue'

    templateName: 'authorPosts'


