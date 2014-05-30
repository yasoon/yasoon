define(
  [
    'text!templates/speakerInfoTpl.htm'
    'views/LoginPopUpView'
    'backbone'
    'mediator'
  ]
(
  speakerInfoTpl
  LoginPopUpView
) ->
  Backbone.View.extend({
    subscriptions:
      'question:answered':  'updateQuestionCounter'

    events: ->
      'click .js-follow':   'followSpeaker'

    tagName:                'aside'
    className:              'postinfo'

    template:               _.template(speakerInfoTpl)

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

    followSpeaker: (event) ->
      event.preventDefault()
      if typeof Window.config.userId isnt "undefined"
        $.post('/api/author/setFriends', {
          authorId: Window.config.userId
          friend: @model.get('id')
        }, (data) =>
          text = if data.type is 'add' then 'Отписаться' else 'Подписаться'
          @$(event.currentTarget)
            .text(text)
        , 'json')
      else
        if not @loginpopUpView?
          @loginpopUpView = new LoginPopUpView({
            model: @model
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