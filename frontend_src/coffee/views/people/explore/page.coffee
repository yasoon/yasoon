define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/people/header'
         'categories'
         'views/people/explore/postQueue'
         'models/people/explore/postQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    categories
    PostQueueView
    PostQueueModel
) ->
  'use strict'

  class PeopleExplorePageView extends PageView
    className: 'peopleExplorePage'

    regions:
      'queue': '#queue'
      'footer': 'footer'
      'header': 'header'
    templateName: 'people_explore_page'

    initialize: (params) ->
      super
      @activeCategoryId =  parseInt(params.catId)
      @activeCategory = categories[@activeCategoryId]
      @mode = params.mode

    render: ->
      super
      new HeaderView(catId: @activeCategoryId, mode: @mode)
      new FooterView()

      aq = new PostQueueModel(categoryId: @activeCategoryId, mode: @mode)
      aq.load =>
        aqView = new PostQueueView(model: aq)
        aqView.setRegion('queue').render()
        console.log aq


      activeCategoryId = @activeCategoryId
      mode = @mode
      @$el.find('.category').each(->
        if  parseInt($(@).attr('id')) is activeCategoryId
          $(@).addClass('active')
        else
          $(@).removeClass('active')

        $(@).attr('href', "#explore/#{mode}/"+$(@).attr('href') );
      )

      if @mode is 'date'
        @$el.find('#dateButton').addClass('active')
      else
        @$el.find('#ratingButton').addClass('active')


    getTemplateData: ->
      for cat in categories
        cat.mode = @mode
      {categories: categories, activeCategory: @activeCategory, activeCatId: @activeCategoryId, mode: @mode}