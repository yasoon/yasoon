define(
  [
    'text!templates/postPageAuthorTpl.htm'
    'backbone'
  ]
(
  postPageAuthorTpl
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'postinfo'
    template: _.template(postPageAuthorTpl)
    render: ->
      @$el
        .html(@template(@model.toJSON()))
      @

  })
)