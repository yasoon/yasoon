define(
  [
    'text!templates/categoryTpl.htm'
    'backbone'
  ]
(
  categoryTpl
) ->
  Backbone.View.extend({
    tagName: 'li'
    
    template: _.template(categoryTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)