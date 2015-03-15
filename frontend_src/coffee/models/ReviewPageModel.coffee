define(
  [
    'backbone'
  ]
() ->
  Backbone.Model.extend({
#    defaults:
#      text: ''

    validate: (attrs) ->
      errors = []


      if not attrs.title
        errors.push(
          name: 'title'
          message: 'Поле не может быть пустым'
        )

      if not attrs.text
        errors.push(
          name: 'text'
          message: 'Поле не может быть пустым'
        )
        
      if not attrs.description
        errors.push(
          name: 'description'
          message: 'Поле не может быть пустым'
        )
        
        
      if not attrs.review-type
        errors.push(
          name: 'review-type[]'
          message: 'Необходимо выбрать хотя бы одно значение'
        )

      if errors.length > 0 then errors else false
  })
)