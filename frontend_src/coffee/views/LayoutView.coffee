define(
  [
    'views/HeaderRegionView'
    'views/ContentRegionView'
    'backbone'
  ]
(
  HeaderRegionView
  ContentRegionView
) ->

  LayoutView = Backbone.View.extend({
    initialize: ->
      @headerRegion = new HeaderRegionView()
      @contentRegion = new ContentRegionView({
        el: @$('.main_block')
      })

      @$('#header')
        .empty()
        .append(
          @headerRegion.render().$el
        )
      @
  })

  return new LayoutView({
    el: 'body'
  })
)