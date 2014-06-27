define(
  [
    'views/PostPageModelView'
    'views/PostAuthorModelView'
    'models/PostPageModel'
    'models/PostAuthorModel'
    'models/PostViewModel'
    'backbone'
  ]
(
  PostPageModelView
  PostAuthorModelView
  PostPageModel
  PostAuthorModel
  PostViewModel
) ->
  Backbone.View.extend({
    tagName: 'section'

    className: 'page-layout row'

    events: ->
      'click .like-this': 'addLike'

    initialize: (options) ->
      @options = options || {}
      @model = new PostViewModel()
      @listenTo(@model, 'change:postData', @getAuthorData)
      @listenTo(@model, 'change:userData', @createPostAuthor)

      @getPostData()

    getPostData: ->
      $.post("/api/post/getPost", {postid: @options.id}, (data) => @model.set('postData', data[0]))

    getAuthorData: ->
      author = @model.get('postData')
      $.post("/api/author/getAuthorInfo", {author_id: author.authorId}, (data) => @model.set('userData', data[0]))

    createPostContent: ->
      questions = @model.get('userData')
      data = _.extend({}, @model.get('postData'), {'questionCount': questions.answers_count})
      if not @postPageModelView?
        @postPageModelView = new PostPageModelView({
          model: new PostPageModel(data)
        })
      else
        @postPageModelView.delegateEvents()
      @$el.append(@postPageModelView.render().$el)

    createPostAuthor: ->
      if not @postAuthorModelView?
        @postAuthorModelView = new PostAuthorModelView({
          model: new PostAuthorModel(@model.get('userData'))
        })
      else
        @postAuthorModelView.delegateEvents()
      @$el.append(@postAuthorModelView.render().$el)
      @createPostContent()

    addLike: (event) ->
      event.preventDefault()
      data = _.extend({}, {postId: @options.id, type: 'add'})
      $.post('/api/post/add_likes', {'postlike': data}, (data) =>
        if not data.error and data.count
          @$el.find('.like-this .counter').text(data.count)
      )
  })
)