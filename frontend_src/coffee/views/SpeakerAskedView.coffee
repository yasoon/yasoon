define(
  [
    'text!templates/speakerAskedQuestionsTpl.htm'
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
        'click .js-open':           'openQuestion'

      render: ->
        @$el.html(@template(@model.toJSON()))
        @stickit()
        @

      addQuestionAnswer: (event) ->
        event.preventDefault()
        @hideErrors()
        if @model.isValid() then @addAnswer() else @showErrors(@model.validationError)

      addAnswer: ->
        $.post('/api/question/addAnswer', {model: @model.toJSON()}, (data) => if not data.error then @renderAnswer())

      renderAnswer: ->
        @model.set('hasAnswer', yes)
        Backbone.Mediator.publish('question:answered', @model)
        @removeItem()

      openQuestion: (event) ->
        event.preventDefault()
        @$('.content').slideToggle()

      deleteQuestion: (event) ->
        event.preventDefault()
        $.post('/api/question/delete', {model: {id: @model.get('id')}}, (data) => if not data.error then @removeItem())

      removeItem: ->
        @$el.remove()
)