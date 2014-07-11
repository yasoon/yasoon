define(
  [
    'text!admin/templates/interviewTpl.htm'
    'text!admin/templates/interviewQuestionTpl.htm'
    'admin/views/InterviewsQuestionsView'
    'backbone'
    'stickit'
  ]
  (
    interviewTpl
    interviewQuestionTpl
    InterviewsQuestionsView
  )->
    class InterviewView extends Backbone.View
      tagName: 'article'

      className: 'interview'

      template: _.template(interviewTpl)

      questionTpl: _.template(interviewQuestionTpl)

      bindings:
        '#name': 'name'
        '.name': 'name'

      events: ->
        'click .js-delete': 'deleteInterview'
        'click .js-deleteQuestion': 'deleteQuestion'
        'click .js-add': 'addQuestion'
        'click .js-save': 'saveInterview'

      render: ->
        @$el.append(@template(_.extend({}, @model.toJSON(), questionTpl: @questionTpl)))
        @stickit()
        @

      deleteInterview: (event) ->
        event.preventDefault()
        $.post('/api/interview/delete_interviews',{id: @model.get('id')}, (data) -> if data then @$el.remove())

      deleteQuestion: (event) ->
        event.preventDefault()
        @$(event.currentTarget).closest('.input-group').remove()

      addQuestion: (event) ->
        event.preventDefault()
        text = @$('#add')
        @$('.questions').append(@questionTpl({text: text.val()}))
        text.val('')

      saveInterview: (event) ->
        event.preventDefault()
        button = $(event.currentTarget)
        oldText = button.text()
        button.text('Сохранено').prop('disabled', yes)
        $.post('/api/interview/save_interview', {interview: _.extend({}, @model.toJSON(), {questions: @getInterviewQuestions()})}, => @changeButtonText(button, oldText))

      getInterviewQuestions: ->
        questions = []
        @$('.questions').find('.input-group input').each((index, input) => questions.push({text: $(input).val()}))
        questions

      changeButtonText: (button, oldText) ->
        window.setTimeout(->
          button.text(oldText).prop('disabled', no)
        , 3000)
)