define(
  [
    'admin/views/ContentsView'
    'admin/collections/ContentsCollection'
    'backbone'
  ]
  (
    ContentsView
    ContentsCollection
  )->
    Backbone.View.extend({
      initialize: ->
        if not @contentList?
          @contentList= new ContentsView({
            collection: new ContentsCollection()
          })
        else
          @contentList.delegateEvents()
        @$el.append(@contentList.render().$el)
        @$('.collapse').collapse()
    })
)