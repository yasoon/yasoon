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
        @getInterviewQuestions()
        @handler()

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        @listenTo(@model, 'change:interviewQuestions', @render)

      ui: ->
        @.ui =
          counter:      @$('.counter')
          categories:   @$('#categoryList')
          interviews:   @$('#questionsList')
          collapse:     @$('.collapse')

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      onRender: ->
        @ui()
        @createCategoryList()
        @createInterviewsList()

      createCategoryList: ->
        if not @postCategories?
          @postCategories = new PostCategories({
            collection: new CategoryCollection(Window.config.category)
          })
        @ui.categories.append(@postCategories.render().$el)

      getInterviewQuestions: ->
        $.get("/api/interview/questions/#{@pageId}", (data) => @model.set('interviewQuestions', data))

      createInterviewsList: ->
        if not @postInterviews?
          @postInterviews = new PostInterviews({
            collection: new InterviewCollection(@model.get('interviewQuestions'))
          })
        @ui.interviews.append(@postInterviews.render().$el)

        @afterRender()

      afterRender: ->
        @$('.editor').redactor({
          imageUpload: '/api/post/upload_image',
        })
        @$('.sortable ul').sortable({
          cancel: '.form-group'
        })
        @stickit()
        @ui.collapse.collapse('hide')

      savePost: (event) ->
        event.preventDefault()
        @hideErrors()
        @model.set({
          'text': @postInterviews.createFullText()
          'category': @postCategories.checkedCategories()
        })
        if not @model.isValid()
          @showErrors(@model.validationError)
        else
          $.post('/api/post/savePost', {
              postData: @model.toJSON()
            }, (data) ->
            Backbone.Mediator.publish('post:submitted', data.postId)
          )
)