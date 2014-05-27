define(
  [
    'backbone'
  ]
(
) ->
  UserModel = Backbone.Model.extend({
    url: '/api/author/getShortuserData'

    initialize: ->
      @deferred = $.Deferred()

      $.get(@url,
        (data) =>
          @set(data.userData)
          admin = @get('roles')[0]
          Window.config.admin = if admin is "ROLE_ADMIN" then yes else no
          Window.config.userId = @get('id')
          @deferred.resolve()
      )
  })
  return new UserModel()
)