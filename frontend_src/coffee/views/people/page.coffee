define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
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

    setActiveCategory: (id) ->
      @activeCategoryId =  parseInt(id)
      @activeCategory = categories[@activeCategoryId]

    initialize: ->
      super
      @setActiveCategory(0)

    events:
      'click .category': (e) ->
        target = $(e.target)
        target.parent().find('.category').each(-> $(@).removeClass('active'))
        target.addClass('active')
        @setActiveCategory(target.attr('id'))
        @render()

    render: ->
      super
      new HeaderView()
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