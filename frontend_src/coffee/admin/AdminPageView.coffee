define(
  [
    'text!templates/admin/adminMainPageTpl.htm'
    'admin/AdminsList'
    'admin/PostsList'
    'backbone'
    'bootstrap'
  ]
  (
    adminMainPageTpl
    AdminsList
    PostsList
  ) ->
    class AdminPageView extends Backbone.View
      template: _.template(adminMainPageTpl)

      events: ->
        'click a[data-toggle="tab"]': 'changeTab'

      render: ->
        @$el.empty().append(@template())
#        @createAdminsList()
        @createPostsList()
        @

#      createAdminsList: ->
#        @adminsList = new AdminsList()

      createPostsList: ->
        @postsList = new PostsList()

      changeTab: (event) ->
        event.preventDefault()
        $(event.currentTarget).tab('show')

)