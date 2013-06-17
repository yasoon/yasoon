define [
  'views/base/view'
  'JST'
  'views/author/question'
  'views/author/newQuestion'
  'models/author/question'
], (View, JST, QuestionView, NewQuestionView, Question) ->
  'use strict'

  class AuthorQuestionsQueue extends View
    className: 'questionsQueue'
    autoRender: true
    region: 'queue'
    regions:
      '#list': 'list'
      '#new': 'newQuestion'

    templateName: 'author_questionsQueue'

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

    softRender: ->
      for view in @views
        view.softRender()

    render: ->
      super

      @newQuestionView = new NewQuestionView(model: new Question(authorId: @model.authorId))
      @views = []
      for question in @model.questions
        @views.push (new QuestionView(model: question)).setRegion('list').setPassiveMode()



