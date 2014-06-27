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
        @listenTo(@collection, 'add', @addAll)
        @collection.fetch()

      addAll: ->
        if @collection.size() > 0
          @collection.each((post) => @addOne(post))
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