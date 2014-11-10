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
            window.config.admin = if admin is "ROLE_ADMIN" then yes else no
            window.config.userId = @get('id')
            window.config.regFrom = @get('regFrom')
            window.config.friends = @get('friends')
            @deferred.resolve()
          else
            window.config.admin = no
            window.config.userId = no
            window.config.regFrom = @get('regFrom')
            @deferred.resolve()
      )
  })
  return new UserModel()
)