define(
  [
    'admin/views/InterviewQuestionView'
    'backbone'
  ]
  (
    InterviewQuestionView
  )->
    Backbone.View.extend({
      initialize: ->
        @listenTo(@collection, 'add', @addOne)

      render: ->
        @collection.each( (question) =>
          @addOne(question)
        )
        @

      addOne: (model) ->
        interview = new InterviewQuestionView({model: model})
        @$el.append(interview.render().$el)
    })
)