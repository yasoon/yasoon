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
        console.log @collection
        @listenTo(@collection, 'add', @addOne)

      render: ->
        @collection.each( (question) =>
          @addOne(question)
        )
        @

      addOne: (question) ->
        question = new InterviewQuestionView({model: question})
        @$el.append(question.render().$el)

    })
)