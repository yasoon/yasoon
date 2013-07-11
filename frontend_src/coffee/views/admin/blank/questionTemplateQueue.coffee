define [
         'views/base/queue'
         'JST'
         'views/admin/blank/questionTemplate'
         'models/admin/blank/questionTemplate'
], (QueueView, JST, QuestionTemplateView, QuestionTemplateModel) ->
  'use strict'

  class AdminBlankQuestionTemplateQueueView extends QueueView
    className: 'questionTemplateQueue'

    templateName: 'admin_blank_question_template_queue'

    sortable: true

    createElementView: (model) ->
      new QuestionTemplateView(model: model)