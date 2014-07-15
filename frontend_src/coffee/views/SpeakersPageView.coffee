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
    class SpeakersPageView extends Backbone.View
      tagName: 'section'
      className: 'page-layout'

      initialize: (options) ->
        @model.set({'category': options.category})
        @setListeners()
        @getCategoryList()

      setListeners: ->
        @listenTo(@model, 'change:categoryList', @createCategoryFilter)
        @listenTo(@model, 'change:description', @getSpeakersList)
        @listenTo(@model, 'change:speakersList', @createSpeakersList)

      getCategoryList: ->
        @model.set('categoryList', Window.config.category)

      createCategoryFilter: ->
        if not @categoriesListView? then @categories() else @categoriesListView.delegateEvents()
        @$el.append(@categoriesListView.render().$el)
        @setDescription()

      setDescription: ->
        description = if parseInt(@model.get('category')) is 0 then {'name': 'все отрасли'} else _.where(@model.get('categoryList'), id: parseInt(@model.get('category')))[0]
        @model.set('description', description)

      categories: ->
        categoryCollection = new CategoryCollection(@model.get('categoryList'))
        @categoriesListView = new CategoriesListView({category: @model.get('category'), page: 'speakers', collection: categoryCollection})

      getSpeakersList: ->
        $.get("/api/post/get_categoryPeople/#{@model.get('category')}/1/10", (data) => @model.set('speakersList', data['peoples']))

      createSpeakersList: ->
        data = @model.get('speakersList')
        if data.length > 0 then @speakersList() else @emptyList()

      speakersList: ->
        if not @speakersCollectionView? then @speakers() else @speakersCollectionView.delegateEvents()
        @$el.append(@speakersCollectionView.render().$el)

      speakers: ->
        speakersCollection = new SpeakersCollection(@model.get('speakersList'))
        @speakersCollectionView = new SpeakersCollectionView({category: @model.get('category'), description: @model.get('description'), collection: speakersCollection})

      emptyList: ->
        if not @emptyView? then @emptyView = new EmptyView({message: _.getContent(33)}) else @emptyView.delegateEvents()
        @$el.append(@emptyView.render().$el)
)