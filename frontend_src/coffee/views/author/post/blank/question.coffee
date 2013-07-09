define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AuthorPostBlankQuestionView extends EditableView
    className: 'author_post_blank_question'

    templateName: 'author_post_blank_question'

    modes: ['button', 'passive', 'active', 'preview']

