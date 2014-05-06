define(
  [
    'views/SpeakerAnswerView'
    'backbone'
  ]
(
  SpeakerAnswerView
) ->
  Backbone.View.extend({
    tagName: 'section'

    answered: ->
      _.where(@collection.toJSON(), {hasAnswer: true})
      
    render: ->
      @collection.each( (answer) =>
        @addOne(answer)
      )
      @

    addOne: (answer) ->
      speakerAnswerView = new SpeakerAnswerView({model: answer})
      @$el.append(speakerAnswerView.render().$el)

  })
)