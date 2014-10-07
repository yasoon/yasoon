define(
  [
    'text!templates/postPageTpl.htm'
    'backbone'
  ]
  (
    postPageTpl
  ) ->
    class PostPageModelView extends Backbone.View
      tagName: 'article'
      className: 'lim'
      template: _.template(postPageTpl)
      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)