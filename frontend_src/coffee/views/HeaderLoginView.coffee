define(
  [
    'text!templates/headerLoginTpl.htm'
    'views/LoginPopUpView'
    'models/UserLoginModel'
    'backbone'
  ]
  (
    headerLoginTpl
    LoginPopUpView
    UserLoginModel
  ) ->
    class HeaderLoginView extends Backbone.View
      template: _.template(headerLoginTpl)

      render: ->
        @$el.append(@template())
        @

      events: ->
        'click #js-login': 'loginPopUp'

      loginPopUp: (event) ->
        event.preventDefault()
        if not @loginpopUpView? then @loginpopUpView = new LoginPopUpView({model: new UserLoginModel()}) else @loginpopUpView.delegateEvents()
        $('body').append(@loginpopUpView.render().$el)
)