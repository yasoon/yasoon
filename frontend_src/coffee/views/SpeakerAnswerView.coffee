define(
  [
    'text!templates/speakerAnswerTpl.htm'
    'backbone'
  ]
(
  speakerAnswerTpl
) ->
  Backbone.View.extend({
    tagName: 'article'
    className: 'lim'
    template: _.template(speakerAnswerTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)