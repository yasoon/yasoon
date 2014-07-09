define(
  [
    'text!admin/templates/interviewQuestionTpl.htm'
    'backbone'
    'stickit'
    'mediator'
  ]
  (
    interviewQuestionTpl
  )->
    class InterviewQuestionView extends Backbone.View
      tagName: 'li'

      className: 'input-group'

      template: _.template(interviewQuestionTpl)

      bindings:
        '#text': 'text'

      events:
        'click .js-delete': 'deleteQuestion'

      render: ->
        @$el.append(@template(@model.toJSON()))
        @stickit()
        @

      deleteQuestion: (event) ->
        event.preventDefault()
        Backbone.Mediator.publish('question:removed', @model)
        @$el.remove()
)