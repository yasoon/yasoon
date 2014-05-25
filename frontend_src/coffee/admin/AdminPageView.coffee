define(
  [
    'text!templates/AdminMainPageTpl.htm'
    'admin/AdminsList'
    'backbone'
    'bootstrap'
  ]
  (
    AdminMainPageTpl
    AdminsList
  ) ->
    class AdminPageView extends Backbone.View
      template: _.template(AdminMainPageTpl)

      events: ->
        'click a[data-toggle="tab"]': 'changeTab'

      render: ->
        @$el.empty().append(@template())
        @createAdminsList()
        @

      createAdminsList: ->
        @adminsList = new AdminsList()

      changeTab: (event) ->
        event.preventDefault()
        $(event.currentTarget).tab('show')

)