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
        'click :submit':            'savePost'
      bindings:
        '#description':             'description'
        '#title':                   'title'

      className:                    'page-layout m-page'
      tagName:                      'section'

      template:                     _.template(writePostTpl)

      initialize: (options) ->
        interviewId = options.id or 1
        @getInterviewQuestions(interviewId)
        @handler()

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        @listenTo(@model, 'change:categoriesList', @createInterviewsList)
        @listenTo(@model, 'change:interviewQuestions', @render)

      render: ->
        @$el.empty().append(@template({'maxLength': 255}))
        @onRender()
        @

      onRender: ->
        @createCategoryList()

      createCategoryList: ->
        @model.set('categoriesList', Window.config.category)
        if not @postCategories?
          @postCategories = new PostCategories({collection: new CategoryCollection(@model.get('categoriesList'))})
        @$('#categories').append(@postCategories.render().$el)

      getInterviewQuestions: (id) ->
        $.get("/api/interview/questions/#{id}", (data) => @model.set('interviewQuestions', data))

      createInterviewsList: ->
        if not @postInterviews?
          @postInterviews = new PostInterviews({collection: new InterviewCollection(@model.get('interviewQuestions'))})
        @$('#questionsList').append(@postInterviews.render().$el)

        @afterRender()

      afterRender: ->
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        @$('.sortable ul').sortable({cancel: '.form-group'})
        @stickit()

      savePost: (event) ->
        event.preventDefault()
        @hideErrors()
        @model.set({
          'text': @postInterviews.createFullText()
          'category': @postCategories.checkedCategories()
        })
        console.log(@model.isValid(), @model.validationError)
        if not @model.isValid()
          @showErrors(@model.validationError)
        else
          $.post('/api/post/savePost', {postData: @model.toJSON()}, (data) -> Backbone.Mediator.publish('post:submitted', data.postId))

      showErrors: (errors) ->
        _.each(errors, (error) =>
          @$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error')
        )

      hideErrors: ->
        @$('.di').removeClass('has-error').addClass('has-success')
)