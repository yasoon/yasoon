define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AdminBlankQuestionTemplateView extends EditableView
    className: 'questionTemplate'

    templateName: 'admin_blank_question_template'

    modes: ['button', 'passive', 'active']

