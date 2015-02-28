define(
  [
    'text!templates/speakerWritePostButtonTpl.htm'
    'views/StoriesPopUpView'
    'backbone'
  ]
  (
    speakerWritePostButtonTpl
    StoriesPopUpView
  ) ->
    class SpeakerWritePostButtonView extends Backbone.View
      events: ->
        'click .write-post-button p a.historiesBtn': 'showHistories'

      tagName: 'section'
      template: _.template(speakerWritePostButtonTpl)
      render: ->
        @$el.append(@template())
        @

      showHistories:(event) ->
        event.preventDefault()
        @storiesPopUpView = new StoriesPopUpView({type: 'post'})
        $('body').append(@storiesPopUpView.render().$el)

)