define(
  [
    'text!admin/templates/postsListTpl.htm'
    'admin/views/PostsView'
    'admin/collections/PostsCollection'
    'backbone'
  ]
  (
    postsListTpl
    PostsView
    PostsCollection
  )->
    class PostsList extends Backbone.View
      template: _.template(postsListTpl)
      initialize: ->
        @$el.append(@template())
        if not @postsList?
          @postsList = new PostsView({collection: new PostsCollection()})
        else
          @postsList.delegateEvents()
        @$('.postsList').append(@postsList.render().$el)
)