define(
  [
    'text!templates/speakerAnswerTpl.htm'
    'backbone'
    'mediator'
    'stickit'
  ]
(
  speakerAnswerTpl
) ->
  Backbone.View.extend({
    tagName: 'article'

    className: 'lim'

    template: _.template(speakerAnswerTpl)

    bindings:
      '#questionAnswerText': 'questionAnswerText'

    events: ->
      'submit form': 'addQuestionAnswer'
      'click .js-delete': 'deleteQuestion'

    render: ->
      @$el.html(@template(@model.toJSON()))
      @stickit()
      @

    addQuestionAnswer: (event) ->
      event.preventDefault()
      $.post('/api/question/addAnswer', {
        model: @model.toJSON()
      }, (data) =>
        if not data.error
          @model.set('hasAnswer', yes)
          Backbone.Mediator.publish('question:answered', @model)
          $(event.currentTarget).closest('article').remove()
      )

    deleteQuestion: (event) ->
      event.preventDefault()

      $.post('/api/question/delete', {
        model:
          id: @model.get('id')
      }, (data) =>
        if not data.error
          console.log data
          $(event.currentTarget).closest('article').remove()
      )
  })
)