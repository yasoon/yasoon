define [
         'views/base/editable'
         'JST'
         'categories'
         'jquery_hotkeys'
         'bootstrap'
         'bootstrap_wysiwyg'
         'helper'
], (EditableView, JST, categories, hotkeys, bootstrap, bootstrapWysiwyg, helper) ->
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
      fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                     'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                     'Times New Roman', 'Verdana']

      fontTarget = $( '[title=Font]' ).siblings( '.dropdown-menu' )

      $.each( fonts,(idx, fontName) ->
           fontTarget.append $( '<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>' )
      )

      $( 'a[title]' ).tooltip( {container: 'body'} )

      $( '.dropdown-menu input' ).click( ->
          alert 'dsfsdf'
          return false
      ).change( ->
          $( this ).parent( '.dropdown-menu' ).siblings( '.dropdown-toggle' ).dropdown( 'toggle' );
      ).keydown( 'esc', ->
          @.value = ''
          $( @ ).change()
      );

      $( '[data-role=magic-overlay]' ).each( ->
          overlay = $( @ )
          target = $( overlay.data( 'target' ) )
          overlay.css( 'opacity', 0 ).css( 'position', 'absolute' ).offset( target.offset() ).width( target.outerWidth() ).height( target.outerHeight() );
      )

      setTimeout(->
        $( '#editor' ).wysiwyg().bind( 'DOMNodeInserted DOMNodeRemoved keyup', ->
            $( '#cleartxt' ).html( strip_tags($( '#editor' ).html()) )
        )
      , 1000)

