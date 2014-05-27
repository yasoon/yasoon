define(
  [
    'views/PostAuthorModelView'
    'views/SpeakerNavigationView'
    'views/SpeakerContentView'
    'models/PostAuthorModel'
    'backbone'
  ]
(
  PostAuthorModelView
  SpeakerNavigationView
  SpeakerContentView
  PostAuthorModel
) ->
  class SpeakerPage extends Backbone.View
    tagName: 'section'
    className: 'page-layout'

    initialize: (options) ->
      @options = {
        id: options.id
        page: options.page
      }
      @createSpeakerInfo()

    createSpeakerInfo: ->
      $.post("/api/author/getAuthorInfo", {
        author_id: @options.id
      }, (data) =>
        data = data[0]
        if not @postAuthorModelView?
          @postAuthorModelView = new PostAuthorModelView({
            model: new PostAuthorModel(data)
          })
        else
          @postAuthorModelView.delegateEvents()
        @$el.append(@postAuthorModelView.render().$el)
        @createNavigation()
        @createSpeakerContent(data.answers, data.posts)
      , 'json')

    createNavigation: () ->
      if not @speakerNavigationView?
        @speakerNavigationView = new SpeakerNavigationView({
          id: @options.id
          page: @options.page
        })
      else
        @speakerNavigationView.delegateEvents()
      @$el.append(@speakerNavigationView.render().$el)

    createSpeakerContent: (answers, posts) ->
      if not @speakerContentView?
        @speakerContentView = new SpeakerContentView({
          answers: answers
          posts: posts
          page: @options.page
          id: @options.id
        })
      else
        @speakerContentView.delegateEvents()
      @$el.append(@speakerContentView.render().$el)

)