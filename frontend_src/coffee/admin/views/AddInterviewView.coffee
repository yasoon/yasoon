define(
  [
    'text!admin/templates/interviewTpl.htm'
    'admin/views/InterviewsQuestionsView'
    'backbone'
    'stickit'
  ]
  (
    interviewTpl
    InterviewsQuestionsView
  )->
    Backbone.View.extend({
      tagName: 'article'

      className: 'interview'

      template: _.template(interviewTpl)

      bindings:
        '#name': 'name'
        '.name': 'name'

      events: ->
        'click .js-delete': 'deleteInterview'
        'click .js-add': 'addQuestion'
        'click .js-save': 'saveInterview'

      render: ->
        @$el.append(@template(@model.toJSON()))
        @stickit()
        @onRender()
        @

      onRender: ->
        @createInterviewsList()

      createInterviewsList: ->
        if not @interviewsQuestionView?
          @interviewsQuestionView = new InterviewsQuestionsView({
            collection: @model.questions
          })
        else
          @interviewsQuestionView.delegateEvents()
        @$('#questionList').append(@interviewsQuestionView.render().$el)

      deleteInterview: (event) ->
        event.preventDefault()
        $.post('/api/interview/delete_interviews',{
            id:"24"
          }, (data) ->
          if data
            @$el.remove()
        )

      addQuestion: (event) ->
        event.preventDefault()
        text = @$('#add')
        @model.questions.add({
          text: text.val()
        })
        text.val('')

      saveInterview: (event) ->
        event.preventDefault()
        button = $(event.currentTarget)
        oldText = button.text()
        button.text('Сохранено').prop('disabled', yes)
        $.post('/api/interview/save_interview', {
            interview: @model.toJSON()
          }, ->
          window.setTimeout(->
            button.text(oldText).prop('disabled', no)
          , 3000)
        , 'json')
    })
)
