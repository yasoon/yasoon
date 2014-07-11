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
        console.log(@collection)
#        @listenTo(@collection, 'add', @addOne)

      render: ->
        @collection.each( (question) => @addOne(question))
        @

      addOne: (question) ->
        console.log(question)
        question = new InterviewQuestionView({model: question})
        @$el.append(question.render().$el)
)