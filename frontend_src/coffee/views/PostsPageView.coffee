define(
  [
    'views/CategoriesListView'
    'views/PostsPagePreviews'
    'views/PostsDescriptionView'
    'views/EmptyView'
    'views/StatisticPreview'
    'collections/CategoryCollection'
    'collections/PostsPreviewsList'
    'backbone'
    'bootstrap-rating'
  ]
  (
    CategoriesListView
    PostsPreviews
    PostsDescriptionView
    EmptyView
    StatisticPreview
    CategoryCollection
    PostsPreviewsList
  ) ->
    class PostsPageView extends Backbone.View
      tagName: 'section'
      className: 'page-layout'
      
      events: ->
        'click .nav-cat li a': 'checkCategoryChildren'

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
        text = _.getContent(34)
        if $('.items-list').length then $('.items-list').parent().remove()
        if not @emptyView? then @emptyView = new EmptyView({message:text}) else @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)

      setDescription: ->
        description = if parseInt(@model.get('category')) is 0 then [{'id': 0, 'name': 'Все'}] else @model.get('pathData')
        @model.set('description', description)

      createPostsDescription: ->
        @postsDescription()
        @$el.append(@postsDescriptionView.render().$el)
        @getReviewsStatistic()

      createPosts: ->
        if $('.items-list').length then $('.items-list').parent().remove()
        if $('.empty-text').length then $('.empty-text').parent().remove()
        @posts()
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
          @model.trigger('change:postsList')
        
      checkCategoryChildren: (event) ->
        if $(event.currentTarget).attr('data-last') == '0'
          _.each($('.nav-cat li a'), (category) => $(category).removeClass('active'))
          element = $(event.currentTarget)
          $(".nav-cat a:first").addClass('active')
          element.addClass('active')
          event.preventDefault()
          @model.set('category', event.target.id)
          obj = {Url: '#/posts/'+event.target.id+'/' + @model.get('sort') };
          window.history.pushState(obj, 'yasoon', obj.Url)
          $(".cat-title a.active").remove()
          if (event.target.id != '0') then element.clone().insertAfter( ".cat-title a:last" )
          @getReviewsStatistic()
          
      getReviewsStatistic: ->
        if $('.cat-statistic').length then $('.cat-statistic').parent().remove()
        if $('.items-list').length then $('.items-list').parent().remove()
        if $('.empty-text').length then $('.empty-text').parent().remove()
        $.get("/api/post/get_reviewsStatistic/#{@model.get('category')}", (data) => @checkStatisticsErrors(data))

      checkStatisticsErrors: (data) ->
        @getPostsList()
        if data.error is yes
          if $('.cat-statistic').length then $('.cat-statistic').parent().remove()
        else
          @statisticPreview = new StatisticPreview(data.result)
          @$el.append(@statisticPreview.render().$el)
          $('.ratingCategory').rating()
        
         
          
)