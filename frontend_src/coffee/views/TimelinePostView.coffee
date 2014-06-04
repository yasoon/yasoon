define(
  [
    'text!templates/timelinePostTpl.htm'
    'backbone'
  ]
  (
    timelinePostTpl
  )->
    class TimelinePostView extends Backbone.View
      tagName: 'article'

      template: _.template(timelinePostTpl)

      render: ->
        @$el.append(@template(@model.toJSON()))
        @
)
