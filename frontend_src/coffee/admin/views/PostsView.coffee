define(
  [
    'admin/views/PostView'
    'views/EmptyView'
    'backbone'
  ]
  (
    PostView
    EmptyView
  )->
    class PostsView extends Backbone.View
      events: ->
        'click .js-load': 'getPostsData'

      initialize: ->
        @listenTo(@collection, 'add', @addOne)
        @getPostsData()

      getPostsData: ->
        $.get(@collection.url(), (data) => if data.postsCount > 0 then @collection.set(data['dateSort']) else @emptyPostsList())

      emptyPostsList: ->
        if not @emptyView?
          @emptyView = new EmptyView({message: "Постов нет"})
        else
          @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)

      addOne: (post) ->
        post = new PostView({model: post})
        @$el.append(post.render().$el)
)