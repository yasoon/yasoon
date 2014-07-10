define(
  [
    'text!templates/speakerPageTpl.htm'
    'backbone'
  ]
(
  speakerPageTpl
) ->
  class SpeakerNavigationView extends Backbone.View
    tagName: 'section'
    
    className: 'lim'
    
    template: _.template(speakerPageTpl)

    initialize: (options) ->
      @options = options || {}

    render: ->
      @$el.append(@template(@options))
      @
)