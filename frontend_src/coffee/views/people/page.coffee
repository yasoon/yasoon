define [
         'views/base/page'
         'JST'
         'views/common/footer'
         'views/author/posts/header'
         'categories'
#         'views/author/posts/postQueue'
#         'models/author/posts/postQueue'
], (PageView,
    JST,
    FooterView,
    HeaderView,

    categories
#    PostQueueView,
#    PostQueueModel

) ->
  'use strict'

  class PeoplePageView extends PageView
    className: 'peoplePage'

    regions:
      '#queue': 'queue'
      'footer': 'footer'
      'header': 'header'

    templateName: 'people_page'

    setActiveCategory: (id) =>
      @activeCategoryId = id
      @activeCategory = categories[@activeCategoryId]

    initialize: ->
      super
      @setActiveCategory(1)

    events:
      'click .category': (e) ->
        target = $(e.target)
        target.parent().find('.category').each(-> $(@).removeClass('active'))
        target.addClass('active')
        @setActiveCategory(target.attr('id'))
        @render()

    render: ->
      super
      hv = new HeaderView()
      fv = new FooterView()

#      qqModel = (new PostQueueModel(authorId: @authorId)).load =>
#        qqView = new PostQueueView(model:  qqModel)
#        qqView.setRegion('queue').render()

    getTemplateData: ->
      console.log @activeCategoryId
      {categories: categories, activeCategory: @activeCategory, activeCatId: @activeCategoryId}