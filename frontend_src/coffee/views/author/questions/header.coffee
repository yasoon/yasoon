define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class AuthorQuestionsHeaderView extends View
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'author_questions_header'


