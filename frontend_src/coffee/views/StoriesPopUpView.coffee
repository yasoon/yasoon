define(
  [
    'text!templates/storiesPopUpTpl.htm'
    'views/PopUpView'
    'views/ButtonsStoriesView'
    'backbone'
  ]
  (
    storiesPopUpTpl
    PopUpView
    ButtonsStoriesView
  ) ->
    class StoriesPopUpView extends PopUpView
        
      initialize: ->
        @setInterviews()

      events: ->
        _.extend {}, super,
          'click .connect p a': 'closePopup'
      className: 'barrier'

      template: _.template(storiesPopUpTpl)

      render: ->
        @$el.empty().append(@template())
        super
        @onRender()
        @

      onRender: ->
        @$el.show()

      closePopup: ->
        $('.popUpBackground').click()

      setInterviews: ->
        $.get("/api/interview/get_interview_buttons", (data) =>
            _.each(data, (item) ->
                $('.connect').append(new ButtonsStoriesView({
                    interviewTitle: item.name
                    interviewId: item.id
                }).render().$el)
            )
        )
)