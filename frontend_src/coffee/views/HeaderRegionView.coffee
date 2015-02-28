define(
  [
    'text!templates/headerTpl.htm'
    'views/HeaderLoginView'
    'views/HeaderLoggedView'
    'views/ReviewCategoriesView'
    'models/userModel'
    'backbone'
  ]
  (
    headerTpl
    HeaderLoginView
    HeaderLoggedView
    ReviewCategoriesView
    userModel
  ) ->
    class HeaderRegionView extends Backbone.View
    
      events: ->
        'click nav a.categoriesBtn': 'showCategories'
        
      template: _.template(headerTpl)

      className: 'inside'

      render: ->
        @$el.empty().append(@template())
        @userNav = @$('.my-nav')
        userModel.deferred.done( =>
          if typeof userModel?.get('id') is 'number' then @createLoginHeader() else @createLoggedHeader()
        )
        @

      createLoginHeader: () ->
        headerLogged = new HeaderLoggedView({model: userModel, el: @userNav})
        if not @headerLogedView? then @headerLogedView = headerLogged else @headerLogedView.delegateEvents()
        @userNav.addClass('log').empty().append(@headerLogedView.render().$el)

      createLoggedHeader: () ->
        headerLogin= new HeaderLoginView()
        if not @headerLoginView? then @headerLoginView = headerLogin else @headerLoginView.delegateEvents()
        @userNav.removeClass().empty().append(@headerLoginView.render().$el)
        
      showCategories:(event) ->
        event.preventDefault()
        @reviewCategoriesView = new ReviewCategoriesView({type: 'review'})
        $('body').append(@reviewCategoriesView.render().$el)
)