define(
  [
    'views/SpeakerPageView'
    'views/AuthorNavigationView'
    'backbone'
  ]
(
  SpeakerPageView
  AuthorNavigationView
) ->
  class AuthorPage extends SpeakerPageView
    initialize: (options) ->
      @model.deferred.done(=>
        @options =
          id: @model.get('id')
          page: options.page
        @createSpeakerInfo()
      )

    createNavigation: () ->
      if not @authorNavigationView?
        @authorNavigationView = new AuthorNavigationView({
          page: @options.page
        })
      else
        @authorNavigationView.delegateEvents()
      @$el.append(@authorNavigationView.render().$el)

)