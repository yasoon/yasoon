define(
  [
    'text!templates/headerTpl.htm'
    'views/LoginPopUpView'
    'views/HeaderLoginView'
    'views/HeaderLogedView'
    'models/UserLoginModel'
    'models/userModel'
    'backbone'
  ]
(
  headerTpl
  LoginPopUpView
  HeaderLoginView
  HeaderLogedView
  UserLoginModel
  userModel
) ->
  HeaderRegionView = Backbone.View.extend({
    template: _.template(headerTpl)
    
    className: 'inside'

    events: ->
      'click #login-trigger': 'loginPopUp'
    
    loginPopUp: (event) ->
      event.preventDefault()
      if not @loginpopUpView?
        @loginpopUpView = new LoginPopUpView({
          model: new UserLoginModel()
        })
      else
        @loginpopUpView.delegateEvents()
      $('body').append(@loginpopUpView.render().$el)
    
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
    })
)