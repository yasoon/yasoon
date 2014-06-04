define(
  [
    'models/ValidateModel'
    'backbone'
  ]
  (
    ValidateModel
  ) ->
    class AnswerModel extends ValidateModel
      validate: (attrs) ->
        super
        errors = []

        if not attrs.questionAnswerText
          errors.push(
            name: 'questionAnswerText'
            message: 'Поле не может быть пустым'
          )

        if errors.length > 0 then errors else false
)