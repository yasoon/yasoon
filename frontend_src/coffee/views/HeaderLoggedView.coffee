define(
  [
    'text!templates/headerLoggedTpl.htm'
    'backbone'
    'stickit'
  ]
(
  headerLoggedTpl
) ->
  class HeaderLogedView extends Backbone.View
    template: _.template(headerLoggedTpl)

    bindings:
      '#counter': 'timeline'
      '#answers': 'timeline_answers'
      '#posts': 'timeline_posts'

    initialize: ->
      $.get('/statistic/get_user_notification_count',
      (data) =>
        @model.set({
          'timeline': parseInt(data.answers_timeline_count) + parseInt(data.new_answers_count) + parseInt(data.posts_timeline_count),
          'timeline_answers': parseInt(data.answers_timeline_count) + parseInt(data.new_answers_count),
          'timeline_posts': parseInt(data.posts_timeline_count)
        })
      )

    render: ->
      @$el.append(@template(@model.toJSON()))
      @stickit()
      @

    events: ->
      'click #js-logout': 'logout'

    logout: (event) ->
      event.preventDefault()
      event.stopPropagation()
      $.post('/logout', {
      }, (data) ->
        Window.config.userId = no
        window.location.reload(true)
      )
)