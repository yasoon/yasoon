define(
  [
    'views/SpeakerInfoView'
    'views/SpeakerNavigationView'
    'views/SpeakerContentView'
    'models/SpeakerInfoModel'
    'backbone'
  ]
(
  SpeakerInfoView
  SpeakerNavigationView
  SpeakerContentView
  SpeakerInfoModel
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
        if not @speakerInfoView?
          @speakerInfoView = new SpeakerInfoView({
            model: new SpeakerInfoModel(data)
          })
        else
          @speakerInfoView.delegateEvents()
        @$el.append(@speakerInfoView.render().$el)
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
        })
      else
        @speakerContentView.delegateEvents()
      @$el.append(@speakerContentView.render().$el)

)