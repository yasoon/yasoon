define(
  [
    'text!templates/speakerWritePostButtonTpl.htm'
    'views/StoriesPopUpView'
    'backbone'
  ]
  (
    speakerPageTpl
    StoriesPopUpView
  ) ->
    class SpeakerWritePostButtonView extends Backbone.View
      events: ->
        'click .write-post-button p a': 'showHistories'

      tagName: 'section'
      template: _.template(speakerPageTpl)
      render: ->
        @$el.append(@template())
        @

      showHistories:(event) ->
        event.preventDefault()
        @storiesPopUpView = new StoriesPopUpView()
        $('body').append(@storiesPopUpView.render().$el)

)