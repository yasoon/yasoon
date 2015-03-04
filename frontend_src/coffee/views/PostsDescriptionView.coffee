define(
  [
    'text!templates/historyStoriesTpl.htm'
    'backbone'
  ]
(
  historyStoriesTpl
) ->
  Backbone.View.extend({
    tagName: 'section'
    
    template: _.template(historyStoriesTpl)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      data = _.extend(@options, @options.description)
      @$el.empty().append(@template(data))
      @

  })
)