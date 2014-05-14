define(
  [
    'views/SpeakerPostView'
    'backbone'
  ]
(
  SpeakerPostView
) ->
  Backbone.View.extend({
    tagName: 'section'
      
    render: ->
      @collection.each( (post) =>
        @addOne(post)
      )
      @

    addOne: (post) ->
      speakerPostView = new SpeakerPostView({model: post})
      @$el.prepend(speakerPostView.render().$el)

  })
)