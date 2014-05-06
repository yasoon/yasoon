define(
  [
    'text!templates/mainPageHeadingTpl.htm'
    'backbone'
  ]
(
  mainPageHeadingTpl
) ->
  Backbone.View.extend({
    className: 'mainPage-intro'
    template: _.template(mainPageHeadingTpl)
    render: ->
      @$el
        .html(@template())
        .css({
          'background-image': 'url(frontend/img/i6.jpg)'
        })
      @
  })
)