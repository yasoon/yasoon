define(
  [
    'models/ValidateModel'
    "backbone"
  ]
  (
    ValidateModel
  ) ->
    class UserUpdateModel extends ValidateModel
      validate: (attrs) ->
        errors = []
        emailTest = /^[\.\w_]{2,}[@][\w_\-]{2,}[.][\w_\-]{0,4}$/
        passwordTest = /^[\.\w_]{2,}$/
        passwordMaxLength = 10

        if not attrs.name
          errors.push(
            name: 'name'
            message: 'Поле не может быть пустым'
          )

        if typeof window.config.regFrom is "undefined" or parseInt(window.config.regFrom) is 0
          if not attrs.email
            errors.push(
              name: 'email'
              message: 'Поле не может быть пустым'
            )
          else if not emailTest.test(attrs.email)
            errors.push(
              name: 'email'
              message: 'Неверный формат email'
            )

        if not attrs.password?.length > passwordMaxLength
          errors.push(
            name: 'password'
            message: 'Слишком длинный пароль'
          )

        if errors.length > 0 then errors else false
)