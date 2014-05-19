define(
  [
    'models/ValidateModel'
    'backbone'
  ]
  (
    ValidateModel
  ) ->
    class UserLoginModel extends ValidateModel
      validate: (attrs) ->
        super
        errors = []

        if not attrs.questionAnswerText
          errors.push(
            name: 'email'
            message: 'Поле не может быть пустым'
          )

        if errors.length > 0 then errors else false
)