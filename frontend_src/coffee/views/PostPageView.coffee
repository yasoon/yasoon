define(
  [
    'views/PostPageModelView'
    'views/PostAuthorModelView'
    'models/PostPageModel'
    'models/PostAuthorModel'
    'backbone'
  ]
(
  PostPageModelView
  PostAuthorModelView
  PostPageModel
  PostAuthorModel
) ->
  Backbone.View.extend({
    tagName: 'section'

    className: 'page-layout'

    events: ->
      'click .like-this': 'addLike'

    initialize: (options) ->
      @options = options || {}
      @createPostContent()

    addLike: (event) ->
      event.preventDefault()
      $.post('/api/post/add_likes', {
        'postlike': {
          postId: @options.id
          type: 'add'
        }
      }, (data) =>
        if not data.error and data.count
          @$el.find('.like-this .counter').text(data.count)
      )

    createPostContent: ->
      $.post("/api/post/getPost", {
        postid: @options.id
      }, (data) =>
        questionCount = $(data[0].text).find('article').prevObject.length
        data = _.extend({}, data[0], {questionCount: questionCount})
        if not @postPageModelView?
          @postPageModelView = new PostPageModelView({
            model: new PostPageModel(data)
          })
        else
          @postPageModelView.delegateEvents()
        @createPostAuthor(data.authorId)
        @$el.append(@postPageModelView.render().$el)
      , 'json')

    createPostAuthor: (id) ->
      $.post("/api/author/getAuthorInfo", {
        author_id: id
      }, (data) =>
        data = data[0]
        if not @postAuthorModelView?
          @postAuthorModelView = new PostAuthorModelView({
            model: new PostAuthorModel(data)
          })
        else
          @postAuthorModelView.delegateEvents()
        @$el.append(@postAuthorModelView.render().$el)
      ,'json')
  })
)