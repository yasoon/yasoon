define(
  [
    'views/PostAuthorModelView'
    'views/SpeakerNavigationView'
    'views/SpeakerContentView'
    'models/PostAuthorModel'
    'models/SpeakerContentModel'
    'backbone'
  ]
  (
    PostAuthorModelView
    SpeakerNavigationView
    SpeakerContentView
    PostAuthorModel
    SpeakerContentModel
  ) ->
    class SpeakerPage extends Backbone.View
      tagName:        'section'
      className:      'page-layout'

      initialize: (options) ->
        @model.set({id: options.id, page: options.page})
        @setListeners()
        @getSpeakerInfo()

      setListeners: ->
        @listenTo(@model, 'change:authorData', @createSpeakerInfo)

      getSpeakerInfo: ->
        $.post("/api/author/getAuthorInfo", {author_id: @model.get('id')}, (data) => @model.set('authorData', data[0]))

      createSpeakerInfo: ->
        postAuthor = new PostAuthorModel(@model.get('authorData'))
        if not @authorModel? then @authorModel = new PostAuthorModelView({model: postAuthor}) else @authorModel.delegateEvents()
        @$el.append(@authorModel.render().$el)
        @createNavigation()

      createNavigation: ->
        if not @speakerNavigationView? then @speakerNavigation() else @speakerNavigationView.delegateEvents()
        @$el.append(@speakerNavigationView.render().$el)
        @createSpeakerContent()

      speakerNavigation: ->
        @speakerNavigationView = new SpeakerNavigationView({id: @model.get('id'), page: @model.get('page')})

      createSpeakerContent: ->
        if not @speakerContentView? then @speakerContent() else @speakerContentView.delegateEvents()
        @$el.append(@speakerContentView.render().$el)

      speakerContent: ->
        speakerContent = new SpeakerContentModel()
        @speakerContentView = new SpeakerContentView({model: speakerContent, author: @model.get('authorData'), page: @model.get('page'), id: @model.get('id')})
)