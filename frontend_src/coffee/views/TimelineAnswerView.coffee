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
        console.log(@model.toJSON()[0])
        @$el.append(@template(@model.toJSON()[0]))
        @
)
