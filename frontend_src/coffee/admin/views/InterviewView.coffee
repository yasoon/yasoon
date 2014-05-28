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
        if not @interviewsQuestionView?
          @interviewsQuestionView = new InterviewsQuestionsView({
            collection: @model.questions
          })
        else
          @interviewsQuestionView.delegateEvents()
        @$('#questionList').append(@interviewsQuestionView.render().$el)

      deleteInterview: ->

      addQuestion: (event) ->
        event.preventDefault()
        text = @$('#add')
        @model.questions.add({
          text: text.val()
        })
        text.val('')

      saveInterview: (event) ->
        event.preventDefault()
        $.post('/api/interview/save_interview', {
          interview: @model.toJSON()
        }, (data) ->
          console.log(event, @model, data)
        , 'json')


    })
)
