define(
  [
    "models/UserRegisterModel"
    "backbone"
  ]
  (
    UserRegisterModel
  ) ->
    class UserUpdateModel extends UserRegisterModel
      validate: (attrs) ->
        super
        errors = []
        textTest = /^\S+$/ig

        if not attrs.job
          errors.push(
            name: 'job'
            message: 'Поле не может быть пустым'
          )
        else if not textTest.test(attrs.job)
          errors.push(
            name: 'job'
            message: 'Неверный формат текста'
          )

        if errors.length > 0 then errors else false
)