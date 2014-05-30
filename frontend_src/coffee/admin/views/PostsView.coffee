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
    Backbone.View.extend({
      initialize: ->
        @collection.fetch()
        if @collection.size() > 0
          @listenTo(@collection, 'add', @addOne)
        else
          if not @emptyView?
            @emptyView = new EmptyView({
              message: "Постов нет"
            })
          else
            @emptyView.delegateEvents()
          @$el.append(@emptyView.render().$el)

      showMore: ->
        @collection.fetch()

      addOne: (model) ->
        post = new PostView({model: model})
        @$el.append(post.render().$el)
    })
)