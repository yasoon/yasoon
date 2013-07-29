define [
         'views/base/queue'
         'JST'
         'views/author/posts/new/blank/question'
], (QueueView, JST, QuestionView) ->
  'use strict'

  class AuthorPostsNewBlankQuestionQueueView extends QueueView
    className: 'authorPostsNewBlankQuestionQueue'

    templateName: 'author_posts_new_blank_question_queue'

    sortable: true

    createElementView: (model) ->
      new QuestionView(model: model)