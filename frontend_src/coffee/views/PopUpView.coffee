define(
  [
    'backbone'
  ]
() ->
  Backbone.View.extend({
    events: ->
      'click .popUpBackground': 'clickPopUp'

    clickPopUp: (event) ->
      event.preventDefault()
      @closePopUp()

    escapePopUp: (event) ->
      event.preventDefault()
      if event.keyCode is 27 or event.which is 27
        @closePopUp()
        $(document).off('keyup')

    closePopUp: ->
      @remove()

    render: ->
      @$el.prepend('<div class="popUpBackground"></div>')
      @

    initialize: ->
      _.bindAll(@)
      $(document).on('keyup', @escapePopUp)
  })
)