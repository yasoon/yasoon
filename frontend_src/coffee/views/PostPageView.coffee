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
    class PostPageView extends Backbone.View
      tagName: 'section'

      className: 'page-layout row'

      events: ->
        'click .like-this': 'addLike'

      initialize: (options) ->
        @model = new PostViewModel()
        @model.set({'postId': options.id})
        @setHandlers()
        @getPostData()

      setHandlers: ->
        @listenTo(@model, 'change:postData', @getAuthorData)
        @listenTo(@model, 'change:userData', @createPostAuthor)

      getPostData: ->
        $.post("/api/post/getPost", {postid: @model.get('postId')}, (data) => @model.set('postData', data[0]))

      getAuthorData: ->
        author = @model.get('postData')
        $.post("/api/author/getAuthorInfo", {author_id: author.authorId}, (data) => @model.set('userData', data[0]))

      createPostAuthor: ->
        authorModel = new PostAuthorModel(@model.get('userData'))
        if not @postAuthor? then @postAuthor = new PostAuthorModelView({model: authorModel}) else @postAuthor.delegateEvents()
        @$el.append(@postAuthor.render().$el)
        @createPostContent()

      createPostContent: ->
        postModel = new PostPageModel(@setPostModel())
        if not @postPage? then @postPage = new PostPageModelView({model: postModel}) else @postPage.delegateEvents()
        @$el.append(@postPage.render().$el)

      setPostModel: ->
        @model.set('text', @changePostText())
        _.extend({}, @model.get('postData'), {'questionCount': @model.get('userData').answers_count})

      changePostText: ->
        article = $(@model.get('text')).find('article')

      addLike: (event) ->
        event.preventDefault()
        $.post('/api/post/add_likes', {'postlike': @likeData()}, (data) => @changeLikeCount(data))

      likeData: ->
        _.extend({}, {postId: @model.get('postId'), type: 'add'})

      changeLikeCount: (data) ->
        if not data.error and data.count then @$el.find('.like-this .counter').text(data.count)
)