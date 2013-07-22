define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/people/header'
         'categories'
         'views/people/authorQueue'
         'models/people/authorQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    categories
    AuthorQueueView
    AuthorQueueModel
) ->
  'use strict'

  class PeoplePageView extends PageView
    className: 'peoplePage'

    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'people_page'

    initialize: (params) ->
      super
      @activeCategoryId =  parseInt(params.catId)
      @activeCategory = categories[@activeCategoryId]

    render: ->
      super
      new HeaderView(catId: @activeCategoryId)
      new FooterView()

      aq = new AuthorQueueModel(categoryId: @activeCategoryId)
      aq.load =>
        aqView = new AuthorQueueView(model: aq)
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