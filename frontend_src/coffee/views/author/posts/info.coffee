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
        if @model.access is 'USER'
          @model.follow()
          $('#follow').hide()
          $('#unfollow').show()

      'click #unfollow': ->
        if @model.access is 'USER'
          @model.unfollow()
          $('#follow').show()
          $('#unfollow').hide()
