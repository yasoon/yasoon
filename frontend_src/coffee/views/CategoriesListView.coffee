define(
  [
    'text!templates/categoriesListTpl.htm'
    'views/CategoryView'
    'backbone'
  ]
(
  categoriesListTpl
  CategoryView
) ->
  Backbone.View.extend({
    tagName: 'aside'
    className: 'left-side'
    template: _.template(categoriesListTpl)

    initialize: (options) ->
      @options = options || {}
      @data = {
        page: @options.page
        sort: @options.sort
        category: @options.category
      }
      
    render: ->
      @$el.empty().append(@template(@data))
      @categoriesList = @$('ul')
      @categories = $('<div></div>')

      @collection.each( (category) =>
        category.set(@data)
        @addOne(category)
      )
      @categoriesList.append(@categories.children())
      @$("a##{@data.category}").addClass('active')

      @

    addOne: (category) ->
      category = new CategoryView({model: category})
      @categories.append(category.render().$el)

  })
)