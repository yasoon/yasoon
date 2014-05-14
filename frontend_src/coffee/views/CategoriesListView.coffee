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

      @collection.each( (category) =>
        category.set(@data)
        @addOne(category)
      )
      @$("a##{@data.category}").addClass('active')

      @

    addOne: (category) ->
      category = new CategoryView({model: category})
      @categoriesList.append(category.render().$el)

  })
)