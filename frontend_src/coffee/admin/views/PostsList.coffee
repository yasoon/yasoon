define(
  [
    'admin/views/PostsView'
    'admin/collections/PostsCollection'
    'backbone'
  ]
  (
    PostsView
    PostsCollection
  )->
    Backbone.View.extend({
      initialize: ->
        if not @postsList?
          @postsList = new PostsView({
            collection: new PostsCollection()
          })
        else
          @postsList.delegateEvents()
        @$el.append(@postsList.render().$el)
    })
)