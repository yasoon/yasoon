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
  Backbone.View.extend({
    subscriptions:
      'question:answered':  'updateQuestionCounter'

    events: ->
      'click .js-follow':   'followSpeaker'

    tagName:                'aside'
    className:              'postinfo col-md-3'

    template:               _.template(speakerInfoTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

    followSpeaker: (event) ->
      event.preventDefault()
      if typeof Window.config.userId is "number"
        $.post('/api/author/setFriends', {
          authorId: Window.config.userId
          friend: @model.get('id')
        }, (data) =>
          text = if data.type is 'add' then 'Отписаться' else 'Подписаться'
          target = @$(event.currentTarget)
          target.text(text)
          if data.type is 'add' then target.addClass('color-red') else target.removeClass('color-red')
        , 'json')
      else
        if not @loginpopUpView?
          @loginpopUpView = new LoginPopUpView({
            model: new PostAuthorModel()
          })
        else
          @loginpopUpView.delegateEvents()
        $('body').append(@loginpopUpView.render().$el)

    updateQuestionCounter: ->
      oldValue = @model.get('answers_count')
      @model.set('answers_count', oldValue += 1)
      @render()

  })
)