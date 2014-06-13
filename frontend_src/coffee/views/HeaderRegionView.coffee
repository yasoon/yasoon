define(
  [
    'text!templates/headerTpl.htm'
    'views/HeaderLoginView'
    'views/HeaderLoggedView'
    'models/userModel'
    'backbone'
  ]
  (
    headerTpl
    HeaderLoginView
    HeaderLoggedView
    userModel
  ) ->
    class HeaderRegionView extends Backbone.View
      template: _.template(headerTpl)

      className: 'inside'

      render: ->
        @$el.empty().append(@template())
        @userNav = @$('.my-nav')
        userModel.deferred.done( =>
          if typeof userModel?.get('id') is 'number'
            @createLoginHeader()
          else
            @createLogedHeader()
        )
        @

      createLoginHeader: () ->
        if not @headerLogedView?
          @headerLogedView = new HeaderLoggedView({
            model: userModel
            el: @userNav
          })
        else
          @headerLogedView.delegateEvents()
        @userNav.addClass('log').empty().append(@headerLogedView.render().$el)

      createLogedHeader: () ->
        if not @headerLoginView?
          @headerLoginView = new HeaderLoginView()
        else
          @headerLoginView.delegateEvents()
        @userNav.removeClass().empty().append(@headerLoginView.render().$el)

)