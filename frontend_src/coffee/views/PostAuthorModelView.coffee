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
        @author = window.config.userId
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
        if @$(event.currentTarget).hasClass('color-no-red') then @$(event.currentTarget).addClass('color-red').removeClass('color-no-red').text('Отписаться')
        else $.post('/api/author/setFriends', {authorId: @author, friend: @model.get('id')}, (data) => @changeButtonType(data.type, @$(event.currentTarget)))

      changeButtonType: (type, target) ->
        if type is 'add' then target.removeClass('color-red').addClass('color-no-red').text('Вы подписаны') else target.removeClass('color-red').removeClass('color-no-red').text('Подписаться')
        @changeStatus(type)

      changeStatus: (type) ->
        if type is 'add' then @addToFriends() else @removeFromFriends()

      addToFriends: ->
        window.config.friends.push({'id': @model.get('id'), 'date': new Date()})

      removeFromFriends: ->
        window.config.friends = $.grep(window.config.friends, (object) => object.id isnt @model.get('id'))

      showPopUp: ->
        userModel = new PostAuthorModel()
        if not @loginpopUpView? then @loginpopUpView = new LoginPopUpView({model: userModel}) else @loginpopUpView.delegateEvents()
        $('body').append(@loginpopUpView.render().$el)

      updateQuestionCounter: ->
        oldValue = @model.get('answers_count')
        @model.set('answers_count', oldValue += 1)
        @render()
)