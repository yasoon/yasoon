define(
  [
    'backbone'
  ]
() ->
  Backbone.Model.extend({
    validate: (attrs) ->
      errors = []
      textTest = /^\S+$/ig

      if attrs.categories.length < 0
        errors.push(
          name: 'categories'
          message: 'Не выбрано ни одной категории'
        )

      if errors.length > 0 then errors else false
  })
)