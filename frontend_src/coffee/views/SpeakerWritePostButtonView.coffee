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
        'click .write-post-button p a.historiesBtn': 'showHistories'
        'click .write-post-button p a.categoriesBtn': 'showCategories'

      tagName: 'section'
      template: _.template(speakerWritePostButtonTpl)
      render: ->
        @$el.append(@template())
        @

      showHistories:(event) ->
        event.preventDefault()
        @storiesPopUpView = new StoriesPopUpView({type: 'post'})
        $('body').append(@storiesPopUpView.render().$el)
        
      showCategories:(event) ->
        event.preventDefault()
        @reviewCategoriesView = new ReviewCategoriesView({type: 'review'})
        $('body').append(@reviewCategoriesView.render().$el)

)