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
      _.extend {}, super,
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
      , 'json')

    createInterviewsList: (data) ->
      if not @postInterviews?
        @postInterviews = new PostInterviews({
          collection: new InterviewCollection(data)
        })
      @ui.interviews.append(@postInterviews.render().$el)
      @$('.editor').redactor('sync')

    deletePost: (event) ->
      event.preventDefault()
      $.post('/api/post/deletePost', {
        post_id: @options.id
      }, (data) ->
        window.location = '/#/author/posts/'
      )

)