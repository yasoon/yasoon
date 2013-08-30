define [
         'views/base/editable'
         'JST'
         'categories'
         'jquery_hotkeys'
         'bootstrap'
         'bootstrap_wysiwyg'
         'helper'
         'jqueryui'
], (EditableView, JST, categories, hotkeys, bootstrap, bootstrapWysiwyg, helper, jqueryui) ->
  'use strict'

  class AuthorPostsPostView extends EditableView
    className: 'post'

    templateName: 'author_posts_post'

    modes: ['active', 'preview', 'passive', 'full']

    addCallback: ->
      @publishEvent 'redirect', "author/#{@model.authorId}/posts"

    updateCallback: ->
      @publishEvent 'redirect', "author/#{@model.authorId}/posts"

    getTemplateData: ->
      cats = {}
      for key, cat of categories
        cats[key] = cat if key >  0

      data = super
      data.categories =  cats
      data

    render: ->
      super
      setTimeout(->
          @activatedWysiwyg()
      , 600)

    activatedWysiwyg: ->
      $( '#editor' ).wysiwyg().bind( 'DOMNodeInserted DOMNodeRemoved keyup', ->
            $( '#cleartxt' ).html( strip_tags($( '#editor' ).html()) )
      )