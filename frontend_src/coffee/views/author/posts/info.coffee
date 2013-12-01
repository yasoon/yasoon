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
        @drawUnfollow();

      'click #unfollow': ->
        @model.unfollow()
        @drawFollow();

    render: =>
      super
      unless @model.access is 'ANON'
        if @model.data.is_friend
          @drawUnfollow()
        else
          @drawFollow()

    drawFollow: ->
      @$el.find('#follow').show() unless @model.access is 'US'
      @$el.find('#unfollow').hide()

    drawUnfollow: ->
      @$el.find('#follow').hide()
      @$el.find('#unfollow').show() unless @model.access is 'US'