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
        @setHandlers()
        @getData()

      getData: ->
        $.get('/statistic/get_user_notification', (data) => @setModel(data))

      setModel: (data) ->
        @model.set({'answers': $.merge(@isString(data.answers_timeline), @isString(data.new_answers)), 'posts': @isString(data.posts_timeline)})
        @clearTimelineCounters()

      clearTimelineCounters: ->
        $.get('/api/post/clearTimeline')
        $.get('/api/question/clear_answer_timeline')

      isString: (obj) ->
        if typeof obj.result isnt 'string' then obj.result else {}

      setHandlers: ->
        @listenTo(@model, 'change:answers', @createAnswersList)
        @listenTo(@model, 'change:posts', @createPostsList)

      events: ->
        'click a[data-change="tab"]': 'changeTab'

      render: ->
        @$el.empty().append(@template())
        @

      createPostsList: ->
        if _.size(@model.get('posts')) then @createPosts() else @emptyPosts()

      createPosts: ->
        @postsList = new TimelinePostsCollection(@model.get('posts'))
        if not @timelinePosts? then @timelinePosts = new TimelinePostsList({collection: @postsList}) else @timelinePosts.delegateEvents()
        @$('#posts').append(@timelinePosts.$el)

      emptyPosts: ->
        if not @postsEmptyView? then @postsEmptyView = new EmptyView({message: _.getContent(56)}) else @postsEmptyView.delegateEvents()
        @$('#posts').append(@postsEmptyView.render().$el)

      createAnswersList: ->
        if _.size(@model.get('answers')) then @createAnswers() else @emptyAnswers()

      createAnswers: ->
        @answersList = new TimelineAnswersCollection(@model.get('answers'))
        if not @timelineAnswers? then @timelineAnswers = new TimelineAnswersList({collection: @answersList}) else @timelineAnswers.delegateEvents()
        @$('#questions').append(@timelineAnswers.$el)

      emptyAnswers: ->
        if not @answersEmptyView? then @answersEmptyView = new EmptyView({message: _.getContent(56)}) else @answersEmptyView.delegateEvents()
        @$('#questions').append(@answersEmptyView.render().$el)

      changeTab: (event) ->
        event.preventDefault()
        self = @$(event.currentTarget)
        self.parent().addClass('active').siblings().removeClass('active')
        @$(self.data('target')).addClass('active').siblings().removeClass('active')
)