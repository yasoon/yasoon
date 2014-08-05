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
        'click .js-delete': 'deletePost'

      initialize: (options) ->
        @options = options || {}
        @handler()
        $.post("/api/post/getPost", {postid: @options.id}, (data) => @setPostData(_.extend({}, data[0], {maxLength: 255})))

      handler: ->
        @listenTo(@model, 'change:description', @symbolsCounter)
        @listenTo(@model, 'change:categoriesList', @createInterviewsList)
        @listenTo(@model, 'change:formattedText', @render)

      setPostData: (data) ->
        @model.set(data)
        @model.set('category', @model.get('tags'))
        text = []
        $(@model.get('text')).each( (iterator) -> text.push({'id': iterator, 'text': $(@).find('.question_content').html(), 'question': $(@).find('.questionTitle').html()}))
        @model.set('formattedText', text)

      createCategoryList: ->
        super
        @checkCategories()

      checkCategories: ->
        console.log(@model.get('category'))
        _.each(@model.get('category'), (item) => @$('input:checkbox').eq(item - 1).prop('checked', yes))        

      createInterviewsList: ->
        interviews = new InterviewCollection(@model.get('formattedText'))
        if not @postInterviews? then @postInterviews = new PostInterviews({collection: interviews})
        $('#questionsList').html(@postInterviews.render().$el)
        @afterRender()

      afterRender: ->
        @$('.editor').redactor({imageUpload: '/api/post/upload_image'})
        @$('.sortable ul').sortable({cancel: '.form-group'})
        @stickit()

      deletePost: (event) ->
        event.preventDefault()
        $.post('/api/post/deletePost', {post_id: @options.id}, () => window.location = "/#/speaker/#{@model.get('authorId')}/posts/")

      updatePost: (event) ->
        event.preventDefault()
        @model.set({'text': @createFullText(), 'category': @postCategories.checkedCategories()})
        $.post('/api/post/update', {postData: @model.toJSON()}, (data) =>  @changeLocation(data))

      changeLocation: (data) ->
        window.location = "#/post/#{data.postId}/"
        window.location.reload(true)
)