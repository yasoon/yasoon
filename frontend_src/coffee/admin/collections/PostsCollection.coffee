define(
  [
    'admin/models/PostModel'
    'backbone'
  ]
  (
    PostModel
  )->
    Backbone.Collection.extend({
      model: PostModel
      url: ->
        counter = @size() % 10 + 1
        "/admin/get_posts/#{counter}/10"
    })
)