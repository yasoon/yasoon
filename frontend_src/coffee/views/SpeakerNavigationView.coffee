define(
  [
    'text!templates/speakerPageTpl.htm'
    'backbone'
  ]
(
  speakerPageTpl
) ->
  Backbone.View.extend({
    tagName: 'section'
    
    className: 'lim'
    
    template: _.template(speakerPageTpl)

    initialize: (options) ->
      @options = options || {}

    render: ->
      @$el.append(@template(@options))
      @

  })
)