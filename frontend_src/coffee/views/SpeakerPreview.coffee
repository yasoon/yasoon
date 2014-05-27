define(
  [
    'text!templates/speakerPreviewTpl.htm'
    'backbone'
  ]
(
  speakerPreviewTpl
) ->
  Backbone.View.extend({
    tagName: 'article'
    className: 'lim'
    template: _.template(speakerPreviewTpl)
    render: ->
      @$el.html(@template(@model.toJSON()))
      @
  })
)