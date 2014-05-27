define(
  [
    'text!templates/emptyPageTpl.htm'
    'backbone'
  ]
(
  emptyPageTpl
) ->
  Backbone.View.extend({
    template: _.template(emptyPageTpl)
    initialize: (options) ->
      @options = options || {}
    render: ->
      @$el.html(@template(@options))
      @

  })
)