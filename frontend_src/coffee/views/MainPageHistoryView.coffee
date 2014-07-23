define(
  [
    'text!templates/mainPageHistoryTpl.htm'
    'backbone'
  ]
  (
    MainPageHistoryTpl
  ) ->
    class MainPageHistoryView extends Backbone.View
      tagName: 'section'
      className: 'main-layout'
      template: _.template(MainPageHistoryTpl)
      render: ->
        @$el.html(@template(@model.toJSON()))
        @
)