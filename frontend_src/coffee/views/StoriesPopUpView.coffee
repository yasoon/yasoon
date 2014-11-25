define(
  [
    'text!templates/storiesPopUpTpl.htm'
    'views/PopUpView'
    'backbone'
  ]
  (
    storiesPopUpTpl
    PopUpView
  ) ->
    class StoriesPopUpView extends PopUpView
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

)