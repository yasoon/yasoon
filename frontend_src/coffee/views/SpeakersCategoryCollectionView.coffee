define(
  [
    'text!templates/speakersCategoriesTpl.htm'
    'views/SpeakersPageCategoryView'
    'backbone'
  ]
(
  historyCategoriesTpl
  SpeakersPageCategoryView
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'left-side'
    template: _.template(historyCategoriesTpl)

    initialize: (options) ->
      @options = options || {}
      
    render: ->
      data = {
        category: @options.category
      }
      @$el.empty().append(@template(data))
      storyList = @$el.find('ul')

      @collection.each( (model) ->
        storyList.append(new SpeakersPageCategoryView({
          category: data.category
          model: model
        }).render().$el)
      )
      @

  })
)