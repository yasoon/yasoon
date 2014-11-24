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
        'change #select-new-history': 'createHistory'

      tagName: 'section'
      template: _.template(speakerPageTpl)
      render: ->
        @$el.append(@template())
        @

      createHistory:(event) ->
        event.preventDefault()
        page = $('#select-new-history').val()
        window.location.href = '/#/post/new/'+ page
)