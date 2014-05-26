define(
  [
    'text!templates/headerLogedTpl.htm'
    'backbone'
  ]
(
  headerLogedTpl
) ->
  class HeaderLogedView extends Backbone.View
    template: _.template(headerLogedTpl)

    render: ->
      @$el.append(@template(@model.toJSON()))
      @

    events: ->
      'click #js-logout': 'logout'

    logout: (event) ->
      event.preventDefault()
      event.stopPropagation()
      $.post('/logout', {
      }, (data) ->
        window.config.userId = no
        window.location.reload(true)
      )
)