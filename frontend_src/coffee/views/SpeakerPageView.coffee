define(
  [
    'views/PostAuthorModelView'
    'views/SpeakerNavigationView'
    'views/SpeakerContentView'
    'views/SpeakerWritePostButtonView'
    'models/PostAuthorModel'
    'backbone'
  ]
  (
    PostAuthorModelView
    SpeakerNavigationView
    SpeakerContentView
    SpeakerWritePostButtonView
    PostAuthorModel
  ) ->
    class SpeakerPage extends Backbone.View
      tagName:        'section'
      className:      'page-layout'

      initialize: (options) ->
        @model.set({
          id: options.id
          page: options.page
        })
        @listenTo(@model, 'change:authorData', @createSpeakerInfo)
        @getSpeakerInfo()

      getSpeakerInfo: ->
        $.post("/api/author/getAuthorInfo", {author_id: @model.get('id')}, (data) => @model.set('authorData', data[0]))

      createSpeakerInfo: ->
        if not @postAuthorModelView?
          @postAuthorModelView = new PostAuthorModelView({model: new PostAuthorModel(@model.get('authorData'))})
        else
          @postAuthorModelView.delegateEvents()
        @$el.append(@postAuthorModelView.render().$el)
        @createNavigation()

      createNavigation: ->
        if not @speakerNavigationView?
          @speakerNavigationView = new SpeakerNavigationView({
            id: @model.get('id')
            page: @model.get('page')
          })
        else
          @speakerNavigationView.delegateEvents()
        @$el.append(@speakerNavigationView.render().$el)
        @createWritePostButton()

      createWritePostButton: ->
        if Window.config.userId is parseInt(@model.get('id')) and @model.get('page') is 'posts' then @renderButton()
        @createSpeakerContent()

      renderButton: ->
        if not @speakerWritePostButtonView?
          @speakerWritePostButtonView = new SpeakerWritePostButtonView()
        else
          @speakerWritePostButtonView.delegateEvents()
        @$el.append(@speakerWritePostButtonView.render().$el)

      createSpeakerContent: ->
        author = @model.get('authorData')
        if not @speakerContentView?
          @speakerContentView = new SpeakerContentView({
            answers: author.answers
            posts: author.posts
            page: @model.get('page')
            id: @model.get('id')
          })
        else
          @speakerContentView.delegateEvents()
        @$el.append(@speakerContentView.render().$el)
)