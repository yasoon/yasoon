define(
  [
    'models/ValidateModel'
    'backbone'
  ]
  (
    ValidateModel
  ) ->
    class QuestionModel extends ValidateModel
      validate: (attrs) ->
        super
        errors = []

        if not attrs.question
          errors.push(
            name: 'question'
            message: 'Поле не может быть пустым'
          )

        if errors.length > 0 then errors else false
)