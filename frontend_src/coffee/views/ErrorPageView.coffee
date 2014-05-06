define(
  [
    'text!templates/errorPageTpl.htm'
    'backbone'
  ]
(
  errorPageTpl
) ->
  Backbone.View.extend({
    tagName: 'section'

    template: _.template(errorPageTpl)
      
    render: ->
      @$el.append(@template())
      @

  })
)