define(
  [
    'text!templates/writePostFormTpl.htm'
    'text!templates/postInterviewTpl.htm'
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
    postInterviewTpl
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

      interviewsTemplate:           _.template(postInterviewTpl)

      initialize: (options) ->
        @getDefaultInterview(options.id)
        @model.set({'maxLength': 255})
        @handler()

      getDefaultInterview: (id) ->
        $.get("/api/interview/get_interviews", (data) =>
          array = _.where(data, {id: parseInt(id)})
          @model.set('interviewId', if array.length then id else data[0]['id'])
        )

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        @listenTo(@model, 'change:categoriesList', @createInterviewsList)
        @listenTo(@model, 'change:interviewQuestions', @render)
        @listenTo(@model, 'change:interviewId', @getInterviewQuestions)

      render: ->
        @$el.empty().append(@template(@model.toJSON()))
        @onRender()
        @

      onRender: ->
        @createCategoryList()

      createCategoryList: ->
        @model.set('categoriesList', Window.config.category)
        category = new CategoryCollection(@model.get('categoriesList'))
        if not @postCategories? then @postCategories = new PostCategories({collection: category})
        @$('#categories').append(@postCategories.render().$el)

      getInterviewQuestions: ->
        $.get("/api/interview/questions/#{@model.get('interviewId')}", (data) => @model.set('interviewQuestions', data))

      createInterviewsList: ->
        interviews = new InterviewCollection(@model.get('interviewQuestions'))
        if not @postInterviews? then @postInterviews = new PostInterviews({collection: interviews})
        @$('#questionsList').append(@postInterviews.render().$el)
        @afterRender()

      afterRender: ->
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        @$('.sortable ul').sortable({cancel: '.form-group'})
        @stickit()

      savePost: (event) ->
        event.preventDefault()
        @hideErrors()
        description = @getDescription()
        @model.set({'text': @createFullText(), 'category': @postCategories.checkedCategories(), 'description': description})
        if @model.isValid() then @sendPostData() else @showErrors(@model.validationError)

      createFullText: ->
        fullTextContainer = $('<div></div>')
        $('#questionsList > .ui-sortable > li').each((iterator, item) => fullTextContainer.append(@getText(iterator, item)))
        fullTextContainer.html()

      getText: (iterator, item) ->
        text = if $(item).find('.redactor_editor').text().length then $(item).find('.redactor_editor').html() else 'Пользователь не ответил на этот вопрос'
        @interviewsTemplate({'id': iterator, 'text': text, 'question': $(item).find('.a-quertion').html()})

      getDescription: ->
        if @model.get('description')? then @model.get('description') else ''

      sendPostData: ->
        $.post('/api/post/savePost', {postData: @model.toJSON()}, (data) => @changeLocation(data))

      changeLocation: (data) ->
        window.location = "#/post/#{data.postId}/"
        window.location.reload(true)

      showErrors: (errors) ->
        _.each(errors, (error) => @$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error'))

      hideErrors: ->
        @$('.di').removeClass('has-error').addClass('has-success')
)