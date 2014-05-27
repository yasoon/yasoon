define(
  [
    'text!templates/postPreviewTpl.htm'
    'backbone'
  ]
(
  postPreviewTpl
) ->
  Backbone.View.extend({
    tagName: 'article'
    template: _.template(postPreviewTpl)
    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)