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
      image = _.getContent(12)
      @$el
        .html(@template())
        .css({
          'background-image': "url(frontend#{image})",
          'background-size': "cover"
        })
      @
  })
)