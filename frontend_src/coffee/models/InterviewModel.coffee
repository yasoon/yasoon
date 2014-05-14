define(
  [
    'models/ValidateModel'
    'backbone'
  ]
(
  ValidateModel
) ->
  class PostInterview extends ValidateModel
    validate: (attrs) ->
      super
      errors = []

      if not attrs.text
        errors.push(
          name: 'text'
          message: 'Поле не может быть пустым'
        )

      if errors.length > 0 then errors else false
)