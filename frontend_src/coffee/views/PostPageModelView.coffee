define(
  [
    'text!templates/postPageTpl.htm'
    'backbone'
  ]
(
  postPageTpl
) ->
  Backbone.View.extend({
    tagName: 'article'
    className: 'lim'
    template: _.template(postPageTpl)
    render: ->
      console.log @model.toJSON()
      @$el.html(@template(@model.toJSON()))
      @

  })
)