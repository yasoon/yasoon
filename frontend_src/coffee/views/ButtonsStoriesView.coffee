define(
  [
    'text!templates/buttonsStoriesTpl.htm'
    'backbone'
  ]
  (
    buttonsStoriesTpl
  ) ->
    class ButtonStoriesView extends Backbone.View
        
      initialize: (options) ->
        @options = options || {}

      template: _.template(buttonsStoriesTpl)

      render: ->

        @$el.append(@template(@options))
        @
)