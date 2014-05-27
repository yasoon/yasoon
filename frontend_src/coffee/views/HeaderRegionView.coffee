define(
  [
    'text!templates/headerTpl.htm'
    'views/HeaderLoginView'
    'views/HeaderLogedView'
    'models/userModel'
    'backbone'
  ]
(
  headerTpl
  HeaderLoginView
  HeaderLogedView
  userModel
) ->
  class HeaderRegionView extends Backbone.View
    template: _.template(headerTpl)
    
    className: 'inside'
    
    render: ->
      @$el.html(@template())
      @userNav = @$('.my-nav')
      userModel.deferred.done( =>
        if typeof userModel?.get('id') is 'number'
          if not @headerLogedView?
            @headerLogedView = new HeaderLogedView({
              model: userModel
              el: @userNav
            })
          else
            @headerLogedView.delegateEvents()
          @userNav
            .addClass('log')
            .empty()
            .append(@headerLogedView.render().$el)
        else
          if not @headerLoginView?
            @headerLoginView = new HeaderLoginView()
          else
            @headerLoginView.delegateEvents()
          @userNav
            .removeClass()
            .empty()
            .append(@headerLoginView.render().$el)
      )
      @
)