define(
  [
    'admin/views/InterviewQuestionView'
    'backbone'
  ]
  (
    InterviewQuestionView
  )->
    class InterviewsQuestionsView extends Backbone.View
      initialize: ->
#        @listenTo(@collection, 'add', @addOne)

      render: ->
        @collection.each( (question) => @addOne(question))
        @

      addOne: (question) ->
        question = new InterviewQuestionView({model: question})
        @$el.append(question.render().$el)
)