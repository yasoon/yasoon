define(
  [
    'text!templates/reviewPageTpl.htm'
    'backbone'
  ]
  (
    reviewPageTpl
  ) ->
    class ReviewPageModelView extends Backbone.View
      tagName: 'article'
      className: 'lim'
      template: _.template(reviewPageTpl)
      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)