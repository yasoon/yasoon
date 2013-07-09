define [
         'views/base/page-view'
         'JST'
         'views/footer'
         'views/header/author_newPost'
         'views/author/post'
         'models/author/post'
], (PageView, JST, FooterView, HeaderView, PostView, Post) ->
  'use strict'

  class AuthorNewPostInterviewPageView extends PageView
    className: 'postPage'

#    initialize: (params) ->
#      super
#      @authorId = params.authorId
#
    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'
    templateName: 'author_newPostInterview-page'

    events:
      'click #toInterview': ->
        @publishEvent 'redirect', "#posts/new_interview"
      'click #toPost': ->
        @publishEvent 'redirect', "#posts/new"


    render: ->
      super
      footerView = new FooterView()
      headerView = new HeaderView()

