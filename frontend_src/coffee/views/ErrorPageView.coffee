define(
  [
    'text!templates/errorPageTpl.htm'
    'backbone'
  ]
  (
    errorPageTpl
  ) ->
    class ErrorPageView extends Backbone.View
      tagName: 'section'

      template: _.template(errorPageTpl)

      render: ->
        @$el.append(@template())
        @
)