define [
  'views/base/view'
  'JST'
], (View, JST) ->
  'use strict'

  class HeaderAuthorNewPost extends View
    # Automatically render after initialize.
    autoRender: true
    className: 'inside'
    region: 'header'

    templateName: 'header_author_newPost'

    events:
      'click #loginButton': ->
        @publishEvent 'login'
      'click #logoutButton': ->
        @publishEvent 'logout'

    initialize: ->
      super


    getTemplateData: ->
      {authorized: @authorized}