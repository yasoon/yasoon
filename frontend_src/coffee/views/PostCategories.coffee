define(
  [
    'views/PostCategoryView'
    'backbone'
  ]
(
  PostCategoryView
) ->
  Backbone.View.extend({
    initialize: (options) ->
      @options = options || {}
      @data = {
        page: @options.page
        sort: @options.sort
        category: @options.category
      }
      
    render: ->
      @categoriesList = $('<ul class="list-unstyled"></ul>')

      @collection.each( (category) =>
        category.set(@data)
        @addOne(category)
      )
      @$el.empty().append(@categoriesList)
      @$("a##{@data.category}").addClass('active')

      @

    addOne: (category) ->
      category = new PostCategoryView({model: category})
      @categoriesList.append(category.render().$el)

  })
)