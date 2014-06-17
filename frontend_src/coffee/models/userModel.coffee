define(
  [
    'backbone'
  ]
(
) ->
  UserModel = Backbone.Model.extend({
    url: '/api/author/getShortUserData'

    initialize: ->
      @deferred = $.Deferred()

      $.get(@url,
        (data) =>
          if data
            @set(data)
            admin = @get('roles')[0]
            Window.config.admin = if admin is "ROLE_ADMIN" then yes else no
            Window.config.userId = @get('id')
            Window.config.regFrom = @get('regFrom')
            Window.config.friends = @get('friends')
            @deferred.resolve()
          else
            Window.config.admin = no
            Window.config.userId = no
            Window.config.regFrom = @get('regFrom')
            @deferred.resolve()
      )
  })
  return new UserModel()
)