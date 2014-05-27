define(
  [
    'text!templates/speakerPostTpl.htm'
    'backbone'
  ]
(
  speakerPostTpl
) ->
  Backbone.View.extend({
    tagName: 'article'
    className: 'lim'
    template: _.template(speakerPostTpl)
    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)