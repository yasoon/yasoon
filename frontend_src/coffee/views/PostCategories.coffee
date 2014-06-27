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
      @collection.each((category) => @addOne(category))
      @

    addOne: (category) ->
      category = new PostCategoryView({model: category})
      @$el.append(category.render().$el)

    checkedCategories: ->
      categories = _.map(@collection.where({'checked': yes}), (model) -> model.get('id'))
      block = if categories.length > 2 then on else off
      @$('input:checkbox:not(:checked)').prop('disabled', block)
      categories

    checkedCategoriesNames: ->
      namesList = _.map(@collection.where({'checked': yes}), (model) -> model.get('name'))
      namesList.join(', ')

)