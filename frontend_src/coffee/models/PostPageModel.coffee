define(
  [
    'backbone'
  ]
() ->
  Backbone.Model.extend({
    defaults:
      text: ''

    validate: (attrs) ->
      errors = []

      if attrs.category.length is 0
        errors.push(
          name: 'categories'
          message: 'Не выбрано ни одной категории'
        )

      if not attrs.title
        errors.push(
          name: 'title'
          message: 'Поле не может быть пустым'
        )

#      if not attrs.description
#        errors.push(
#          name: 'description'
#          message: 'Поле не может быть пустым'
#        )

      if errors.length > 0 then errors else false
  })
)