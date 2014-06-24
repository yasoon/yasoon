define(
  [
    'text!admin/templates/adminMainPageTpl.htm'
#    'admin/views/AdminsList'
    'admin/views/PostsList'
    'admin/views/ContentsList'
    'admin/views/InterviewsList'
    'backbone'
    'bootstrap'
  ]
  (
    adminMainPageTpl
#    AdminsList
    PostsList
    ContentsList
    InterviewsList
  ) ->
    class AdminPageView extends Backbone.View
      template: _.template(adminMainPageTpl)

      events: ->
        'click a[data-change="tab"]': 'changeTab'

      render: ->
        @$el.empty().append(@template())
#        @createAdminsList()
        @createPostsList()
        @createContentList()
        @createInterviewList()
        @

#     createAdminsList: ->
#        @adminsList = new AdminsList()

      createPostsList: ->
        if not @postsList?
          @postsList = new PostsList()
        else
          @postsList.delegateEvents()
        @$('#posts').append(@postsList.$el)
        @

      createContentList: ->
        if not @contentsList?
          @contentsList = new ContentsList()
        else
          @contentsList.delegateEvents()
        @$('#content').append(@contentsList.$el)
        @

      createInterviewList: ->
        if not @interviewsList?
          @interviewsList = new InterviewsList()
        else
          @interviewsList.delegateEvents()
        @$('#interview').append(@interviewsList.$el)
        @

      changeTab: (event) ->
        event.preventDefault()
        self = @$(event.currentTarget)
        self.parent().addClass('active').siblings().removeClass('active')
        target = self.data('target')
        @$(target).addClass('active').siblings().removeClass('active')
)