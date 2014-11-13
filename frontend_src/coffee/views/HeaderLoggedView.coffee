define(
  [
    'text!templates/headerLoggedTpl.htm'
    'backbone'
    'stickit'
  ]
  (
    headerLoggedTpl
  ) ->
    class HeaderLoggedView extends Backbone.View
      bindings:
        '#counter':             'timeline'
        '#answers':             'timeline_answers'
        '#posts':               'timeline_posts'

      events: ->
        'click #js-logout':     'logout'

      template:                 _.template(headerLoggedTpl)

      initialize: ->
        @getTimelineData()
        window.setInterval(=>
          @getTimelineData()
        , 1000 * 30
        )

      getTimelineData: ->
        $.when($.get('/api/question/get_unanswered_question'), $.get('/statistic/get_user_notification_count'))
        .done((questions, timeline)=>
          followedAnswers = parseInt(timeline[0].answers_timeline_count)
          noFollowedAnswers = parseInt(timeline[0].new_answers_count)
          followedPosts = parseInt(timeline[0].posts_timeline_count)
          newQuestions = parseInt(questions[0].result.length)
          timeline = followedAnswers + followedPosts
          @model.set({'timeline': timeline + newQuestions, 'timeline_answers': newQuestions, 'timeline_posts': timeline})
        )

      render: ->
        @$el.append(@template(@model.toJSON()))
        @stickit()
        @

      logout: (event) ->
        event.preventDefault()
        event.stopPropagation()
        $.post('/logout', ->
          window.config.userId = no
          window.location = '/'
        )
)