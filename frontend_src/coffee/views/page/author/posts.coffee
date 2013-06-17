define [
         'views/base/page-view'
         'JST'
         'views/footer'
         'views/header/author_posts'
], (PageView, JST, FooterView, HeaderView) ->
  'use strict'

  class AuthorPostsPageView extends PageView
    className: 'postPage'

    initialize: (params) ->
      super
      @authorId = params.authorId

    regions:
      '#queue': 'queue'
      '#new': 'new'
      'footer': 'footer'
      'header': 'header'
      '#authorInfo': 'info'
    templateName: 'author_posts-page'

    events:
      'click #toStories': ->
        @publishEvent 'redirect', "#author/#{@authorId}/posts"
      'click #toAnswers': ->
        @publishEvent 'redirect', "#author/#{@authorId}/questions"


    render: ->
      super
      footerView = new FooterView()
      headerView = new HeaderView()

