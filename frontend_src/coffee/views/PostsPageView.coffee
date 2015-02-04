define(
  [
    'views/CategoriesListView'
    'views/PostsPagePreviews'
    'views/PostsDescriptionView'
    'views/EmptyView'
    'collections/CategoryCollection'
    'collections/PostsPreviewsList'
    'backbone'
  ]
  (
    CategoriesListView
    PostsPreviews
    PostsDescriptionView
    EmptyView
    CategoryCollection
    PostsPreviewsList
  ) ->
    class PostsPageView extends Backbone.View
      tagName: 'section'
      className: 'page-layout'

      initialize: (options) ->
        @model.set({'category': options.category, 'sort': options.sort || 'dateSort'})
        @setListeners()
        @getCategoryList()

      setListeners: ->
        @listenTo(@model, 'change:postsList', @createPostsList)
        @listenTo(@model, 'change:description', @createPostsDescription)
        @listenTo(@model, 'change:categoryList', @createsCategoryFilter)

      getCategoryList: ->
        @model.set('categoryList', window.config.category)

      createsCategoryFilter: ->
        if not @categoryListView? then @categoryList() else @categoryListView.delegateEvents()
        @$el.append(@categoryListView.render().$el)
        @setDescription()

      getPostsList: ->
        $.get("/api/post/get_categoryPosts/#{@model.get('category')}/1/10/#{@model.get('sort')}", (data) => @checkErrors(data))

      createPostsList: ->
        if @model.get('postsList').length > 0 then @createPosts() else @emptyPosts()

      emptyPosts: ->
        if not @emptyView? then @emptyView = new EmptyView({message: _.getContent(34)}) else @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)

      setDescription: ->
        description = if parseInt(@model.get('category')) is 0 then {'name': 'все отрасли'} else _.where(@model.get('categoryList'), id: parseInt(@model.get('category')))[0]
        @model.set('description', description)

      createPostsDescription: ->
        if not @postsDescriptionView? then @postsDescription() else @postsDescriptionView.delegateEvents()
        @$el.append(@postsDescriptionView.render().$el)
        @getPostsList()

      createPosts: ->
        if not @postsPreviews? then @posts() else @postsPreviews.delegateEvents()
        @$el.append(@postsPreviews.render().$el)

      categoryList: ->
        categoryCollection = new CategoryCollection(@model.get('categoryList'))
        @categoryListView = new CategoriesListView({category: @model.get('category'), sort: @model.get('sort'), page: 'posts', collection: categoryCollection})

      postsDescription: ->
        @postsDescriptionView = new PostsDescriptionView({description: @model.get('description'), category: @model.get('category'), sort: @model.get('sort')})

      posts: ->
        @postsPreviews = new PostsPreviews({category: @model.get('category'), sort: @model.get('sort'), collection: new PostsPreviewsList(@model.get('postsList'))})
        
      checkErrors: (data) ->
        if data.errors is yes
          @emptyPosts
        else 
          @model.set('postsList', data[@model.get('sort')])
        
)