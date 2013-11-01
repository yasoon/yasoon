define [
         'views/base/view'
         'JST'
         'categories'
], (View, JST, categories) ->
  'use strict'

  class AuthorPostsInfoView extends View
    className: 'info'

    templateName: 'author_posts_info'

    events:
      'click #follow': ->
        @model.follow()
        $('#follow').hide()
        $('#unfollow').show()

      'click #unfollow': ->
        @model.unfollow()
        $('#follow').show()
        $('#unfollow').hide()
