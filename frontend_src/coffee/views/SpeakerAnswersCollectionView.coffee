define(
  [
    'views/SpeakerAnswerView'
    'views/SpeakerAskedView'
    'backbone'
    'mediator'
  ]
  (
    SpeakerAnswerView
    SpeakerAskedView
  ) ->
    class SpeakerAnswersCollectionView extends Backbone.View
      subscriptions:
        'question:answered': 'addOneAnswer'

      renderQuestion: ->
        _.each(@asked(), (question) => @addOneQuestion(question))
        @

      asked: ->
        @collection.where({hasAnswer: no})

      addOneQuestion: (question) ->
        speakerAskedView = new SpeakerAskedView({model: question})
        @$el.prepend(speakerAskedView.render().$el)

      renderAnswer: ->
        _.each(@answered(), (answer) => @addOneAnswer(answer))
        @

      answered: ->
        @collection.where({hasAnswer: yes})

      addOneAnswer: (answer) ->
        speakerAnswerView = new SpeakerAnswerView({model: answer})
        @$el.prepend(speakerAnswerView.render().$el)
)