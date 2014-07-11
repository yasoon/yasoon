define(
  [
    'admin/views/InterviewView'
    'backbone'
    'mediator'
  ]
  (
    InterviewView
  )->
    class InterviewsView extends Backbone.View
      initialize: ->
        @listenTo(@collection, 'add', @addOne)
        @getInterviewsList()

      getInterviewsList: ->
        $.get(@collection.url, (data) => @collection.set(data))

      addOne: (interview) ->
        interview = new InterviewView({model: interview})
        @$el.append(interview.render().$el)
)