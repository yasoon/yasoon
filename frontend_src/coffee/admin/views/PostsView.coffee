define(
  [
    'admin/views/PostView'
    'backbone'
  ]
  (
    PostView
  )->
    Backbone.View.extend({
      initialize: ->
        @collection.fetch()
        @listenTo(@collection, 'add', @addOne)

      showMore: ->
        counter += 1
        @collection.fetch()

      addOne: (model) ->
        post = new PostView({model: model})
        @$el.append(post.render().$el)
    })
)