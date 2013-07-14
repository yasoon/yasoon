define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AuthorQuestionsQuesionView extends EditableView
    className: 'question'
    tagName: 'article'

    templateName: 'author_questions_question'

    modes: ['passive', 'active', 'button', 'new_active', 'sent']

    addCallback: ->
      @setMode('sent')