define(
  [
    'text!templates/mainPageNavTpl.htm'
    'views/MainPageHistoryView'
    'views/EmptyView'
    'views/PostsPreviews'
    'models/MainPageHistoryModel'
    'collections/PostsPreviewsList'
    'backbone'
  ]
(
  mainPageNavTpl
  MainPageHistoryView
  EmptyView
  PostsPreviews
  MainPageHistoryModel
  PostsPreviewsList
) ->
  Backbone.View.extend({
    className: 'main-layout'

    tagName: 'section'

    events: ->
      'click nav.navigate a': 'changeMainPageView'

    template: _.template(mainPageNavTpl)

    initialize: ->
      @createMainPageHistory()
      $(window)
        .off('scroll.app:main')
        .on('scroll.app:main', @fixedPostionOnScroll)
      @

    fixedPostionOnScroll: (event) ->
      pageOffsetTop = $(event.currentTarget).scrollTop()
      layoutOffsetTop = $('.main-layout, .page-layout').offset().top
      if layoutOffsetTop and pageOffsetTop > layoutOffsetTop
        $('.navigate, .postinfo').addClass('fixed')
      else
        $('.navigate, .postinfo').removeClass('fixed')

    createMainPageHistory: ->
      $.get('/api/post/get_daystory',
      (data) =>
        if data.error is 'true'
          if not @mainPageHistoryView?
            @emptyView = new EmptyView({
              message: data.errorText
            })
          else
            @emptyView.delegateEvents()
          @$el
            .find('.mainPage-content')
            .append(@emptyView.render().$el)
        else
          if not @emptyView?
            @mainPageHistoryView = new MainPageHistoryView({
              model: new MainPageHistoryModel(data)
            })
          else
            @mainPageHistoryView.delegateEvents()
          @$el
            .find('.mainPage-content')
            .append(@mainPageHistoryView.render().$el)
      , 'json')

    createMainPageStories: ->
      $.get('/api/post/get_best_posts',
      (data) =>
        if not @postsPreviews?
          @postsPreviews = new PostsPreviews({
            collection: new PostsPreviewsList(data)
          })
        else
          @postsPreviews.delegateEvents()
        @$el
          .find('.mainPage-content')
          .append(@postsPreviews.render().$el)
      , 'json')

    changeMainPageView: (event) ->
      event.preventDefault()
      $this = $(event.currentTarget)
      $mainLayout = $('.main-layout')
      $("html, body").animate({
        scrollTop: $mainLayout.offset().top
      }, 'fast')
      if not $this.hasClass('active')
        $this.addClass('active').siblings().removeClass('active')
        @$el.find('.mainPage-content').empty()
        tab = $this.attr('href').replace('#', '')
        @[tab].call(@)

    render: ->
      @$el.empty().append(@template())
      @
  })
)