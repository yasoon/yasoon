define(
  [
    'text!templates/mainPageHeadingTpl.htm'
    'backbone'
    'socila-likes'
  ]
  (
    mainPageHeadingTpl
  ) ->
    class MainPageHeadingView extends Backbone.View
      className: 'mainPage-intro'
      template: _.template(mainPageHeadingTpl)
      render: ->
        @$el.html(@template()).css({'background-image': "url(frontend#{_.getContent(13)})", 'background-size': "cover"})
        @
)