define(
  [
    'text!templates/writePostFormTpl.htm'
    'views/PostCategories'
    'views/PostInterviews'
    'views/NewPostPageView'
    'collections/CategoryCollection'
    'collections/InterviewCollection'
    'editor'
    'backbone'
    'stickit'
    'mediator'
    'bootstrap'
  ]
  (
    writePostTpl
    PostCategories
    PostInterviews
    NewPostPageView
    CategoryCollection
    InterviewCollection
  ) ->
    class WritePostPage extends NewPostPageView
      bindings:
        '#description': 'description'
        '#title': 'title'

      template: _.template(writePostTpl)

      events: ->
        'click :submit': 'updatePost'
        'click .js-delete': 'deleteCheck'

      initialize: (options) ->
        @options = options || {}
        @handler()
        $.post("/api/post/getPost", {postid: @options.id}, (data) => @setPostData(_.extend({}, data[0], {maxLength: 255})))

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        @listenTo(@model, 'change:categoriesList', @createInterviewsList)
        @listenTo(@model, 'change:interviewQuestions', @render)

      setPostData: (data) ->
        @model.set(_.extend({}, data, {'category': data.tags}))
        @getInterviewQuestions()

      createCategoryList: ->
        super
        @checkCategories()

      checkCategories: ->
        _.each(@model.get('category'), (item) => @$(':checkbox[value="'+item+'"]').prop('checked', yes))

      createInterviewsList: ->
        interviews = new InterviewCollection(@model.get('interviewQuestions'))
        if not @postInterviews? then @postInterviews = new PostInterviews({collection: interviews})
        @$('#questionsList').append(@postInterviews.render().$el)
        @setAnswers()

      setAnswers: ->
        _.each(@model.get('text'), (answer) => 
            $("[data-answer='#{answer.question_id}']").find('.editor').redactor({imageUpload: '/api/post/upload_image'}).closest('li').find('a').addClass('active')
            $("[data-answer='#{answer.question_id}']").find('.redactor_editor').html(answer.answer)
        )
        @afterRender()

      afterRender: ->
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        @stickit()

      getInterviewQuestions: ->
        $.get("/api/interview/questions/#{@model.get('interviewId')}", (data) => @model.set('interviewQuestions', data))

      confirmAction: ->
        window.confirm(_.getContent(42))

      deleteCheck: (event) ->
        event.preventDefault()
        if @confirmAction() then @deletePost()

      deletePost: ->
        $.post('/api/post/deletePost', {post_id: @options.id}, () => window.location = "/#/speaker/#{@model.get('authorId')}/posts/")

      updatePost: (event) ->
        event.preventDefault()
        @model.set({'text': @createAnswersArray(), 'category': @postCategories.checkedCategories()})
        $.post('/api/post/update', {postData: @model.toJSON()}, (data) =>  @changeLocation(data))

      changeLocation: (data) ->
        window.location = "#/post/#{data.postId}/"
        window.reload = true
)