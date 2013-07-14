define [
         'views/base/queue'
         'JST'
         'views/author/questions/question'
], (QueueView, JST, QuestionView) ->
  'use strict'

  class AuthorQuestionsQuestionQueueView extends QueueView
    className: 'authorQuestionsQuestionQueue'

    templateName: 'author_questions_question_queue'

    sortable: true

    createElementView: (model) ->
      new QuestionView(model: model)