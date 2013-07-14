define [
         'views/base/page-view'
         'JST'
         'views/footer'
         'views/header/author_newPost'
         'views/author/post'
         'models/author/post'
], (PageView, JST, FooterView, HeaderView, PostView, Post) ->
  'use strict'

  class AuthorNewPostView extends PageView
    className: 'postPage'

#    initialize: (params) ->
#      super
#      @authorId = params.authorId
#
    regions:
      '#post': 'post'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'
    templateName: 'author_newPost-page'

    events:
      'click #toInterview': ->
        @publishEvent 'redirect', "#posts/new_interview"
      'click #toPost': ->
        @publishEvent 'redirect', "#posts/new"


    render: ->
      super
      footerView = new FooterView()
      headerView = new HeaderView()
      newPost    = new PostView(model: new Post)
      newPost.region = 'post'
      newPost.setActiveMode()
