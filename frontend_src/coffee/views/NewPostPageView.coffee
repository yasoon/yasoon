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
        'click .js-cancel':         'cancelPost'
      bindings:
        '#description':             'description'
        '#title':                   'title'
      className:                    'page-layout m-page'
      tagName:                      'section'

      template:                     _.template(writePostTpl)

      interviewsTemplate:           _.template(postInterviewTpl)

      initialize: (options) ->
        if not options.isUser then $('#js-login').trigger 'click'
        @getDefaultInterview(options.id)
        @model.set({'maxLength': 255})
        @handler()

      getDefaultInterview: (id) ->
        $.get("/api/interview/get_interviews", (data) =>
          array = _.where(data, {id: parseInt(id)})
          arrayName = _.where(data, {name: name})
          @model.set('interviewId', if array.length then id else data[1]['id'])
          console.log(data)
          @model.set('interviewTitle', data[@model.get('interviewId')]['name'])
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
        @$('input:text:visible:first').focus()

      createCategoryList: ->
        @model.set('categoriesList', window.config.category)
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
        @stickit()

      savePost: (event) ->
        event.preventDefault()
        @hideErrors()
        @model.set({'text': @createAnswersArray(), 'category': @postCategories.checkedCategories(), 'description': @getDescription()})
        if @model.isValid() then @sendPostData() else @showErrors(@model.validationError)

      createAnswersArray: ->
        answers = []
        $('#questionsList .form-group').each((iterator, item) => if $(item).find('.redactor_editor').text().length then answers.push(@getObj(iterator, item)))
        answers

      getObj: (iterator, item) ->
        {'id': iterator, 'text': $(item).find('.redactor_editor').html()}

      getDescription: ->
        if @model.get('description')? then @model.get('description') else ''

      sendPostData: ->
        $.post('/api/post/savePost', {postData: @model.toJSON()}, (data) => @changeLocation(data))

      changeLocation: (data) ->
        window.location = "#/post/#{data.postId}/"
        window.reload = true

      showErrors: (errors) ->
        _.each(errors, (error) => @showError(error))
        
      showError: (error) ->
        @$el.find('#' + error.name).closest('.di').removeClass('has-success').addClass('has-error')
        @checkPosition()

      checkPosition: ->
        topPosition = @$el.find('.has-error').offset().top
        if topPosition < $(window).scrollTop() then $("html, body").animate({scrollTop: topPosition - 20}, '500', 'swing');

      hideErrors: ->
        @$('.di').removeClass('has-error').addClass('has-success')

      confirmAction: ->
        window.confirm(_.getContent(42))

      cancelPost: (event) ->
        event.preventDefault()
        if @confirmAction() then window.location = "/#/speaker/#{window.config.userId}/posts/"

)