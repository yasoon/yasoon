define(
  [
    'text!templates/postPreviewTpl.htm'
    'text!templates/reviewPreviewTpl.htm'
    'backbone'
  ]
  (
    postPreviewTpl
    reviewPreviewTpl
  ) ->
    class PostPreview extends Backbone.View
      tagName: 'article'
      template: _.template(postPreviewTpl)
      reviewTemplate: _.template(reviewPreviewTpl)
      render: ->

        if @model.get('type') == 'post' then  @$el.html(@template(@model.toJSON()))
        else @$el.html(@reviewTemplate(@model.toJSON()))
        @
)