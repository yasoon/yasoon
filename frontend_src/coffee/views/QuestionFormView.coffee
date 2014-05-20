define(
  [
    'text!templates/answersListTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    answersListTpl
  ) ->
    Backbone.View.extend({
      template: _.template(answersListTpl)

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
          )
        else
          @showErrors(@model.validationError)

      hideErrors: ->
        @$('.form-group')
          .removeClass('has-error')
          .addClass('has-success')
          .find('.help-block')
          .text('')

      showErrors: (errors) ->
        _.each( errors, (error) =>
          @$("##{error.name}")
            .closest('.form-group')
            .removeClass('has-success')
            .addClass('has-error')
            .find('.help-block')
            .text(error.message)
        )
    })
)