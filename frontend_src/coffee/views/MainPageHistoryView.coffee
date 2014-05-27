define(
  [
    'text!templates/mainPageHistoryTpl.htm'
    'backbone'
  ]
(
  MainPageHistoryTpl
) ->
  Backbone.View.extend({
    tagName: 'section'
    className: 'main-layout'
    template: _.template(MainPageHistoryTpl)
    render: ->
      @$el
        .html(@template(@model.toJSON()))
      @

  })
)