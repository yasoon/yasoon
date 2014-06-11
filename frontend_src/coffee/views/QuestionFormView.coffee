define(
  [
    'text!templates/answersListTpl.htm'
    'views/ValidationView'
    'backbone'
    'stickit'
  ]
  (
    answersListTpl
    ValidationView
  ) ->
    class QuestionFormView extends ValidationView
      template: _.template(answersListTpl)
      className: 'question-form'

      events: ->
        'submit form': 'setQuestion'

      bindings:
        '#question': 'question'

      initialize: (options) ->
        @options = options or {}
        @$el.append(@template())
        @stickit()

      setQuestion: (event) ->
        event.preventDefault()
        @hideErrors()
        if @model.isValid()
          $.post('/api/question/add', {
            model: @model.toJSON()
          }, (data) =>
            @model.set('savedQuestion', @model.get('question'))
            @$(event.currentTarget).find('textarea').val('').closest('section').find('.answers').text(_.getContent(66))
          )
        else
          @showErrors(@model.validationError)
)