define(
  [
    'models/ValidateModel'
    'backbone'
  ]
(
  ValidateModel
) ->
  class UserRegisterModel extends ValidateModel
    validate: (attrs) ->
      super
      errors = []
      emailTest = /^[\.\w_]{2,}[@][\w_\-]{2,}[.][\w_\-]{0,4}$/
      passwordTest = /^[\.\w_]{2,}$/
      textTest = /^\S+$/ig
      passwordMaxLength = 10

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

      if not attrs.password
        errors.push(
          name: 'password'
          message: 'Поле не может быть пустым'
        )
      else if not passwordTest.test(attrs.password)
        errors.push(
          name: 'password'
          message: 'Неверный формат пароля'
        )
      else if not attrs.password.length > passwordMaxLength
        errors.push(
          name: 'password'
          message: 'Слишком длинный пароль'
        )

      if not attrs.name
        errors.push(
          name: 'name'
          message: 'Поле не может быть пустым'
        )
      else if not textTest.test(attrs.name)
        errors.push(
          name: 'name'
          message: 'Неверный формат имени'
        )

      if errors.length > 0 then errors else false
)