define(
  [
    'views/SpeakerAnswerView'
    'backbone'
    'mediator'
  ]
(
  SpeakerAnswerView
) ->
  Backbone.View.extend({
    initialize: (options) ->
      @options = options or {}

    subscriptions:
      'question:answered': 'addOne'

    render: ->
      @collection.each( (answer) =>
        @addOne(answer)
      )
      @

    addOne: (answer) ->
      if @options.id is window.userId
        answer.set('author', yes)
      speakerAnswerView = new SpeakerAnswerView({model: answer})
      @$el.prepend(speakerAnswerView.render().$el)

    answered: ->
      _.where(@collection.toJSON(), {hasAnswer: true})

  })
)
