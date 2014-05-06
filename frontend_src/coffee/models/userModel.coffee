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
          @deferred.resolve()
          window.userId = @get('id')
      )
      
  })
  return new UserModel()
)