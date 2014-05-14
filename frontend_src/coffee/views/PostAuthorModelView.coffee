define(
  [
    'text!templates/speakerInfoTpl.htm'
    'views/LoginPopUpView'
    'backbone'
  ]
(
  speakerInfoTpl
  LoginPopUpView
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'postinfo'
    template: _.template(speakerInfoTpl)
    render: ->
      @$el
        .html(@template(@model.toJSON()))
      @

    events: ->
      'click .js-follow': 'followSpeaker'

    followSpeaker: (event) ->
      event.preventDefault()
      if typeof window.userId isnt "undefined"
        $.post('/api/author/setFriends', {
          authorId: window.userId
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


  })
)