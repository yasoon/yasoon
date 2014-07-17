define(
  [
    'text!templates/timelinePageTpl.htm'
    'views/TimelinePostsList'
    'views/TimelineAnswersList'
    'views/EmptyView'
    'collections/TimelinePostsCollection'
    'collections/TimelineAnswersCollection'
    'backbone'
    'bootstrap'
  ]
  (
    timelinePageTpl
    TimelinePostsList
    TimelineAnswersList
    EmptyView
    TimelinePostsCollection
    TimelineAnswersCollection
  ) ->
    class TimelinePageView extends Backbone.View

      template: _.template(timelinePageTpl)

      initialize: ->
        @deferred = $.Deferred()
        $.get('/statistic/get_user_notification', (data) =>
          answers_timeline = if typeof data.answers_timeline.result isnt 'string' then data.answers_timeline.result else {}
          new_answers = if typeof data.new_answers.result isnt 'string' then data.new_answers.result else {}
          @answers = _.extend({}, answers_timeline, new_answers)
          @posts = data.posts_timeline.result
          @deferred.resolve()
        )
        $.get('/api/post/clearTimeline')

      events: ->
        'click a[data-change="tab"]': 'changeTab'

      render: ->
        @$el.empty().append(@template())
        @createPostsList()
        @createAnswersList()
        @

      createPostsList: ->
        @deferred.done( =>
          if @posts.lentgh > 0
            @postsList = new TimelinePostsCollection(@posts)
            if not @timelinePostsList?
              @timelinePostsList = new TimelinePostsList({
                collection: @postsList
              })
            else
              @timelinePostsList.delegateEvents()
            @$('#posts').append(@timelinePostsList.$el)
          else
            if not @postsEmptyView?
              @postsEmptyView = new EmptyView({message: _.getContent(56)})
            else
              @postsEmptyView.delegateEvents()
            @$('#posts').append(@postsEmptyView.render().$el)
        )

      createAnswersList: ->
        @deferred.done(=>
          if _.size(@answers) > 0
            @answersList = new TimelineAnswersCollection(@answers)
            if not @timelineAnswersList?
              @timelineAnswersList = new TimelineAnswersList({collection: @answersList})
            else
              @timelineAnswersList.delegateEvents()
            @$('#questions').append(@timelineAnswersList.$el)
          else
            if not @answersEmptyView?
              @answersEmptyView = new EmptyView({message: _.getContent(66)})
            else
              @answersEmptyView.delegateEvents()
            @$('#questions').append(@answersEmptyView.render().$el)
        )

      changeTab: (event) ->
        event.preventDefault()
        self = @$(event.currentTarget)
        self.parent().addClass('active').siblings().removeClass('active')
        target = self.data('target')
        @$(target).addClass('active').siblings().removeClass('active')
        $.get('/api/post/clearTimeline')
)