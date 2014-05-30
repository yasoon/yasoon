define(
  [
    'admin/views/InterviewsView'
    'admin/collections/InterviewsCollection'
    'backbone'
  ]
  (
    InterviewsView
    InterviewsCollection
  )->
    Backbone.View.extend({
      initialize: ->
        if not @postsList?
          @postsList = new InterviewsView({
            collection: new InterviewsCollection()
          })
        else
          @postsList.delegateEvents()
        @$el.append(@postsList.render().$el)
    })
)