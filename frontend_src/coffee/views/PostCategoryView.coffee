define(
  [
    'text!templates/postCategoryTpl.htm'
    'backbone'
  ]
(
  postCategoryTpl
) ->
  Backbone.View.extend({
    tagName: 'li'

    className: 'checkbox'
    
    template: _.template(postCategoryTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)