define(
  [
    'text!templates/speakerWritePostButtonTpl.htm'
    'views/StoriesPopUpView'
    'views/ReviewCategoriesView'
    'backbone'
  ]
  (
    speakerWritePostButtonTpl
    StoriesPopUpView
    ReviewCategoriesView
  ) ->
    class SpeakerWritePostButtonView extends Backbone.View
      events: ->
        'click .write-post-button p a.historiesBtn': 'showReviews'

      tagName: 'section'
      template: _.template(speakerWritePostButtonTpl)
      render: ->
        @$el.append(@template())
        @

      showHistories:(event) ->
        event.preventDefault()
        @storiesPopUpView = new StoriesPopUpView({type: 'post'})
        $('body').append(@storiesPopUpView.render().$el)
        
      showReviews:(event) ->
        event.preventDefault()
        @reviewPopUpView = new ReviewCategoriesView({type: 'review'})
        $('body').append(@reviewPopUpView.render().$el)

)