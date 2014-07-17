define(
  [
    'text!templates/postPreviewTpl.htm'
    'backbone'
  ]
  (
    postPreviewTpl
  ) ->
    class PostPreview extends Backbone.View
      tagName: 'article'
      template: _.template(postPreviewTpl)
      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)