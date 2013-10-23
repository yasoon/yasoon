define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/people/header'
         'categories'
         'views/people/authorQueue'
         'models/people/authorQueue'
         'models/people/authorSearch'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    categories
    AuthorQueueView
    AuthorQueueModel
    AuthorSearchModel
) ->
  'use strict'

  class PeoplePageView extends PageView
    className: 'peoplePage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'people_page'

    initialize: (params) ->
      super
      @activeCategoryId =  parseInt(params.catId)
      @activeCategory = categories[@activeCategoryId]
      @searchText = params.text

    render: ->
      super
      new HeaderView(catId: @activeCategoryId)
      new FooterView()

      if not @searchText
        aq = new AuthorQueueModel(categoryId: @activeCategoryId)
        aq.load =>
          aqView = new AuthorQueueView(model: aq)
          aqView.setRegion('queue').render()
      else
        as = new AuthorSearchModel(text: @searchText)
        as.load =>
          aqView = new AuthorQueueView(model: as)
          aqView.setRegion('queue').render()

      activeCategoryId = @activeCategoryId
      @$el.find('.category').each(->
        if  parseInt($(@).attr('id')) is activeCategoryId
          $(@).addClass('active')
        else
          $(@).removeClass('active')
      )

    getTemplateData: ->
      {categories: categories, activeCategory: @activeCategory, activeCatId: @activeCategoryId}

    events:
      'keypress .search': (e) ->
        if e.which is 13
            searchText = $(e.currentTarget).val()
            @publishEvent 'redirect', 'search/author/'+searchText
            @dispose()