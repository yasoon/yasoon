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

    onRender: ->
      @stickit()
      @ui()
      @createCategoryList()
      $('.collapse').collapse()

    initialize: (options) ->
      @options = options || {}

      super
      $.post("/api/post/getPost", {
        postid: @options.id
      }, (data) =>
        data = _.extend({}, data[0], {maxLength: 255})
        @setPostData(data)
      , 'json')

    setPostData: (data) ->
      @model.set(data)
      text = []
      $(@model.get('text')).each( (iterator) ->
        value = []
        value['id'] = iterator
        value['text'] = $(@).find('.question_content').text()
        value['question'] = $(@).find('.questionTitle').text()
        text.push(value)
      )
      _.each(@model.get('tags'), (item) =>
        @$('input:checkbox').eq(item).prop('checked', yes)
      )
      @createInterviewsList(text)

    createInterviewsList: (data) ->
      if not @postInterviews?
        @postInterviews = new PostInterviews({
          collection: new InterviewCollection(data)
        })
      @ui.interviews.append(@postInterviews.render().$el)
      @$('.editor').redactor({
        imageUpload: '/api/post/upload_image',
      }, 'sync')

    deletePost: (event) ->
      event.preventDefault()
      $.post('/api/post/deletePost', {
        post_id: @options.id
      }, (data) ->
        window.location = '/#/author/posts/'
      )

    updatePost: (event) ->
      event.preventDefault()
      fullText = @postInterviews.createFullText()
      categories = @postCategories.checkedCategories()
      if fullText
        @model.set({
          'text': fullText
          'category': categories
        })
        $.post('/api/post/update', {
          postData: @model.toJSON()
        }, (data) ->
          Backbone.Mediator.publish('post:submitted', data.postId)
        )

)