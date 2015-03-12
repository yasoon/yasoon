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
    class MainPageView extends Backbone.View
      tagName: 'section'

      initialize: ->
        @createMainPageHeading()
        #@createMainPageContent()
        @

      createMainPageHeading: ->
        if not @mainPageHeadingView? then @mainPageHeadingView = new MainPageHeadingView()
        @$el.append(@mainPageHeadingView.render().$el)

      createMainPageContent: ->
        if not @mainPageContentView? then @mainPageContentView = new MainPageContentView()
        @$el.append(@mainPageContentView.render().$el)
)