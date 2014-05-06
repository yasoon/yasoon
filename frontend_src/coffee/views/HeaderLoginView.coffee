define(
  [
    'text!templates/headerLoginTpl.htm'
    'backbone'
  ]
(
  headerLoginTpl
) ->
  class HeaderLoginView extends Backbone.View
    template: _.template(headerLoginTpl)

    render: ->
      @$el.append(@template())
      @
)