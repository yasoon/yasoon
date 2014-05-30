define(
  [
    'admin/views/ContentView'
    'backbone'
  ]
  (
    ContentView
  )->
    Backbone.View.extend({
      initialize: ->
        @collection.fetch()
        @listenTo(@collection, 'add', @addOne)

      showMore: ->
        @collection.fetch()

      addOne: (model) ->
        content = new ContentView({model: model})
        @$el.append(content.render().$el)
    })
)
