define(
  [
    'text!templates/speakerInfoTpl.htm'
    'views/LoginPopUpView'
    'models/userModel'
    'models/PostAuthorModel'
    'backbone'
    'mediator'
  ]
  (
    speakerInfoTpl
    LoginPopUpView
    userModel
    PostAuthorModel
  ) ->
    class PostAuthorModelView extends Backbone.View
      subscriptions:
        'question:answered':  'updateQuestionCounter'

      events: ->
        'click .js-follow':   'followSpeaker'

      tagName:                'aside'
      className:              'postinfo'

      template:               _.template(speakerInfoTpl)

      initialize: ->
        @author = Window.config.userId
        @model.set('isAuthor', @isAuthor())

      render: ->
        @$el.html(@template(@model.toJSON()))
        @

      isAuthor: ->
        @author is parseInt(@model.get('id'))

      followSpeaker: (event) ->
        event.preventDefault()
        if typeof @author is "number" then @setFriends(event) else @showPopUp()

      setFriends: (event) ->
        $.post('/api/author/setFriends', {authorId: @author, friend: @model.get('id')}, (data) => @changeButtonType(data.type, @$(event.currentTarget)))

      changeButtonType: (type, target) ->
        if type is 'add' then target.addClass('color-red').text('Отписаться') else target.removeClass('color-red').text('Подписаться')
        @changeStatus(type)

      changeStatus: (type) ->
        if type is 'add' then @addToFriends() else @removeFromFriends()

      addToFriends: ->
        Window.config.friends.push({'id': @model.get('id'), 'date': new Date()})

      removeFromFriends: ->
        Window.config.friends = $.grep(Window.config.friends, (object) => object.id isnt @model.get('id'))

      showPopUp: ->
        userModel = new PostAuthorModel()
        if not @loginpopUpView? then @loginpopUpView = new LoginPopUpView({model: userModel}) else @loginpopUpView.delegateEvents()
        $('body').append(@loginpopUpView.render().$el)

      updateQuestionCounter: ->
        oldValue = @model.get('answers_count')
        @model.set('answers_count', oldValue += 1)
        @render()
)