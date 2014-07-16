define(
  [
    'text!templates/speakerAnswerTpl.htm'
    'views/ValidationView'
    'backbone'
  ]
  (
    speakerAnswerTpl
    ValidationView
  ) ->
    class SpeakerAnswerView extends ValidationView
      tagName:                      'article'
      className:                    'lim'

      template:                     _.template(speakerAnswerTpl)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)