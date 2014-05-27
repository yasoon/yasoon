define(
  [
    'views/LayoutView'
    'admin/AdminPageView'
    'backbone'
  ]
  (
    LayoutView
    AdminPageView
  ) ->
    class Controller
      index: ->
        $('body').removeClass().addClass('admin')
        @adminPageView = new AdminPageView
        LayoutView.contentRegion.$el
          .empty()
          .append(@adminPageView.render().$el)
        @adminPageView.delegateEvents()
        @

    return new Controller()
)