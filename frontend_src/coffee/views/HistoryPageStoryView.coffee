define(
  [
    'text!templates/historyStoryTpl.htm'
    'backbone'
  ]
(historyStoryTpl) ->
  Backbone.View.extend({
    tagName: 'article'
    className: 'lim'
    template: _.template(historyStoryTpl)
    render: ->
      @$el.html(@template(@model.toJSON()))
      @

  })
)