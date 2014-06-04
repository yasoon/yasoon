define(
  [
    'text!templates/speakerAnswerTpl.htm'
    'views/ValidationView'
    'backbone'
    'mediator'
    'stickit'
  ]
(
  speakerAnswerTpl
  ValidationView
) ->
  class SpeakerAnswerView extends ValidationView
    tagName:                      'article'
    className:                    'lim'

    template:                     _.template(speakerAnswerTpl)

    bindings:
      '#questionAnswerText':      'questionAnswerText'

    events: ->
      'submit form':              'addQuestionAnswer'
      'click .js-delete':         'deleteQuestion'

    render: ->
      @$el.html(@template(@model.toJSON()))
      @stickit()
      @

    addQuestionAnswer: (event) ->
      event.preventDefault()
      @hideErrors
      if @model.isValid()
        $.post('/api/question/addAnswer', {
          model: @model.toJSON()
        }, (data) =>
          if not data.error
            @model.set('hasAnswer', yes)
            Backbone.Mediator.publish('question:answered', @model)
            $(event.currentTarget).closest('article').remove()
        )
      else
        @showErrors(@model.validationError)

    deleteQuestion: (event) ->
      event.preventDefault()
      $.post('/api/question/delete', {
        model:
          id: @model.get('id')
      }, (data) ->
        if not data.error
          console.log data
          $(event.currentTarget).closest('article').remove()
      )
)