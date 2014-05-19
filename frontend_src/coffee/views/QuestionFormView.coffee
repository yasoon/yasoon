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
        if @model.isValid()
          $.post('/api/question/add', {
            model: @model.toJSON()
          }, (data) ->
            console.log data
          )
        else
          console.log @model.validationError
    })
)