define(
  [
    'text!templates/writePostFormTpl.htm'
    'views/PostCategories'
    'views/PostInterviews'
    'views/ValidationView'
    'collections/CategoryCollection'
    'collections/InterviewCollection'
    'editor'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
    'jqueryUi'
  ]
  (
    writePostTpl
    PostCategories
    PostInterviews
    ValidationView
    CategoryCollection
    InterviewCollection
  ) ->
    class WritePostPage extends ValidationView
      events: ->
        'click button:submit':      'savePost'
      bindings:
        '#description':             'description'
        '#title':                   'title'

      className:                    'page-layout m-page'
      tagName:                      'section'

      template:                     _.template(writePostTpl)

      initialize: (options) ->
        @pageId = options.id or 1
        @model.set('maxLength', 255)
        @handler()

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)

      ui: ->
        @.ui =
          counter:      @$('.counter')
          categories:   @$('#categoryList')
          interviews:   @$('#questionsList')

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      onRender: ->
        @ui()
        @createCategoryList()
        @createInterviewsList()
        @stickit()
        $('.collapse').collapse()

      createCategoryList: ->
        if not @postCategories?
          @postCategories = new PostCategories({
            collection: new CategoryCollection(Window.config.category)
          })
        @ui.categories.append(@postCategories.render().$el)

      createInterviewsList: ->
        $.get("/api/interview/questions/#{@pageId}"
        , (data) =>
          if not @postInterviews?
            @postInterviews = new PostInterviews({
              collection: new InterviewCollection(data)
            })
          @ui.interviews.append(@postInterviews.render().$el)
          @$('.editor').redactor('sync')
          @$('.sortable ul').sortable({
            cancel: '.form-group'
          })
        , 'json')

      savePost: (event) ->
        event.preventDefault()
        categories = @postCategories.checkedCategories()
        fullText = @postInterviews.createFullText()
        if fullText
          @model.set({
            'text': fullText
            'category': categories
          })
          $.post('/api/post/savePost', {
              postData: @model.toJSON()
            }, (data) ->
            Backbone.Mediator.publish('post:submitted', data.postId)
          )
)