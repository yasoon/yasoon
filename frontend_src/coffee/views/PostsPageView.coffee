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
  Backbone.View.extend({
    tagName: 'section'
    className: 'page-layout'

    initialize: (options) ->
      @category = options.category || 0
      @sort = options.sort || 'dateSort'
      @description = {
        name: 'все отрасли',
        description: 'Your digestive tract is probably'
      }
      @createsCategoryFilter()

    createsCategoryFilter: ->
      category = @category
      sort = @sort
      $.get("/api/category/get_CategoryList",
      (data) =>
        if not @categoriesListView?
          @categoriesListView = new CategoriesListView({
            category: category
            sort: sort
            page: 'posts'
            collection: new CategoryCollection(data)
          })
        else
          @categoriesListView.delegateEvents()
        @$el.append(@categoriesListView.render().$el)
        if parseInt(category) > 0
          @description = _.where(data, id: parseInt(category))[0]
        @createPostsList()
      , 'json')

    createPostsList: ->
      options = {
        description: @description
        category: @category
        sort: @sort
      }
      $.get("/api/post/get_categoryPosts/#{@category}/1/10", (data) =>
        data = data[@sort]
        if data.length > 0
          @createPostsDescription(options)
          @createPosts(data, @sort, @category)
        else
          if not @emptyView?
            @emptyView = new EmptyView({
              message: 'В этой категории нет постов!'
            })
          else
            @emptyView.delegateEvents()
          @$el.append(@emptyView.render().$el)
      ,'json')

    createPostsDescription: (options) ->
      if not @postsDescriptionView?
        @postsDescriptionView = new PostsDescriptionView(options)
      else
        @postsDescriptionView.delegateEvents()
      @$el.append(@postsDescriptionView.render().$el)

    createPosts: (data, sort, category) ->
      if not @postsPreviews?
        @postsPreviews = new PostsPreviews({
          category: category
          sort: sort
          collection: new PostsPreviewsList(data)
        })
      else
        @postsPreviews.delegateEvents()
      @$el.append(@postsPreviews.render().$el)

  })
)