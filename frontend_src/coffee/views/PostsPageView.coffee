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
        if parseInt(@model.get('category')) is 0 then @model.set('categoryList', window.config.category) else @getCategories()

      getCategories: ->
        $.get("/api/post/get_categories/"+parseInt(@model.get('category')), (data) => @checkCategoryErrors(data))
      
      checkCategoryErrors: (data) ->
        if data.error is yes then @model.set('categoryList', window.config.category)
        else @setDataCategories(data) 

        
      setDataCategories:(data) ->
        @model.set('parent', data.result.parent)
        @model.set('pathData', data.path)
        if data.result.categories? then @model.set('categoryList', data.result.categories)
        else @createsCategoryFilter()
 
      createsCategoryFilter: ->
        @categoryList()
        @$el.append(@categoryListView.render().$el)
        @setDescription()

      getPostsList: ->
        $.get("/api/post/get_categoryPosts/#{@model.get('category')}/1/10/#{@model.get('sort')}", (data) => @checkErrors(data))

      createPostsList: ->
        if @model.get('postsList').length > 0 then @createPosts() else @emptyPosts()

      emptyPosts: (errorText = null)->
        text = errorText  ? _.getContent(34)
        if not @emptyView? then @emptyView = new EmptyView({message:text}) else @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)

      setDescription: ->
        description = if parseInt(@model.get('category')) is 0 then [{'id': 0, 'name': 'все отрасли'}] else @model.get('pathData')
        @model.set('description', description)

      createPostsDescription: ->
        @postsDescription()
        @$el.append(@postsDescriptionView.render().$el)
        @getPostsList()

      createPosts: ->
        if not @postsPreviews? then @posts() else @postsPreviews.delegateEvents()
        @$el.append(@postsPreviews.render().$el)

      categoryList: ->
        categoryCollection = new CategoryCollection(@model.get('categoryList'))
        @categoryListView = new CategoriesListView({category: @model.get('category'), sort: @model.get('sort'), page: 'posts', collection: categoryCollection, parent: @model.get('parent')})

      postsDescription: ->
        @postsDescriptionView = new PostsDescriptionView({description: @model.get('description'), category: @model.get('category'), sort: @model.get('sort')})

      posts: ->
        @postsPreviews = new PostsPreviews({category: @model.get('category'), sort: @model.get('sort'), collection: new PostsPreviewsList(@model.get('postsList'))})
        
      checkErrors: (data) ->
        if data.error is yes
          @emptyPosts(data.errorText)
        else 
          @model.set('postsList', data[@model.get('sort')])
        
)