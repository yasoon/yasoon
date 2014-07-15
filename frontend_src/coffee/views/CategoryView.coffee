define(
  [
    'text!templates/categoryTpl.htm'
    'backbone'
  ]
  (
    categoryTpl
  ) ->
    class CategoryView extends Backbone.View
      tagName: 'li'
      template: _.template(categoryTpl)

      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)