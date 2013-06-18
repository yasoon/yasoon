define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AuthorPostsQueue extends View
    className: 'postQueue'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'

    templateName: 'author_postsQueue'

    addSortable: ->
      if @authorized
        @$el.find('.posts').sortable(
          cursor: 'move'
          update: =>
            #@refreshOrder()
        )
      else
        @$el.find('.posts').sortable('enable')


    render: ->
      super
      @addSortable()

    softRender: ->
      super
      @addSortable()


    getTemplateData: ->
      console.log @model.posts
      {posts: @model.posts, authorized: @authorized}


