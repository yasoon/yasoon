define(
  [
    'text!templates/historyCategoriesTpl.htm'
    'views/HistoryPageCategoryView'
    'backbone'
  ]
(
  historyCategoriesTpl
  HistoryPageCategoryView
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'left-side'
    template: _.template(historyCategoriesTpl)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      data = {
        sort: @options.sort
        category: @options.category
      }
      @$el.empty().append(@template(data))
      storyList = @$el.find('ul')

      @collection.each( (model) ->
        storyList.append(new HistoryPageCategoryView({
          sort: data.sort
          category: data.category
          model: model
        }).render().$el)
      )
      @

  })
)