define(
  [
    'views/CategoriesListView'
    'views/SpeakersCollectionView'
    'views/EmptyView'
    'collections/CategoryCollection'
    'collections/SpeakersCollection'
    'backbone'
  ]
(
  CategoriesListView
  SpeakersCollectionView
  EmptyView
  CategoryCollection
  SpeakersCollection
) ->
  Backbone.View.extend({
    tagName: 'section'
    className: 'page-layout'

    initialize: (options) ->
      @options = {
        category: options.category || 0
      }
      @description = {
        name: 'THE GLASS BICYCLE',
        description: 'Your digestive tract is probably'
      }
      @createCategoryFilter()

    createCategoryFilter: ->
      category = @options.category
      $.get("/api/category/get_CategoryList",
      (data) =>
        if not @categoriesListView?
          @categoriesListView = new CategoriesListView({
            category: category
            page: 'speakers'
            collection: new CategoryCollection(data)
          })
        else
          @categoriesListView.delegateEvents()
        @$el.append(@categoriesListView.render().$el)
        if parseInt(category) > 0
          @description = _.where(data, id: parseInt(category))[0]
        @createSpeakersPageStories()
      , 'json')

    createSpeakersPageStories: ->
      category = @options.category
      description = @description
      $.get("/api/post/get_categoryPeople/#{category}/1/10",
      (data) =>
        data = data['peoples']
        if data.error is true
          if not @emptyView?
            @emptyView = new EmptyView({
              message: data.errorText
            })
          else
            @emptyView.delegateEvents()
          @$el.append(@emptyView.render().$el)
        else
          if not @SpeakersCollectionView?
            @SpeakersCollectionView = new SpeakersCollectionView({
              category: category
              description: description
              collection: new SpeakersCollection(data)
            })
          else
            @SpeakersCollectionView.delegateEvents()
          @$el.append(@SpeakersCollectionView.render().$el)
      ,'json')
  })
)