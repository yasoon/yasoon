define(
  [
    'text!templates/authorPageTpl.htm'
    'backbone'
  ]
(
  authorPageTpl
) ->
  Backbone.View.extend({
    tagName: 'section'
    
    className: 'lim'
    
    template: _.template(authorPageTpl)

    initialize: (options) ->
      @options = options || {}

    render: ->
      @$el.append(@template(@options))
      @$("##{@options.page}").addClass('active')
      @

  })
)