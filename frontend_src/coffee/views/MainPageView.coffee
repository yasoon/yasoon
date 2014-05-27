define(
  [
    'views/MainPageHeadingView'
    'views/MainPageContentView'
    'backbone'
  ]
(
  MainPageHeadingView
  MainPageContentView
) ->
  Backbone.View.extend({
    tagName: 'section'

    initialize: ->
      @createMainPageHeading()
      @createMainPageContent()
      @

    createMainPageHeading: ->
      if not @mainPageHeadingView?
        @mainPageHeadingView = new MainPageHeadingView()
      @$el.append(@mainPageHeadingView.render().$el)

    createMainPageContent: ->
      if not @mainPageContentView?
        @mainPageContentView = new MainPageContentView()
      @$el.append(@mainPageContentView.render().$el)
  })
)