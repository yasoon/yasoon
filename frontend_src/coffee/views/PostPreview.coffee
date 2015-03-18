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
        else if @model.get('type') == 'review' then @$el.html(@reviewTemplate(@model.toJSON()))
        @
)