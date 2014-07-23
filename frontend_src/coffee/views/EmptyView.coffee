define(
  [
    'text!templates/emptyPageTpl.htm'
    'backbone'
  ]
  (
    emptyPageTpl
  ) ->
    class EmptyView extends Backbone.View
      template: _.template(emptyPageTpl)
      initialize: (options) ->
        @options = options || {}
      render: ->
        @$el.html(@template(@options))
        @
)