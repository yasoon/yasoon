define [
         'views/base/editable'
         'JST'
], (EditableView, JST) ->
  'use strict'

  class AuthorPostsNewBlankQuesionView extends EditableView
    className: 'question'
    tagName: 'article'

    templateName: 'author_posts_new_blank_question'

    modes: ['passive', 'active', 'button']

    addCallback: ->
      @setMode('button')

    updateCallback: ->
      @setMode('passive')