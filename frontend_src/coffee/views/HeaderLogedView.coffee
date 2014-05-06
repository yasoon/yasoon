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
)