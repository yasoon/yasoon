define(
  [
    'admin/views/InterviewView'
    'backbone'
  ]
  (
    InterviewView
  )->
    Backbone.View.extend({
      initialize: ->
        @collection.fetch()
        @listenTo(@collection, 'add', @addOne)

      showMore: ->
        @collection.fetch()

      addOne: (model) ->
        interview = new InterviewView({model: model})
        @$el.append(interview.render().$el)
    })
)