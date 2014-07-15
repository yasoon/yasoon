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
      authorNavigation = new AuthorNavigationView({page: @options.page})
      if not @authorNavigation? then @authorNavigation = authorNavigation else @authorNavigation.delegateEvents()
      @$el.append(@authorNavigation.render().$el)
)