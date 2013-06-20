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
      console.log 'qwe'
      @model.questions.splice(0, 0, question)
      @render()

    deleteQuestion: (question) ->
      for qst, key in @model.questions
        if qst.data.id is question.data.id
          @model.questions.splice(key, 1)
          break

      @$el.find("##{question.data.id}").remove()


    getTemplateData: ->
      {questions: @model.questions, authorized: @authorized, isNotAuthorsPage: not @authorized}

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
      @manageAuthAreas()
      @addSortable()

    render: ->
      super

      @newQuestionView = new NewQuestionView(model: new Question(authorId: @model.authorId))
      @views = []
      for question in @model.questions
        @views.push (new QuestionView(model: question)).setRegion('list').setPassiveMode()

      @manageAuthAreas()
      @addSortable()



