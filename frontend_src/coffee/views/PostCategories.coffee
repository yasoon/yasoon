define(
  [
    'views/PostCategoryView'
    'backbone'
  ]
  (
    PostCategoryView
  ) ->
    class PostCategoriesList extends Backbone.View
      tagName: 'ul'

      className: 'list-unstyled panel-body'

      events: ->
        'check :checkbox': 'checkCategory'

      render: ->
        @collection.each((category) => @addOne(category))
        @

      addOne: (category) ->
        category = new PostCategoryView({model: category})
        @$el.append(category.render().$el)

      checkCategory: (event) ->
        block = if categories.length > 2 then on else off
        @$('input:checkbox:not(:checked)').prop('disabled', block)

      checkedCategories: ->
        _.map(@$('input:checkbox:checked'), (item) -> $(item).val())
)