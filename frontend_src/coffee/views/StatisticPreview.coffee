define(
  [
    'text!templates/statisticPreview.htm'
    'backbone'
  ]
(
  statisticPreview
) ->
  Backbone.View.extend({
    tagName: 'section'
    
    template: _.template(statisticPreview)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      @$el.empty().append(@template(_.extend({}, @options)))
      @

  })
)