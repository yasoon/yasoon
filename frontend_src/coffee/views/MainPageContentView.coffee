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
    class MainPageContentView extends Backbone.View
      className: 'main-layout'

      tagName: 'section'

      events: ->
        'click nav.navigate a': 'changeMainPageView'

      template: _.template(mainPageNavTpl)

      initialize: ->
        @createMainPageStories()
        $(window).off('scroll.app:main').on('scroll.app:main', @fixedPositionOnScroll)
        @

      fixedPositionOnScroll: (event) ->
        pageOffsetTop = $(event.currentTarget).scrollTop()
        layoutOffsetTop = $('.main-layout, .page-layout').offset().top
        if layoutOffsetTop and pageOffsetTop > layoutOffsetTop
          $('.navigate, .postinfo').addClass('fixed')
        else
          $('.navigate, .postinfo').removeClass('fixed')

      createMainPageHistory: ->
        $.get('/api/post/get_daystory', (data) => if data.error is 'true' then @emptyDayStory(data) else  @dayStory(data))

      emptyDayStory: (data) ->
        emptyView = new EmptyView({message: data.errorText})
        if not @mainPageHistoryView? then @emptyView = emptyView else @emptyView.delegateEvents()
        @$el.find('.mainPage-content').append(@emptyView.render().$el)

      dayStory: (data) ->
        dayStory = new MainPageHistoryView({model: new MainPageHistoryModel(data)})
        if not @mainPageHistoryView? then @mainPageHistoryView = dayStory else @mainPageHistoryView.delegateEvents()
        @$el.find('.mainPage-content').append(@mainPageHistoryView.render().$el)

      createMainPageStories: ->
        $.get('/api/post/get_best_posts', (data) => @postPreviews(data))

      postPreviews: (data) ->
        postPreviews = new PostsPreviews({collection: new PostsPreviewsList(data)})
        if not @postsPreviews? then @postsPreviews = postPreviews else @postsPreviews.delegateEvents()
        @$el.find('.mainPage-content').append(@postsPreviews.render().$el)

      changeMainPageView: (event) ->
        event.preventDefault()
        $this = $(event.currentTarget)
        $mainLayout = $('.main-layout')
        $("html, body").animate({scrollTop: $mainLayout.offset().top}, 'fast')
        if not $this.hasClass('active')
          $this.addClass('active').siblings().removeClass('active')
          @$el.find('.mainPage-content').empty()
          @[$this.attr('href').replace('#', '')].call(@)

      render: ->
        @$el.empty().append(@template())
        @
        
)