define(
  [
    'text!templates/speakerWritePostButtonTpl.htm'
    'backbone'
  ]
  (
    speakerPageTpl
  ) ->
    class SpeakerWritePostButtonView extends Backbone.View
      tagName: 'section'

      className: 'lim'

      template: _.template(speakerPageTpl)

      render: ->
        @$el.append(@template())
        @
)