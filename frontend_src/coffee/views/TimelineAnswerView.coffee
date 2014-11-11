define(
  [
    'text!templates/timelineAnswerTpl.htm'
    'backbone'
  ]
  (
    timelineAnswerTpl
  )->
    class TimelineAnswerView extends Backbone.View
      tagName: 'article'

      template: _.template(timelineAnswerTpl)

      render: ->
        @$el.append(@template(@model.toJSON()))
        @
)
