define(
  [
    'text!templates/speakerWritePostButtonTpl.htm'
    'backbone'
  ]
  (
    speakerPageTpl
  ) ->
    class SpeakerWritePostButtonView extends Backbone.View
      events: ->
        'click .write-post-button a': 'showHistories'

      tagName: 'section'
      template: _.template(speakerPageTpl)
      render: ->
        @$el.append(@template())
        @

      showHistories:(event) ->
        event.preventDefault()
        $('#new-histories-menu').toggle()

)