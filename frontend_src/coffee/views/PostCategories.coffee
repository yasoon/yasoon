define(
  [
    'views/PostCategoryView'
    'backbone'
    'mediator'
  ]
(
  PostCategoryView
) ->
  class PostCategoriesList extends Backbone.View
    tagName: 'ul'

    className: 'list-unstyled panel-body'

    subscriptions:
      'category:checked': 'checkedCategories'

    render: ->
      @collection.each( (category) =>
        @addOne(category)
      )

      @

    addOne: (category) ->
      category = new PostCategoryView({model: category})
      @$el.append(category.render().$el)

    checkedCategories: ->
      checked = @collection.where({'checked': yes})
      categories = _.map(checked, (model) ->
        model.get('id')
      )

      blocked = if categories.length > 2 then yes else no
      @$('input:checkbox:not(:checked)').prop('disabled', blocked)
      categories

    checkedCategoriesNames: ->
      checked = @collection.where({'checked': yes})
      namesList = _.map(checked, (model) ->
        model.get('name')
      )
      namesList.join(', ')

)