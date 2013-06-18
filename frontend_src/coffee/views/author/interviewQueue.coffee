define [
  'views/base/view'
  'JST'
  'views/author/question'
  'views/author/newInterviewQuestion'
  'models/author/question'
  'jqueryui',
], (View, JST, QuestionView, NewInterviewQuestionView, Question, Sortable) ->
  'use strict'

  class AuthorQuestionsQueue extends View
    className: 'interviewQueue'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'
      '#new': 'newQuestion'

    templateName: 'author_interviewQueue'

    initialize: ->
      super
      @subscribeEvent 'questionAdded',   @addQuestion
      @subscribeEvent 'questionDeleted', @deleteQuestion

    addQuestion: (question) ->
      @model.questions.push(question)
      @render()

    deleteQuestion: (question) ->
      for qst, key in @model.questions
        if qst.data.id is question.data.id
          @model.questions.splice(key, 1)
          break

      @$el.find("##{question.data.id}").remove()


    getTemplateData: ->
      {questions: @model.questions, authorized: @authorized}

    addSortable: ->
      if @authorized
        @$el.find('#list').sortable(
          cursor: 'move'
          update: =>
            #@refreshOrder()
        )
        @$el.find('#list').sortable('enable')

      else
        @$el.find('#list').sortable('disable')

    softRender: ->
      for view in @views
        view.softRender()

      @newQuestionView.dispose()
      if @authorized
        @newQuestionView = new NewInterviewQuestionView(model: new Question(authorId: @model.authorId))

      @addSortable()


    render: ->
      super
      @views = []
      activeIsSet = false
      for question in @model.questions
        questionView =  (new QuestionView(model: question)).setRegion('list')
#        if activeIsSet is false  and question.data.answer is ''
#          questionView.setActiveMode() #открываем для редактирования первый неотвеченный вопрос
#          activeIsSet = true
#        else
        questionView.setPassiveMode()

      @views.push(questionView)

      @newQuestionView = new NewInterviewQuestionView(model: new Question(authorId: @model.authorId))

      @addSortable()
